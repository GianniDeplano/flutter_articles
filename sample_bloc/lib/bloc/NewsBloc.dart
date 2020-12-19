import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsEvents.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';
import 'package:sample_bloc/data/repository/TheGuardianRepository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final TheGuardianRepository repository;

  NewsBloc({@required this.repository})
      : assert(repository != null),
        super(NewsEmptyState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNewsEvent) {
      yield* _doFetch(event);
    } else if (event is RefreshNewsEvent) {
      yield* _doRefresh(event);
    } else if (event is ResetNewsEvent) {
      yield* _doReset(event);
    } else {
      throw Exception("Unhandled News Event");
    }
  }

  Stream<NewsState> _doFetch(FetchNewsEvent event) async* {
    yield NewsLoadingState();

    try {
      var items = await repository.getItems(event.topic);
      yield NewsLoadedState(news: items);
    } catch (error) {
      print(error);
      yield NewsErrorState();
    }
  }

  Stream<NewsState> _doRefresh(RefreshNewsEvent event) async* {
    yield NewsLoadingState();

    try {
      var items = await repository.getItems(event.topic);
      yield NewsLoadedState(news: items);
    } catch (error) {
      print(error);
      yield NewsErrorState();
    }
  }

  Stream<NewsState> _doReset(ResetNewsEvent event) async* {
    yield NewsEmptyState();
  }
}

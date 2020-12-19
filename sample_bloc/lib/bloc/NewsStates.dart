import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc/data/models/listapi.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmptyState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<SearchApiItemModel> news;

  NewsLoadedState({@required this.news}) : assert(news != null);

  @override
  List<Object> get props => [news];
}

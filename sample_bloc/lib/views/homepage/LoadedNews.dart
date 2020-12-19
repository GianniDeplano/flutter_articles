import 'package:flutter/material.dart';
import 'package:sample_bloc/bloc/BlockUtils.dart';
import 'package:sample_bloc/bloc/NewsEvents.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';
import 'package:sample_bloc/views/homepage/ListItem.dart';

class LoadedView extends StatelessWidget {
  final NewsState state;

  LoadedView(this.state);

  @override
  Widget build(BuildContext context) {
    if (!(state is NewsLoadedState)) {
      BlocUtils().event(context, ErrorNewsEvent());
      return null;
    }

    NewsLoadedState _state = state;

    List<ListItem> items = [];
    for (var news in _state.news) {
      items.add(ListItem(news));
    }

    return ListView(
      children: items,
    );
  }
}

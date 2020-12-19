import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsBloc.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';
import 'package:sample_bloc/views/homepage/EmptyView.dart';
import 'package:sample_bloc/views/homepage/ErrorView.dart';
import 'package:sample_bloc/views/homepage/LoadedNews.dart';
import 'package:sample_bloc/views/homepage/LoadingView.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
            listener: (context, NewsState state) {},
            builder: (context, NewsState state) {
              print(state);
              if (state is NewsLoadingState) return LoadingView();
              if (state is NewsEmptyState)
                return EmptyView();
              else if (state is NewsErrorState)
                return ErrorView();
              else if (state is NewsLoadedState)
                return LoadedView();
              else
                return Container();
            }));
  }
}

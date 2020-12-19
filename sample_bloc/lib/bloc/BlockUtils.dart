import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsBloc.dart';
import 'package:sample_bloc/bloc/NewsEvents.dart';

class BlocUtils {
  static final BlocUtils _singleton = BlocUtils._internal();

  factory BlocUtils() {
    return _singleton;
  }

  BlocUtils._internal();

  void event(BuildContext context, NewsEvent event) {
    BlocProvider.of<NewsBloc>(context).add(event);
  }
}

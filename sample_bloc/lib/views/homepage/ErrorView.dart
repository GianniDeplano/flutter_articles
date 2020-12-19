import 'package:flutter/material.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';

class ErrorView extends StatelessWidget {
  final NewsState state;

  ErrorView(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("error"));
  }
}

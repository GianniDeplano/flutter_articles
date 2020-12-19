import 'package:flutter/material.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';

class LoadedView extends StatelessWidget {
  final NewsState state;

  LoadedView(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}

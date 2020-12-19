import 'package:flutter/material.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';

class LoadingView extends StatelessWidget {
  final NewsState state;

  LoadingView(this.state);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFF0000FF),
        ));
  }
}

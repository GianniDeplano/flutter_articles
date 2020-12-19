import 'package:flutter/material.dart';
import 'package:sample_bloc/bloc/BlockUtils.dart';
import 'package:sample_bloc/bloc/NewsEvents.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';

class EmptyView extends StatelessWidget {
  final NewsState state;

  EmptyView(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/nocontentyet.png",
            height: 150,
          ),
        ),
        SizedBox(height: 30),
        OutlineButton(
          onPressed: () {
            BlocUtils().event(context, FetchNewsEvent(topic: "Mobile Trends"));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Click here to load contents"),
          ),
        )
      ],
    );
  }
}

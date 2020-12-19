import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsBloc.dart';
import 'package:sample_bloc/bloc/NewsEvents.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffeeeeee),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/nocontentyet.jpg")),
            SizedBox(height: 50),
            OutlineButton(
                child: Text("Load News"),
                onPressed: () {
                  print("Request fetch news");
                  BlocProvider.of<NewsBloc>(context)
                      .add(FetchNewsEvent(topic: "Mobile Apps"));
                })
          ],
        ));
  }
}

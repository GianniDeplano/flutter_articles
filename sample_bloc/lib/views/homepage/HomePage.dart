import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/NewsBloc.dart';
import 'package:sample_bloc/bloc/NewsStates.dart';
import 'package:sample_bloc/views/homepage/EmptyView.dart';
import 'package:sample_bloc/views/homepage/ErrorView.dart';
import 'package:sample_bloc/views/homepage/LoadedNews.dart';
import 'package:sample_bloc/views/homepage/LoadingView.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  static final String route = "homepage";
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Color(0xFF0000FF), BlendMode.color),
                image: AssetImage("assets/images/hpbackground.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(children: [
                          Expanded(
                              flex: 5,
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container())),
                          Expanded(
                              flex: 5,
                              child: GestureDetector(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Icon(
                                      CupertinoIcons.share,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Share.share("MEDIUM_URL",
                                      subject: "MEDIUM ARTICLE TITLE");
                                },
                              )),
                        ]))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          color: Color(0xFF059BE5),
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(CupertinoIcons.device_phone_portrait,
                              size: 50, color: Colors.white),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260),
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                        )),
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 10, right: 10, bottom: 10),
                      child: BlocConsumer<NewsBloc, NewsState>(
                          listener: (context, NewsState state) {},
                          builder: (context, NewsState state) {
                            print(state);
                            if (state is NewsLoadingState)
                              return LoadingView(state);
                            if (state is NewsEmptyState)
                              return EmptyView(state);
                            else if (state is NewsErrorState)
                              return ErrorView(state);
                            else if (state is NewsLoadedState)
                              return LoadedView(state);
                            else
                              return Container();
                          }),
                    ))),
          )
        ],
      ),
    );
  }
}

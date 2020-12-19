import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sample_bloc/data/models/listapi.dart';
import 'package:share/share.dart';

class NewsDetailArgs {
  final SearchApiItemModel news;
  NewsDetailArgs(this.news);
}

class NewsDetail extends StatefulWidget {
  static final String route = "homepage_detail";
  NewsDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  NewsDetailArgs _args;

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF059BE5),
        leading: GestureDetector(
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: 24,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(_args.news.webTitle),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                CupertinoIcons.share,
                color: Colors.white,
                size: 24,
              ),
            ),
            onTap: () {
              Share.share(_args.news.webUrl, subject: _args.news.webTitle);
            },
          )
        ],
      ),
      body: InAppWebView(
        initialUrl: _args.news.webUrl,
        initialHeaders: {},
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          cacheEnabled: true,
          javaScriptEnabled: true,
          debuggingEnabled: true,
        )),
      ),
    );
  }
}

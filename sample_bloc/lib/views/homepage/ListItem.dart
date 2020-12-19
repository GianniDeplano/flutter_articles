import 'package:flutter/material.dart';
import 'package:sample_bloc/data/models/listapi.dart';
import 'package:sample_bloc/views/detail/NewsDetail.dart';
import 'package:share/share.dart';

class ListItem extends StatelessWidget {
  final SearchApiItemModel news;
  ListItem(this.news);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(news.webTitle),
              subtitle: Text(news.sectionName),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('SHARE'),
                  onPressed: () {
                    Share.share(news.webUrl, subject: news.webTitle);
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('READ'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(NewsDetail.route,
                        arguments: NewsDetailArgs(news));
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

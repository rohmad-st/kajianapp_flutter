import 'package:flutter/material.dart';
import 'package:kajianapp/models/chapter.dart';

class ChapterTile extends StatelessWidget {
  final Chapter _chapter;
  final String imageUrl =
      'https://assets-ouch.icons8.com/preview/216/d44fc9a4-29f4-4057-b012-200efc260e4b.png';
  ChapterTile(this._chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          title: Text(_chapter.name),
          subtitle: Text(_chapter.teacher.name),
          leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Image.network(
              imageUrl,
              height: 50.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}

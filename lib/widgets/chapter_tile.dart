import 'package:flutter/material.dart';
import 'package:kajianapp/models/chapter.dart';

class ChapterTile extends StatelessWidget {
  final Chapter _chapter;
  ChapterTile(this._chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(_chapter.name),
          subtitle: Text(_chapter.teacher.name),
          leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Image.asset(
              'images/study_illustration.png',
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

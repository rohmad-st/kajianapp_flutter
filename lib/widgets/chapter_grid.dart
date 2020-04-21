import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kajianapp/models/chapter.dart';
import 'package:kajianapp/screens/chapter.dart' as Screens;

class ChapterGrid extends StatelessWidget {
  final Chapter _chapter;
  ChapterGrid(this._chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: 180,
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.symmetric(horizontal: 8),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screens.Chapter(chapter: _chapter),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Column(
                children: <Widget>[
                  Text(
                    _chapter.name,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    _chapter.teacher.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.blue[100],
          ),
        ),
      ],
    );
  }
}

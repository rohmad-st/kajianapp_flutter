import 'package:flutter/material.dart';
import 'package:kajianapp/models/chapter.dart';
import 'package:kajianapp/screens/chapter.dart' as Screens;

class ChapterGrid extends StatelessWidget {
  final Chapter _chapter;
  ChapterGrid(this._chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: <Widget>[
                  Text(
                    _chapter.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    _chapter.teacher.name,
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
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.lightBlueAccent.withOpacity(0.3),
                BlendMode.dstATop,
              ),
              image: NetworkImage(_chapter.image),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

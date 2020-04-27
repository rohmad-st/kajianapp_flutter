import 'package:flutter/material.dart';
import 'package:kajianapp/models/chapter.dart';
import 'package:kajianapp/screens/chapter.dart' as Screens;

class ChapterTile extends StatelessWidget {
  final Chapter _chapter;
  ChapterTile(this._chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screens.Chapter(chapter: _chapter),
              ),
            );
          },
          title: Text(_chapter.name),
          subtitle: Text(_chapter.teacher.name),
          leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: Image.network(
              _chapter.image,
              width: 60.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Divider()
      ],
    );
//    return Center(
//      child: Card(
//        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//        child: Column(
////          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            ListTile(
//              leading: Icon(Icons.book),
//              title: Text(_chapter.name),
//              subtitle: Text(_chapter.teacher.name),
//            ),
//            ButtonBar(
//              children: <Widget>[
//                FlatButton(
//                  child: const Text('Save'),
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) =>
//                            Screens.Chapter(chapter: _chapter),
//                      ),
//                    );
//                  },
//                ),
//                FlatButton(
//                  child: const Text('Play'),
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) =>
//                            Screens.Chapter(chapter: _chapter),
//                      ),
//                    );
//                  },
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
  }
}

import 'package:flutter/material.dart';
import 'package:kajianapp/models/category.dart';
import 'package:kajianapp/models/chapters.dart';
import 'package:kajianapp/repository/chapters_repository.dart';
import 'package:kajianapp/utils/network.dart';
import 'package:kajianapp/widgets/chapter_grid.dart';
import 'package:kajianapp/widgets/loading_view.dart';

class ChaptersByCategory extends StatefulWidget {
  final Category category;

  ChaptersByCategory({Key key, this.category}) : super(key: key);

  @override
  _ChaptersByCategoryState createState() => _ChaptersByCategoryState();
}

class _ChaptersByCategoryState extends State<ChaptersByCategory> {
  Future<Chapters> _chapters;

  @override
  void initState() {
    // load categories & chapters while internet is connected
    isConnected().then((internet) {
      if (internet) {
        setState(() {
          _chapters = getChaptersByCategory(widget.category.id.toString());
        });
      } else {
        /* Display dialog with no internet connection message */
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Pembelajaran di ${widget.category.name}',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 0.2,
                height: 1.8,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<Chapters>(
                future: _chapters,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return loadingView();
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data.chapters.length,
                        itemBuilder: (context, index) => ChapterGrid(
                          snapshot.data.chapters[index],
                        ),
                      );
                      break;
                    case ConnectionState.none:
                      break;
                  }
                  return loadingView();
                }),
          )
        ],
      ),
    );
  }
}

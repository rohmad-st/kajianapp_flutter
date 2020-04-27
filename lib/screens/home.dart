import 'package:flutter/material.dart';
import 'package:kajianapp/models/categories.dart';
import 'package:kajianapp/models/chapters.dart';
import 'package:kajianapp/repository/categories_repository.dart';
import 'package:kajianapp/repository/chapters_repository.dart';
import 'package:kajianapp/utils/network.dart';
import 'package:kajianapp/widgets/bottom_menu.dart';
import 'package:kajianapp/widgets/categories_container.dart';
import 'package:kajianapp/widgets/chapter_tile.dart';
import 'package:kajianapp/widgets/loading_view.dart';
import 'package:package_info/package_info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Kajian Tematik';
  Future<Categories> _categories;
  Future<Chapters> _chapters;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        title = packageInfo.appName;
      });
    });

    // load categories & chapters while internet is connected
    isConnected().then((internet) {
      if (internet) {
        setState(() {
          _categories = getCategories();
          _chapters = getChapters();
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
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          CategoriesContainer(_categories),
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
                    return Column(
                      children: <Widget>[
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Pembelajaran',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0.2,
                              height: 1.8,
                            ),
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.chapters.length,
                            itemBuilder: (context, index) => ChapterTile(
                              snapshot.data.chapters[index],
                            ),
                          ),
                        ),
                      ],
                    );
                    break;
                  case ConnectionState.none:
                    break;
                }
                return loadingView();
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(height: 50),
        color: Colors.blue[300],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomMenu(context);
        },
        tooltip: 'Profile',
        child: Icon(Icons.menu),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

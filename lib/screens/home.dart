import 'package:flutter/material.dart';
import 'package:kajianapp/models/category.dart';
import 'package:kajianapp/models/chapter.dart';
import 'package:kajianapp/repository/category_repository.dart';
import 'package:kajianapp/repository/chapter_repository.dart';
import 'package:kajianapp/widgets/categories_container.dart';
import 'package:kajianapp/widgets/chapter_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final title = 'Kajian App';
  List<Category> _categories = <Category>[];
  List<Chapter> _chapters = <Chapter>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenForCategories();
    listenForChapters();
  }

  void listenForCategories() async {
    final Stream<Category> stream = await getCategories();

    stream.listen(
        (Category category) => setState(() => _categories.add(category)));
  }

  void listenForChapters() async {
    final Stream<Chapter> stream = await getChapters();

    stream.listen((Chapter chapter) => setState(() => _chapters.add(chapter)));
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
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Chapter',
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
              itemCount: _chapters.length,
              itemBuilder: (context, index) => ChapterTile(_chapters[index]),
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
        onPressed: () {},
        tooltip: 'Category',
        child: Icon(Icons.list),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

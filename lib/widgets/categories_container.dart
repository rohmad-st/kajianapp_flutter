import 'package:flutter/material.dart';
import 'package:kajianapp/models/category.dart';

class CategoriesContainer extends StatelessWidget {
  final List<Category> _categories;
  CategoriesContainer(this._categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: EdgeInsets.all(8.0),
      height: 80,
      child: ListView.builder(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          color: Colors.grey[200],
//          width: 100,
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            _categories[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

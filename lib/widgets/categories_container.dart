import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kajianapp/models/categories.dart';
import 'package:kajianapp/widgets/loading_view.dart';
import 'package:kajianapp/widgets/nodata_view.dart';

class CategoriesContainer extends StatelessWidget {
  final Future<Categories> _categories;
  CategoriesContainer(this._categories);

  @override
  Widget build(BuildContext context) {
    final String title = 'Categories';

    return Column(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.2,
              height: 1.8,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          height: 100,
          child: FutureBuilder<Categories>(
            future: _categories,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  return ListView.builder(
                    itemCount: snapshot.data.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: 110,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Text(
                        snapshot.data.categories[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.4,
                          color: Colors.grey[100],
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.lightBlueAccent.withOpacity(0.3),
                            BlendMode.dstATop,
                          ),
                          image: AssetImage('images/category_illustration.png'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.grey[400],
                      ),
                    ),
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
    );
  }
}

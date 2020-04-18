import 'package:flutter/material.dart';
import 'package:kajianapp/models/content.dart';

class ContentTile extends StatelessWidget {
  final Content _content;
  final int _index;
  final Function _onPlayButtonClicked;
  final bool _isPlaying;

  ContentTile(
    this._content,
    this._index,
    this._onPlayButtonClicked,
    this._isPlaying,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Text(
            (_index + 1).toString(),
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0),
          ),
        ),
        title: Text(
          _content.name,
          style: TextStyle(color: Colors.black87),
        ),
        trailing: RawMaterialButton(
          onPressed: () {
            _onPlayButtonClicked(_content);
          },
          child: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 18,
          ),
          shape: CircleBorder(),
          elevation: 1,
          fillColor: Colors.cyan[400],
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}

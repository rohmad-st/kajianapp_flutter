import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:kajianapp/models/chapter.dart' as Models;
import 'package:kajianapp/models/content.dart';
import 'package:kajianapp/repository/content_repository.dart';
import 'package:kajianapp/widgets/content_tile.dart';

class Chapter extends StatefulWidget {
  final Models.Chapter chapter;

  Chapter({Key key, this.chapter}) : super(key: key);

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  List<Content> _contents = <Content>[];
  String _sourceUrl = 'https://www.youtube.com/watch?v=h_QLMFUu5Uo';

  @override
  void initState() {
    super.initState();
    listenForContents();
  }

  void listenForContents() async {
    final Stream<Content> stream = await getContents();

    stream.listen((Content content) => setState(() => _contents.add(content)));

    setState(() {
      _sourceUrl = _contents[0].sourceUrl;
    });
  }

  static String getIdFromUrl(String url, [bool trimWhitespaces = true]) {
    if (url == null || url.isEmpty) {
      return null;
    }

    if (trimWhitespaces) {
      url = url.trim();
    }

    for (RegExp exp in _regexps) {
      final Match match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) {
        return match.group(1);
      }
    }

    return null;
  }

  static final List<RegExp> _regexps = [
    RegExp(
        r'^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$'),
    RegExp(
        r'^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$'),
    RegExp(r'^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$')
  ];

  @override
  Widget build(BuildContext context) {
    final String name = widget.chapter.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: YoutubePlayer(
              context: context,
              source: getIdFromUrl(_sourceUrl),
              quality: YoutubeQuality.HD,
              aspectRatio: 16 / 9,
              showThumbnail: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contents.length,
              itemBuilder: (context, index) => ContentTile(
                _contents[index],
                index,
                (Content content) {
                  setState(() {
                    _sourceUrl = content.sourceUrl;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

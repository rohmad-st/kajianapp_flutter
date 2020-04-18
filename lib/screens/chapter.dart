import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
//  double _volume = 100;
//  bool _muted = false;
  bool _isPlayerReady = false;
  String _sourceUrl = 'https://www.youtube.com/watch?v=h_QLMFUu5Uo';

  @override
  void initState() {
    super.initState();
    initYoutubePlayer();
    listenForContents();
  }

  void initYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_sourceUrl),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHideAnnotation: true,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);

    _videoMetaData = YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  void listenForContents() async {
    final Stream<Content> stream = await getContents();

    stream.listen((Content content) => setState(() => _contents.add(content)));

    setState(() {
      _sourceUrl = _contents.first.sourceUrl;
    });
  }

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
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              aspectRatio: 16 / 9,
              topActions: <Widget>[
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {
                    _showSnackBar('Settings Tapped!');
                  },
                ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (data) {
                final List<String> _ids = _contents
                    .map((f) => YoutubePlayer.convertUrlToId(f.sourceUrl));
                _controller
                    .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                _showSnackBar('Next Video Started!');
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contents.length,
              itemBuilder: (context, index) =>
                  ContentTile(_contents[index], index, (Content content) {
                final String videoId =
                    YoutubePlayer.convertUrlToId(content.sourceUrl);
                print(
                    'play video: ${_sourceUrl}: ${videoId}, ${_controller.metadata.videoId}');
                if (_isPlayerReady &&
                    _controller.metadata.videoId == videoId &&
                    _controller.value.isPlaying) {
                  _controller.pause();
                  setState(() {});
                } else {
                  _controller.load(videoId);
                  _controller.play();
                  setState(() {
                    _sourceUrl = content.sourceUrl;
                  });
                }
              },
                      // is playing video
                      _isPlayerReady &&
                          _videoMetaData.videoId ==
                              YoutubePlayer.convertUrlToId(
                                  _contents[index].sourceUrl) &&
                          _controller.value.isPlaying),
            ),
          ),
        ],
      ),
    );
  }
}

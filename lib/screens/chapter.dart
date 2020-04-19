import 'package:flutter/material.dart';
import 'package:kajianapp/models/Contents.dart';
import 'package:kajianapp/utils/network.dart';
import 'package:kajianapp/widgets/loading_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:kajianapp/models/chapter.dart' as Models;
import 'package:kajianapp/models/content.dart';
import 'package:kajianapp/repository/contents_repository.dart';
import 'package:kajianapp/widgets/content_tile.dart';

class Chapter extends StatefulWidget {
  final Models.Chapter chapter;

  Chapter({Key key, this.chapter}) : super(key: key);

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  Future<Contents> _contents;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    listenForContents();
    initYoutubePlayer();
    super.initState();
  }

  void initYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.chapter.defaultSourceUrl),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHideAnnotation: false,
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

  void listenForContents() {
    isConnected().then((internet) {
      if (internet) {
        setState(() {
          _contents = getContents(widget.chapter.id);
        });
      }
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
                _showSnackBar('Next Video Started!');
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<Contents>(
              future: _contents,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return loadingView();
                    break;
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    return ListView.builder(
                      itemCount: snapshot.data.contents.length,
                      itemBuilder: (context, index) =>
                          ContentTile(snapshot.data.contents[index], index,
                              (Content content) {
                        final String videoId =
                            YoutubePlayer.convertUrlToId(content.sourceUrl);
                        final bool isPlaying = _controller.value.isPlaying;
                        final bool contentIsPlaying =
                            _controller.metadata.videoId == videoId;

                        if (_isPlayerReady) {
                          if (contentIsPlaying) {
                            if (isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          } else {
                            _controller.load(videoId);
                            _controller.play();
                          }
                          setState(() {});
                        }
                      },
                              // is playing video
                              _isPlayerReady &&
                                  _videoMetaData.videoId ==
                                      YoutubePlayer.convertUrlToId(snapshot
                                          .data.contents[index].sourceUrl) &&
                                  _controller.value.isPlaying),
                    );
                    break;
                  case ConnectionState.none:
                    break;
                }
                return loadingView();
              },
            ),
          ),
        ],
      ),
    );
  }
}

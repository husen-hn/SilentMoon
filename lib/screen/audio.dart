import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  AudioPlayer _audioplayer = AudioPlayer();
  bool isplaying = false;
  String _currenttime = "00.00";
  String _completetime = "00.00";
  @override
  Widget build(BuildContext context) {
    _audioplayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        _currenttime = duration.toString().split(".")[0];
      });
    });
    _audioplayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _completetime = duration.toString().split(".")[0];
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        /*actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.mic,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],*/
        backgroundColor: Colors.black,
        title: Text('Retro Music'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          //had to change loop count of gif from "https://ezgif.com/loop-count"
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 150.0,
                minHeight: 70,
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.symmetric(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                      color: Colors.blue,
                      icon: Icon(isplaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isplaying) {
                          _audioplayer.pause();
                          setState(() {
                            isplaying = false;
                          });
                        } else {
                          _audioplayer.resume();
                          setState(() {
                            isplaying = true;
                          });
                        }
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.stop),
                      onPressed: () {
                        _audioplayer.stop();
                        setState(() {
                          isplaying = false;
                        });
                      }),
                  Text(
                    _currenttime,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.blue),
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.blue),
                  ),
                  Text(
                    _completetime,
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.15, 0.4),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () async {
                  int status = await _audioplayer.play(
                      "https://www.bensound.com/bensound-music/bensound-creativeminds.mp3",
                      stayAwake: true);
                  if (status == 1) {
                    setState(() {
                      isplaying = true;
                    });
                  }
                },
                icon: Icon(Icons.play_arrow),
                heroTag: "Local",
                label: Text("Play"),
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

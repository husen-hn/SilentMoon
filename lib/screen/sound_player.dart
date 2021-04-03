import 'dart:ui';

import 'package:SilentMoon/model/sound_play_model.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundPlayer extends StatefulWidget {
  final SoundPlayModel soundPlayArgs;

  SoundPlayer({@required this.soundPlayArgs});
  @override
  _SoundPlayerState createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer>
    with SingleTickerProviderStateMixin {
  bool _isFavorite = false;
  AnimationController _animationController;
  bool _isPlaying = false;
  double _sliderValue = 0;
  double musicSeconds = 120;
  bool isDark;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void didChangeDependencies() {
    isDark = Provider.of<ThemeChanger>(context).getTheme() == darkTheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // bg topLeft light
          Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage(isDark ? '' : 'images/player_bg_one.png'),
                width: 209.91,
                height: 200.91,
              )),
          // bg topRight light
          Align(
              alignment: Alignment.topRight,
              child: Image(
                image: AssetImage(isDark ? '' : 'images/player_bg_two.png'),
                width: 200.14,
                height: 341.72,
              )),
          // bg bottomLeft light
          Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: AssetImage(isDark ? '' : 'images/player_bg_three.png'),
                width: 260.14,
                height: 400.72,
              )),
          // bg bottomRight light
          Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: AssetImage(isDark ? '' : 'images/player_bg_four.png'),
                width: 160.91,
                height: 209.91,
              )),
          // bg topright dark
          Align(
              alignment: Alignment.topRight,
              child: Image(
                image:
                    AssetImage(isDark ? 'images/player_bg_night_two.png' : ''),
                width: 220.91,
                height: 310.91,
              )),
          // bg topright top dark
          Align(
              alignment: Alignment.topRight,
              child: Image(
                image:
                    AssetImage(isDark ? 'images/player_bg_night_one.png' : ''),
                width: 100.91,
                height: 220.91,
              )),
          // bg bottomright  dark
          Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image:
                    AssetImage(isDark ? 'images/player_bg_night_four.png' : ''),
                width: 190.91,
                height: 230.91,
              )),
          // bg bottomleft  dark
          Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: AssetImage(
                    isDark ? 'images/player_bg_night_three.png' : ''),
                width: 190.91,
                height: 180.91,
              )),
          // bg centerleft  dark
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Image(
                      image: AssetImage(
                          isDark ? 'images/player_bg_night_five.png' : ''),
                      color: Color(0xFF1F265E).withOpacity(.5),
                      width: 180.91,
                      height: 280.91,
                    ),
                  ),
                ),
              )),
          // bg centerright  dark
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Image(
                      image: AssetImage(
                          isDark ? 'images/player_bg_night_six.png' : ''),
                      color: Color(0xFF1F265E).withOpacity(.5),
                      width: 190.91,
                      height: 310.91,
                    ),
                  ),
                ),
              )),
          // actions
          Positioned(
            top: 70,
            left: 30,
            child: Row(
              children: [
                //back
                Container(
                    width: 55,
                    height: 55,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      autofocus: true,
                      icon: Image(
                        image: AssetImage("images/cancel.png"),
                        color: const Color(0xff3F414E),
                        width: 18.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                ),
                //favorite
                Container(
                  width: 55,
                  height: 55,
                  decoration: ShapeDecoration(
                    color: isDark
                        ? const Color(0xFF03174C).withOpacity(0.5)
                        : const Color(0xffB6B8BF).withOpacity(0.5),
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    autofocus: true,
                    icon: Image(
                      image: AssetImage("images/favorite.png"),
                      color: _isFavorite ? Colors.pink : Colors.white,
                      width: 20.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorite == false
                            ? _isFavorite = true
                            : _isFavorite = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                //download
                Container(
                    width: 55,
                    height: 55,
                    decoration: ShapeDecoration(
                      color: isDark
                          ? const Color(0xFF03174C).withOpacity(0.5)
                          : const Color(0xffB6B8BF).withOpacity(0.5),
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      autofocus: true,
                      icon: Image(
                        image: AssetImage("images/download.png"),
                        color: Colors.white,
                        width: 20.0,
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
          ),
          // title and play
          Positioned(
            bottom: MediaQuery.of(context).size.height * .2,
            left: 5.0,
            right: 5.0,
            child: Column(
              children: [
                // Title
                Text(
                  widget.soundPlayArgs.title,
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? const Color(0xFFE6E7F2)
                          : const Color(0xff3F414E)),
                ),
                // Play Type
                Padding(
                  padding: const EdgeInsets.only(top: 15.3, bottom: 60.0),
                  child: Text(
                    widget.soundPlayArgs.boxTitle,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? const Color(0xFF98A1BD)
                            : const Color(0xffA0A3B1)),
                  ),
                ),
                // Play buttons
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // rewind btn
                      IconButton(
                          icon: Icon(
                            Icons.fast_rewind,
                            color: isDark
                                ? const Color(0xFFE6E7F2)
                                : const Color(0xffA0A3B1),
                            size: 30.0,
                          ),
                          onPressed: () {}),
                      // play btn
                      Container(
                        width: 109.05,
                        height: 109.05,
                        margin: EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: isDark
                                ? const Color(0xffBABCC6).withOpacity(.5)
                                : const Color(0xffBABCC6)),
                        child: InkWell(
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: isDark
                                    ? const Color(0xFFE6E7F2)
                                    : const Color(0xff3F414E)),
                            child: Center(
                              child: AnimatedIcon(
                                icon: AnimatedIcons.play_pause,
                                progress: _animationController,
                                color: isDark
                                    ? const Color(0xFF3F414E)
                                    : const Color(0xffFBFBFB),
                                size: 50.0,
                              ),
                            ),
                          ),
                          onTap: () => _handleOnPlayPressed(),
                        ),
                      ),
                      // forward btn
                      IconButton(
                          icon: Icon(
                            Icons.fast_forward,
                            color: isDark
                                ? const Color(0xFFE6E7F2)
                                : const Color(0xffA0A3B1),
                            size: 30.0,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                // slider
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Slider(
                      min: 0,
                      max: musicSeconds,
                      value: _sliderValue,
                      activeColor: isDark
                          ? const Color(0xFFE6E7F2)
                          : const Color(0xff3F414E),
                      inactiveColor: isDark
                          ? const Color(0xFF47557E)
                          : const Color(0xffA0A3B1),
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                // music times
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Text(
                          _secondToMinuteFormatter(_sliderValue),
                          style: TextStyle(
                              color: isDark
                                  ? const Color(0xFFE6E7F2)
                                  : Colors.black),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '02:00',
                          style: TextStyle(
                              color: isDark
                                  ? const Color(0xFFE6E7F2)
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _handleOnPlayPressed() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  String _secondToMinuteFormatter(double seconds) {
    String minutes = (seconds / 60).truncate().toString().padLeft(2, '0');
    String second = (seconds.toInt() % 60).toString().padLeft(2, '0');

    return '$minutes:$second';
  }
}

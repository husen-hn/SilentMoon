import 'dart:ui';
import 'package:SilentMoon/bloc/player_bloc/player_bloc.dart';
import 'package:ftoast/ftoast.dart';
import 'package:SilentMoon/model/player_model.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Player extends StatefulWidget {
  final PlayerModel soundPlayArgs;

  Player({@required this.soundPlayArgs});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
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
        body: BlocConsumer<PlayerBloc, PlayerState>(builder: (context, state) {
      if (state is FavoriteChecking) {
        return _bodyBuilder(
            currentTime: state.currentTime,
            completeTime: state.completeTime,
            currentSecond: state.currentSecond,
            completeSecond: state.completeSecond,
            isComplete: state.isComplete,
            isPlaying: state.isPlaying,
            isFavorite: state.isFavorite);
      } else if (state is PlayerInitial) {
        return _bodyBuilder(
            currentTime: state.currentTime,
            completeTime: state.completeTime,
            currentSecond: state.currentSecond,
            completeSecond: state.completeSecond,
            isFavorite: state.isFavorite);
      } else if (state is PlayerLoading) {
        return _bodyBuilder(
            isLoading: true,
            currentTime: state.currentTime,
            completeTime: state.completeTime,
            currentSecond: state.currentSecond,
            completeSecond: state.completeSecond,
            isFavorite: state.isFavorite);
      } else if (state is PlayerRunning) {
        return _bodyBuilder(
            currentTime: state.currentTime,
            completeTime: state.completeTime,
            currentSecond: state.currentSecond,
            completeSecond: state.completeSecond,
            isComplete: state.isComplete,
            isPlaying: state.isPlaying,
            isFavorite: state.isFavorite);
      } else if (state is PlayerPause) {
        return _bodyBuilder(
            completeTime: state.completeTime,
            currentTime: state.currentTime,
            completeSecond: state.completeSecond,
            currentSecond: state.currentSecond,
            isPause: true,
            isFavorite: state.isFavorite);
      } else if (state is PlayerResume) {
        return _bodyBuilder(
            completeTime: state.completeTime,
            currentTime: state.currentTime,
            completeSecond: state.completeSecond,
            currentSecond: state.currentSecond,
            isResume: true,
            isFavorite: state.isFavorite);
      } else {
        return _bodyBuilder(
            isLoading: false,
            currentTime: "0:00:00",
            completeTime: "0:00:00",
            currentSecond: 0,
            completeSecond: 120,
            isFavorite: false);
      }
    }, listener: (context, state) {
      if (state is PlayerError) {
        FToast.toast(
          context,
          msg: "Warning",
          image: Icon(Icons.error_outline),
          imageDirection: AxisDirection.left,
          subMsg: state.message,
          subMsgStyle: TextStyle(color: Colors.white, fontSize: 13),
        );
      } else if (state is PlayerStop) {
        Navigator.pop(context);
      }
    }));
  }

  Widget _bodyBuilder(
      {bool isLoading = false,
      @required String currentTime,
      @required String completeTime,
      @required int currentSecond,
      @required int completeSecond,
      bool isComplete: false,
      bool isPlaying: false,
      bool isResume: false,
      bool isPause: false,
      bool isFavorite: false}) {
    if (isComplete || isPause) {
      _handlePlayIcon(isPlaying: false);
    } else if (isPlaying || isResume) {
      _handlePlayIcon(isPlaying: true);
    } else {
      _handlePlayIcon(isPlaying: false);
    }

    return Stack(
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
              image: AssetImage(isDark ? 'images/player_bg_night_two.png' : ''),
              width: 220.91,
              height: 310.91,
            )),
        // bg topright top dark
        Align(
            alignment: Alignment.topRight,
            child: Image(
              image: AssetImage(isDark ? 'images/player_bg_night_one.png' : ''),
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
              image:
                  AssetImage(isDark ? 'images/player_bg_night_three.png' : ''),
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
                      _setPlayerEvent(context, Stop());
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
                    color: isFavorite ? Colors.pink : Colors.white,
                    width: 20.0,
                  ),
                  onPressed: () {
                    setState(() {
                      _setPlayerEvent(context,
                          SetFavorite(widget.soundPlayArgs, isFavorite));
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
                          borderRadius: BorderRadius.all(Radius.circular(100)),
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
                            child: isLoading
                                ? Lottie.asset(
                                    isDark
                                        ? 'assets/loading_music_in_dark.json'
                                        : 'assets/loading_music_in_light.json',
                                    height: 50.0,
                                  )
                                : AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: _animationController,
                                    color: isDark
                                        ? const Color(0xFF3F414E)
                                        : const Color(0xffFBFBFB),
                                    size: 50.0,
                                  ),
                          ),
                        ),
                        onTap: () async {
                          _setPlayerEvent(
                              context, Play(widget.soundPlayArgs.url));
                        },
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
                    max: completeSecond.toDouble(),
                    value: currentSecond.toDouble(),
                    activeColor: isDark
                        ? const Color(0xFFE6E7F2)
                        : const Color(0xff3F414E),
                    inactiveColor: isDark
                        ? const Color(0xFF47557E)
                        : const Color(0xffA0A3B1),
                    onChanged: (value) {
                      // setState(() {
                      //   _sliderValue = value;
                      // });
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
                        currentTime,
                        style: TextStyle(
                            color: isDark
                                ? const Color(0xFFE6E7F2)
                                : Colors.black),
                      ),
                      Expanded(child: Container()),
                      Text(
                        completeTime,
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
    );
  }

  _handlePlayIcon({isPlaying = false}) {
    isPlaying ? _animationController.forward() : _animationController.reverse();
  }

  _setPlayerEvent(BuildContext context, PlayerEvent event) {
    final bloc = context.read<PlayerBloc>();
    bloc.add(event);
  }
}

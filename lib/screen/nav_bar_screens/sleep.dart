import 'package:SilentMoon/model/audio.dart';
import 'package:SilentMoon/model/music_box_model.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'dart:math' as Math;

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> with TickerProviderStateMixin {
  // used in Grid List
  List<MusicBoxModel> musicBoxs = [];
  List<Map> musics = [
    {"name": "Focus Attention", "time": "10 MIN"},
    {"name": "Body Scan", "time": "4 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Making Happiness", "time": "7 MIN"},
    {"name": "Focus Attention", "time": "7 MIN"},
    {"name": "Body Scan", "time": "7 MIN"},
  ];
  TabController _nestedTabController;
  ValueNotifier<int> _currentScreen = ValueNotifier<int>(0);
  int _previousScreen = 0;
  bool isDark;
  List<Audio> listFavAudio = [];

  void getAudios(BuildContext cntxt) async {
    final box = await Hive.openBox<Audio>('${S.of(cntxt).sleep}Fav');
    setState(() {
      listFavAudio = box.values.toList();
    });
  }

  @override
  void didChangeDependencies() {
    isDark = Provider.of<ThemeChanger>(context).getTheme() == darkTheme;
    getAudios(context);
    musicBoxs = [
      MusicBoxModel(
          "images/sleep_grid_banner_one.png",
          const Color(0xfff8bbd0),
          S.of(context).sleepMusicBoxTitle,
          S.of(context).sleepMusicBoxTime,
          S.of(context).sleepMusicBoxType),
      MusicBoxModel(
          "images/sleep_grid_banner_two.png",
          const Color(0xffAFDBC5),
          S.of(context).sleepMusicBoxTitle,
          S.of(context).sleepMusicBoxTime,
          S.of(context).sleepMusicBoxType),
      MusicBoxModel(
          "images/sleep_grid_banner_three.png",
          const Color(0xffFFC97E),
          S.of(context).sleepMusicBoxTitle,
          S.of(context).sleepMusicBoxTime,
          S.of(context).sleepMusicBoxType),
      MusicBoxModel(
          "images/sleep_grid_banner_four.png",
          const Color(0xffFFC97E),
          S.of(context).sleepMusicBoxTitle,
          S.of(context).sleepMusicBoxTime,
          S.of(context).sleepMusicBoxType),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
    _currentScreen.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage("images/sleep_bg.png"),
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
            ),
          ),
          child: Stack(
            children: [
              // Moon
              Positioned(
                top: 10.0,
                left: 30.0,
                child: Transform.rotate(
                  angle: 5.0,
                  child: Image(
                    image: AssetImage('images/moon.png'),
                    width: 70,
                  ),
                ),
              ),
              // Moon shadow
              Positioned(
                top: -10.0,
                left: 50.0,
                child: Transform.rotate(
                  angle: 5.0,
                  child: Image(
                    image: AssetImage('images/moon_shadow.png'),
                    width: 70,
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 80.0,
                left: 20.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 180,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 20,
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 120.0,
                left: 10.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 180,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 10,
                    color: const Color(0xFF6D75B0),
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 110.0,
                left: 30.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 180,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 10,
                    color: const Color(0xFF6D75B0),
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 100.0,
                right: 20.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 180,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 10,
                    color: const Color(0xFF6D75B0),
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 60.0,
                right: 40.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 90,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 15,
                  ),
                ),
              ),
              // Star
              Positioned(
                top: 10.0,
                right: 50.0,
                child: Transform.rotate(
                  angle: Math.pi / 180 * 180,
                  child: Image(
                    image: AssetImage('images/star.png'),
                    width: 18,
                    color: const Color(0xFF6D75B0),
                  ),
                ),
              ),
              Column(
                children: [
                  // Title
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text(
                        S.of(context).sleepTitle,
                        style: TextStyle(
                            fontSize: 28.0, color: const Color(0xFFE6E7F2)),
                      ),
                    ),
                  ),
                  // Description
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0),
                    child: Center(
                      child: Text(
                        S.of(context).sleepDesc,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xffEBEAEC)),
                      ),
                    ),
                  ),
                  // Tabbar
                  TabBar(
                      controller: _nestedTabController,
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      physics: BouncingScrollPhysics(),
                      onTap: (int index) {
                        _previousScreen = _currentScreen.value;
                        _currentScreen.value = index;
                      },
                      tabs: [
                        _horizonListViewItem(
                            imgAsset: "images/all.png",
                            title: S.of(context).sleepTabAll,
                            bgColor: _currentScreen.value == 0
                                ? const Color(0xff8E97FD)
                                : const Color(0xff586894),
                            titleColor: _currentScreen.value == 0
                                ? const Color(0xff3F414E)
                                : const Color(0xff98A1BD)),
                        _horizonListViewItem(
                            imgAsset: "images/favorite.png",
                            title: S.of(context).sleepTabMy,
                            bgColor: _currentScreen.value == 1
                                ? const Color(0xff8E97FD)
                                : const Color(0xff586894),
                            titleColor: _currentScreen.value == 1
                                ? const Color(0xff3F414E)
                                : const Color(0xff98A1BD)),
                        _horizonListViewItem(
                            imgAsset: "images/anxious.png",
                            title: S.of(context).sleepTabAnxious,
                            bgColor: _currentScreen.value == 2
                                ? const Color(0xff8E97FD)
                                : const Color(0xff586894),
                            titleColor: _currentScreen.value == 2
                                ? const Color(0xff3F414E)
                                : const Color(0xff98A1BD)),
                        _horizonListViewItem(
                            imgAsset: "images/sleep_tab.png",
                            title: S.of(context).sleepTabSleep,
                            bgColor: _currentScreen.value == 3
                                ? const Color(0xff8E97FD)
                                : const Color(0xff586894),
                            titleColor: _currentScreen.value == 3
                                ? const Color(0xff3F414E)
                                : const Color(0xff98A1BD)),
                        _horizonListViewItem(
                            imgAsset: "images/kids.png",
                            title: S.of(context).sleepTabKids,
                            bgColor: _currentScreen.value == 4
                                ? const Color(0xff8E97FD)
                                : const Color(0xff586894),
                            titleColor: _currentScreen.value == 4
                                ? const Color(0xff3F414E)
                                : const Color(0xff98A1BD)),
                      ]),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onHorizontalDragEnd: (i) {
            print('**********${i}');
          },
          onPanEnd: (details) {
            // print('**********${details}');
            //           if (details.
            //           delta.dx > 0)
            //   print("Dragging in +X direction");
            // else
            //   print("Dragging in -X direction");
          },
          child: ValueListenableBuilder<int>(
              valueListenable: _currentScreen,
              builder: (context, screen, child) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final inAnimation = Tween<Offset>(
                            begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(animation);
                    final outAnimation = Tween<Offset>(
                            begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(animation);

                    final Widget inTransition = ClipRect(
                      child: SlideTransition(
                        position: inAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: child,
                        ),
                      ),
                    );

                    final Widget outTransition = ClipRect(
                      child: SlideTransition(
                        position: outAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: child,
                        ),
                      ),
                    );

                    // Transition for three screens
                    if (child.key == ValueKey<int>(1)) {
                      if (_previousScreen == 0 ||
                          _previousScreen == 1 && screen != 2)
                        return inTransition;
                      return outTransition;
                    } else if (child.key == ValueKey<int>(2)) {
                      return inTransition;
                    } else {
                      return outTransition;
                    }
                  },
                  child: _returnTab(screen),
                );
              }),
        ),
        // Tabs Contents
        // IndexedStack(index: selectedTabIndex, children: [
        //   // Tab One (All)
        //   Visibility(
        //     maintainState: true,
        //     visible: selectedTabIndex == 0,
        //     child: ListView(
        //       shrinkWrap: true,
        //       physics: NeverScrollableScrollPhysics(),
        //       children: [
        //         // banner
        //         Padding(
        //           padding: const EdgeInsets.only(
        //               left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        //           child: BannerNight(
        //             bgImage: AssetImage("images/sleep_banner.png"),
        //             title: S.of(context).sleepBannerNightTitle,
        //             titleColor: Color(0xffFFE7BF),
        //             description: S.of(context).sleepBannerNightDesc,
        //             descriptionColor: Color(0xffF9F9FF),
        //             btnTitle: S.of(context).start,
        //             btnColor: Color(0xffEBEAEC),
        //             btnTxtColor: Color(0xff3F414E),
        //             onTap: this._onBannerNightPress,
        //           ),
        //         ),
        //         // Grid List
        //         GridView.count(
        //           crossAxisCount: 2,
        //           crossAxisSpacing: 5,
        //           mainAxisSpacing: 10,
        //           physics: NeverScrollableScrollPhysics(),
        //           shrinkWrap: true,
        //           padding: EdgeInsets.all(10.0),
        //           children: musicBoxs.map((e) {
        //             return MusicBox(
        //               darkMood: false,
        //               bgColor: isDark ? const Color(0xFF03174C) : Colors.white,
        //               imgLocalPath: e.img,
        //               imgBg: Color(0xff4C53B4),
        //               title: e.title,
        //               titleColor: isDark
        //                   ? const Color(0xFFE6E7F2)
        //                   : const Color(0xff3F414E),
        //               time: e.time,
        //               timeColor: isDark
        //                   ? const Color(0xFF98A1BD)
        //                   : const Color(0xffA1A4B2),
        //               dotColor: isDark
        //                   ? const Color(0xFF98A1BD)
        //                   : const Color(0xffA1A4B2),
        //               type: e.type,
        //               typeColor: isDark
        //                   ? const Color(0xFF98A1BD)
        //                   : const Color(0xffA1A4B2),
        //               onTap: this._musicBoxTap,
        //             );
        //           }).toList(),
        //         )
        //       ],
        //     ),
        //   ),
        //   // Tab Two (My)
        //   Visibility(
        //     maintainState: true,
        //     visible: selectedTabIndex == 1,
        //     child: Directionality(
        //       textDirection: TextDirection.ltr,
        //       child: listFavAudio.isEmpty
        //           ? Center(
        //               child: Lottie.asset(
        //                 'assets/meditating_lady.json',
        //                 height: 350.0,
        //               ),
        //             )
        //           : ListView.builder(
        //               shrinkWrap: true,
        //               physics: NeverScrollableScrollPhysics(),
        //               itemCount: listFavAudio.length,
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 20.0, left: 30.0, right: 30.0),
        //                   child: InkWell(
        //                     child: Row(
        //                       children: [
        //                         // play btn
        //                         Container(
        //                           width: 40.0,
        //                           height: 40.0,
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(100),
        //                               border: Border.all(
        //                                   width: 1,
        //                                   color: isDark
        //                                       ? const Color(0xFFEBEAEC)
        //                                       : const Color(0xffA1A4B2))),
        //                           child: IconButton(
        //                             autofocus: true,
        //                             icon: Image(
        //                               image: AssetImage("images/play.png"),
        //                               color: isDark
        //                                   ? const Color(0xFFEBEAEC)
        //                                   : const Color(0xffA1A4B2),
        //                               width: 12.0,
        //                             ),
        //                             onPressed: () {},
        //                           ),
        //                         ),
        //                         // voice title & time
        //                         Padding(
        //                           padding: const EdgeInsets.only(left: 10.0),
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 listFavAudio[index].audioName,
        //                                 style: TextStyle(
        //                                     color: isDark
        //                                         ? const Color(0xFFE6E7F2)
        //                                         : const Color(0xff3F414E),
        //                                     fontWeight: FontWeight.bold,
        //                                     fontSize: 16.0),
        //                               ),
        //                               Text(
        //                                 listFavAudio[index].audioName,
        //                                 style: TextStyle(
        //                                     color: isDark
        //                                         ? const Color(0xFF98A1BD)
        //                                         : const Color(0xffA1A4B2),
        //                                     fontSize: 11.0),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     onTap: () {
        //                       Navigator.pushNamed(context, '/sound_player',
        //                           arguments: PlayerModel(
        //                               title: listFavAudio[index].audioName,
        //                               boxTitle: S.of(context).sleep,
        //                               url:
        //                                   'https://www.bensound.com/bensound-music/bensound-clearday.mp3'));
        //                     },
        //                   ),
        //                 );
        //               }),
        //     ),
        //   ),
        //   // Tab Three (Anxios)
        //   Visibility(
        //     maintainState: true,
        //     visible: selectedTabIndex == 2,
        //     child: Directionality(
        //       textDirection: TextDirection.ltr,
        //       child: ListView.builder(
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemCount: musics.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.only(
        //                   top: 20.0, left: 30.0, right: 30.0),
        //               child: InkWell(
        //                 child: Row(
        //                   children: [
        //                     // play btn
        //                     Container(
        //                       width: 40.0,
        //                       height: 40.0,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(100),
        //                           border: Border.all(
        //                               width: 1,
        //                               color: isDark
        //                                   ? const Color(0xFFEBEAEC)
        //                                   : const Color(0xffA1A4B2))),
        //                       child: IconButton(
        //                         autofocus: true,
        //                         icon: Image(
        //                           image: AssetImage("images/play.png"),
        //                           color: isDark
        //                               ? const Color(0xFFEBEAEC)
        //                               : const Color(0xffA1A4B2),
        //                           width: 12.0,
        //                         ),
        //                         onPressed: () {},
        //                       ),
        //                     ),
        //                     // voice title & time
        //                     Padding(
        //                       padding: const EdgeInsets.only(left: 10.0),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             musics[index]["name"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFFE6E7F2)
        //                                     : const Color(0xff3F414E),
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: 16.0),
        //                           ),
        //                           Text(
        //                             musics[index]["time"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFF98A1BD)
        //                                     : const Color(0xffA1A4B2),
        //                                 fontSize: 11.0),
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 onTap: () {
        //                   Navigator.pushNamed(context, '/sound_player',
        //                       arguments: PlayerModel(
        //                           title: musics[index]["name"],
        //                           boxTitle: S.of(context).sleep,
        //                           url:
        //                               'https://www.bensound.com/bensound-music/bensound-clearday.mp3'));
        //                 },
        //               ),
        //             );
        //           }),
        //     ),
        //   ),
        //   // Tab Four (Sleep)
        //   Visibility(
        //     maintainState: true,
        //     visible: selectedTabIndex == 3,
        //     child: Directionality(
        //       textDirection: TextDirection.ltr,
        //       child: ListView.builder(
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemCount: musics.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.only(
        //                   top: 20.0, left: 30.0, right: 30.0),
        //               child: InkWell(
        //                 child: Row(
        //                   children: [
        //                     // play btn
        //                     Container(
        //                       width: 40.0,
        //                       height: 40.0,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(100),
        //                           border: Border.all(
        //                               width: 1,
        //                               color: isDark
        //                                   ? const Color(0xFFEBEAEC)
        //                                   : const Color(0xffA1A4B2))),
        //                       child: IconButton(
        //                         autofocus: true,
        //                         icon: Image(
        //                           image: AssetImage("images/play.png"),
        //                           color: isDark
        //                               ? const Color(0xFFEBEAEC)
        //                               : const Color(0xffA1A4B2),
        //                           width: 12.0,
        //                         ),
        //                         onPressed: () {},
        //                       ),
        //                     ),
        //                     // voice title & time
        //                     Padding(
        //                       padding: const EdgeInsets.only(left: 10.0),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             musics[index]["name"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFFE6E7F2)
        //                                     : const Color(0xff3F414E),
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: 16.0),
        //                           ),
        //                           Text(
        //                             musics[index]["time"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFF98A1BD)
        //                                     : const Color(0xffA1A4B2),
        //                                 fontSize: 11.0),
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 onTap: () {
        //                   Navigator.pushNamed(context, '/sound_player',
        //                       arguments: PlayerModel(
        //                           title: musics[index]["name"],
        //                           boxTitle: S.of(context).sleep,
        //                           url:
        //                               'https://www.bensound.com/bensound-music/bensound-clearday.mp3'));
        //                 },
        //               ),
        //             );
        //           }),
        //     ),
        //   ),
        //   // Tab Five (Kids)
        //   Visibility(
        //     maintainState: true,
        //     visible: selectedTabIndex == 4,
        //     child: Directionality(
        //       textDirection: TextDirection.ltr,
        //       child: ListView.builder(
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemCount: musics.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.only(
        //                   top: 20.0, left: 30.0, right: 30.0),
        //               child: InkWell(
        //                 child: Row(
        //                   children: [
        //                     // play btn
        //                     Container(
        //                       width: 40.0,
        //                       height: 40.0,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(100),
        //                           border: Border.all(
        //                               width: 1,
        //                               color: isDark
        //                                   ? const Color(0xFFEBEAEC)
        //                                   : const Color(0xffA1A4B2))),
        //                       child: IconButton(
        //                         autofocus: true,
        //                         icon: Image(
        //                           image: AssetImage("images/play.png"),
        //                           color: isDark
        //                               ? const Color(0xFFEBEAEC)
        //                               : const Color(0xffA1A4B2),
        //                           width: 12.0,
        //                         ),
        //                         onPressed: () {},
        //                       ),
        //                     ),
        //                     // voice title & time
        //                     Padding(
        //                       padding: const EdgeInsets.only(left: 10.0),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             musics[index]["name"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFFE6E7F2)
        //                                     : const Color(0xff3F414E),
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: 16.0),
        //                           ),
        //                           Text(
        //                             musics[index]["time"],
        //                             style: TextStyle(
        //                                 color: isDark
        //                                     ? const Color(0xFF98A1BD)
        //                                     : const Color(0xffA1A4B2),
        //                                 fontSize: 11.0),
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 onTap: () {
        //                   Navigator.pushNamed(context, '/sound_player',
        //                       arguments: PlayerModel(
        //                           title: musics[index]["name"],
        //                           boxTitle: S.of(context).sleep,
        //                           url:
        //                               'https://www.bensound.com/bensound-music/bensound-clearday.mp3'));
        //                 },
        //               ),
        //             );
        //           }),
        //     ),
        //   ),
        // ]),
      ],
    );
  }
}

Widget _horizonListViewItem(
    {Color bgColor,
    @required String imgAsset,
    @required String title,
    Color titleColor}) {
  return SizedBox(
    height: 110,
    child: Tab(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                color: bgColor ?? Color(0xff586894),
              ),
              child: Image(
                image: AssetImage(imgAsset),
                width: 25.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                title,
                style: TextStyle(color: titleColor ?? Color(0xff98A1BD)),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

_returnTab(int screen) {
  switch (screen) {
    case 0:
      return Text(
        'data',
        key: ValueKey<int>(0),
      );

      break;
    case 1:
      return Text(
        'data',
        key: ValueKey<int>(1),
      );
      break;
    case 2:
      return Text(
        'data',
        key: ValueKey<int>(2),
      );
      break;
  }

  // _onBannerNightPress(String title) {
  //   Navigator.pushNamed(context, '/play_list',
  //       arguments: PlayListModel(title: title, type: 'MUSIC'));
  // }

  // _musicBoxTap(String title, String type) {
  //   Navigator.pushNamed(context, '/play_list',
  //       arguments: PlayListModel(title: title, type: type));
  // }
}

import 'dart:ui';

import 'package:SilentMoon/model/music_box_model.dart';
import 'package:SilentMoon/model/play_list_model.dart';
import 'package:SilentMoon/model/sound_play_model.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Meditate extends StatefulWidget {
  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> with TickerProviderStateMixin {
  List boxs = [];
  // used in Grid List
  List<MusicBoxModel> musicBoxs = [
    MusicBoxModel("images/sleep_grid_banner_one.png", Color(0xfff8bbd0),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_three.png", Color(0xffFFC97E),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_two.png", Color(0xffAFDBC5),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_four.png", Color(0xffFFC97E),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
  ];
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
  bool isDark;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void didChangeDependencies() {
    isDark = Provider.of<ThemeChanger>(context).getTheme() == darkTheme;
    boxs = [
      {
        "img": "images/meditate_one.png",
        "title": S.of(context).meditateBox7Days,
      },
      {
        "img": "images/meditate_two.png",
        "title": S.of(context).meditateBoxAnxiet1,
      },
      {
        "img": "images/meditate_three.png",
        "title": S.of(context).meditateBoxAnxiet2,
      },
      {
        "img": "images/meditate_four.png",
        "title": S.of(context).meditateBoxAnxiet3,
      }
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              // title
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Text(
                    S.of(context).meditateTitle,
                    style: TextStyle(
                        fontSize: 28.0,
                        color: isDark
                            ? const Color(0xFFEBEAEC)
                            : const Color(0xff3F414E)),
                  ),
                ),
              ),
              //description
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Center(
                  child: Text(
                    S.of(context).meditateDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: isDark
                            ? const Color(0xFFE6E7F2)
                            : const Color(0xffA0A3B1)),
                  ),
                ),
              ),
              // Tabbar
              TabBar(
                  controller: _nestedTabController,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  tabs: [
                    _horizonListViewItem(
                        imgAsset: "images/all.png",
                        title: S.of(context).meditateTabAll,
                        bgColor: Color(0xffA0A3B1),
                        titleColor: Color(0xffA0A3B1)),
                    _horizonListViewItem(
                        imgAsset: "images/favorite.png",
                        title: S.of(context).meditateTabMy,
                        bgColor: Color(0xffA0A3B1),
                        titleColor: Color(0xffA0A3B1)),
                    _horizonListViewItem(
                        imgAsset: "images/anxious.png",
                        title: S.of(context).meditateTabAnxious,
                        bgColor: Color(0xffA0A3B1),
                        titleColor: Color(0xffA0A3B1)),
                    _horizonListViewItem(
                        imgAsset: "images/sleep_tab.png",
                        title: S.of(context).meditateTabSleep,
                        bgColor: Color(0xffA0A3B1),
                        titleColor: Color(0xffA0A3B1)),
                    _horizonListViewItem(
                        imgAsset: "images/kids.png",
                        title: S.of(context).meditateTabKids,
                        bgColor: Color(0xffA0A3B1),
                        titleColor: Color(0xffA0A3B1)),
                  ]),
              // Tabs Contents
              Container(
                //TODO set height size
                height: MediaQuery.of(context).size.height * .8,
                child: TabBarView(
                    controller: _nestedTabController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      // Tab One (All)
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // Daily Calm
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: FittedBox(
                              child: InkWell(
                                child: Container(
                                  width: 374,
                                  height: 95,
                                  decoration: BoxDecoration(
                                      color: Color(0xfff9dfce),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/daily_calm.png"))),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20.0, right: 20.0, left: 20.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              S.of(context).dailyThought,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff3F414E),
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  S.of(context).meditate,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff3F414E),
                                                      fontSize: 14.0),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: const Color(
                                                          0xff3F414E),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  S.of(context).meditationTime,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff3F414E),
                                                      fontSize: 14.0),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Container(
                                            decoration: const ShapeDecoration(
                                              color: const Color(0xff3F414E),
                                              shape: CircleBorder(),
                                            ),
                                            child: IconButton(
                                              autofocus: true,
                                              icon: Image(
                                                image: AssetImage(
                                                    "images/play.png"),
                                                width: 12.0,
                                                color: const Color(0xffF0F1F2),
                                              ),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/play_list',
                                                    arguments: PlayListModel(
                                                        title: S
                                                            .of(context)
                                                            .dailyThought,
                                                        type: S
                                                            .of(context)
                                                            .meditate));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/play_list',
                                      arguments: PlayListModel(
                                          title: S.of(context).dailyThought,
                                          type: S.of(context).meditate));
                                },
                              ),
                            ),
                          ),
                          // Voice ListView
                          Container(
                              padding: EdgeInsets.only(
                                  top: 30.0, left: 8.0, right: 8.0),
                              height: 400,
                              child: StaggeredGridView.countBuilder(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                staggeredTileBuilder: (int index) =>
                                    StaggeredTile.count(
                                        2, index.isEven ? 3 : 2),
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 15.0,
                                itemCount: boxs.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        InkWell(
                                  child:
                                      // item bg image
                                      Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        image: DecorationImage(
                                          image: AssetImage(boxs[index]["img"]),
                                          fit: BoxFit.fill,
                                        )),
                                    child:
                                        // bottom Title
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 50,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(15.0)),
                                                child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 5, sigmaY: 5),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          boxs[index]["title"],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing:
                                                                  1.0),
                                                        ))),
                                              ),
                                            )),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/play_list',
                                        arguments: PlayListModel(
                                            title: boxs[index]["title"],
                                            type: S.of(context).meditate));
                                  },
                                ),
                              ))
                        ],
                      ),
                      // Tab Two (My)
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: musics.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 30.0, right: 30.0),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      // play btn
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 1,
                                                color: isDark
                                                    ? const Color(0xFFEBEAEC)
                                                    : const Color(0xffA1A4B2))),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/play.png"),
                                            color: isDark
                                                ? const Color(0xFFEBEAEC)
                                                : const Color(0xffA1A4B2),
                                            width: 12.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // voice title & time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musics[index]["name"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFFE6E7F2)
                                                      : const Color(0xff3F414E),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              musics[index]["time"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFF98A1BD)
                                                      : const Color(0xffA1A4B2),
                                                  fontSize: 11.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/sound_player',
                                        arguments: SoundPlayModel(
                                            title: musics[index]["name"],
                                            boxTitle: 'Sleep'));
                                  },
                                ),
                              );
                            }),
                      ),
                      // Tab Three (Anxios)
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: musics.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 30.0, right: 30.0),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      // play btn
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 1,
                                                color: isDark
                                                    ? const Color(0xFFEBEAEC)
                                                    : const Color(0xffA1A4B2))),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/play.png"),
                                            color: isDark
                                                ? const Color(0xFFEBEAEC)
                                                : const Color(0xffA1A4B2),
                                            width: 12.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // voice title & time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musics[index]["name"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFFE6E7F2)
                                                      : const Color(0xff3F414E),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              musics[index]["time"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFF98A1BD)
                                                      : const Color(0xffA1A4B2),
                                                  fontSize: 11.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/sound_player',
                                        arguments: SoundPlayModel(
                                            title: musics[index]["name"],
                                            boxTitle: 'Sleep'));
                                  },
                                ),
                              );
                            }),
                      ),
                      // Tab Four (Sleep)
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: musics.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 30.0, right: 30.0),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      // play btn
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 1,
                                                color: isDark
                                                    ? const Color(0xFFEBEAEC)
                                                    : const Color(0xffA1A4B2))),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/play.png"),
                                            color: isDark
                                                ? const Color(0xFFEBEAEC)
                                                : const Color(0xffA1A4B2),
                                            width: 12.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // voice title & time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musics[index]["name"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFFE6E7F2)
                                                      : const Color(0xff3F414E),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              musics[index]["time"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFF98A1BD)
                                                      : const Color(0xffA1A4B2),
                                                  fontSize: 11.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/sound_player',
                                        arguments: SoundPlayModel(
                                            title: musics[index]["name"],
                                            boxTitle: 'Sleep'));
                                  },
                                ),
                              );
                            }),
                      ),
                      // Tab Five (Kids)
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: musics.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 30.0, right: 30.0),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      // play btn
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 1,
                                                color: isDark
                                                    ? const Color(0xFFEBEAEC)
                                                    : const Color(0xffA1A4B2))),
                                        child: IconButton(
                                          autofocus: true,
                                          icon: Image(
                                            image:
                                                AssetImage("images/play.png"),
                                            color: isDark
                                                ? const Color(0xFFEBEAEC)
                                                : const Color(0xffA1A4B2),
                                            width: 12.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // voice title & time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              musics[index]["name"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFFE6E7F2)
                                                      : const Color(0xff3F414E),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              musics[index]["time"],
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFF98A1BD)
                                                      : const Color(0xffA1A4B2),
                                                  fontSize: 11.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/sound_player',
                                        arguments: SoundPlayModel(
                                            title: musics[index]["name"],
                                            boxTitle: 'Sleep'));
                                  },
                                ),
                              );
                            }),
                      )
                    ]),
              )
            ],
          ),
        ),
      ],
    );
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
}

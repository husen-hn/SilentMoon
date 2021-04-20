import 'package:SilentMoon/model/audio.dart';
import 'package:SilentMoon/model/play_list_model.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/model/player_model.dart';
import 'package:SilentMoon/provider/favorite.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as Math;

class PlayList extends StatefulWidget {
  final PlayListModel playListArgs;

  PlayList({@required this.playListArgs});
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Map> musics = [
    {"name": "Focus Attention", "time": "10 MIN"},
    {"name": "Body Scan", "time": "4 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Making Happiness", "time": "7 MIN"},
    {"name": "Focus Attention", "time": "7 MIN"},
    {"name": "Body Scan", "time": "7 MIN"},
    {"name": "Body Scan", "time": "7 MIN"},
    {"name": "Body Scan1", "time": "7 MIN"},
  ];

  String lang = '';
  bool isRtl = false;
  bool isDark;
  List<Audio> listFavAudio = [];

  void getAudios() async {
    final box = await Hive.openBox<Audio>('${widget.playListArgs.title}Fav');
    setState(() {
      listFavAudio = box.values.toList();
    });
  }

  void _getLang() async {
    try {
      String data = await getLang();
      setState(() {
        lang = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _getLang();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isDark = Provider.of<ThemeChanger>(context).getTheme() == darkTheme;
    getAudios();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (lang == 'Iran' ||
        lang == 'إيران' ||
        lang == 'ایران' ||
        lang == 'Иран' ||
        lang == 'United Arab Emirates' ||
        lang == 'الإمارات العربية المتحدة' ||
        lang == 'Vereinigte Arabische Emirate' ||
        lang == 'امارات متحده عربی' ||
        lang == 'Объединенные Арабские Эмираты') {
      isRtl = true;
    }
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            //top images & actions
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.white),
              child: SliverAppBar(
                expandedHeight: 480,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //top image
                      Container(
                        height: 270.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(isDark
                                  ? "images/nightly_thought.png"
                                  : "images/daily_thought.png"),
                              fit: BoxFit.fitWidth,
                            )),
                        child: Stack(
                          children: [
                            // back button
                            isRtl
                                ? Positioned(
                                    top: 40,
                                    right: 30,
                                    child: //back
                                        Container(
                                            decoration: ShapeDecoration(
                                              color: const Color(0xffF2F2F2),
                                              shape: const CircleBorder(),
                                            ),
                                            child: IconButton(
                                              autofocus: true,
                                              icon: Transform.rotate(
                                                angle: Math.pi / 180 * 180,
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/back.png"),
                                                  color: Color(0xff3F414E),
                                                  width: 18.0,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )),
                                  )
                                : Positioned(
                                    top: 40,
                                    left: 30,
                                    child: //back
                                        Container(
                                            decoration: ShapeDecoration(
                                              color: const Color(0xffF2F2F2),
                                              shape: const CircleBorder(),
                                            ),
                                            child: IconButton(
                                              autofocus: true,
                                              icon: Image(
                                                image: AssetImage(
                                                    "images/back.png"),
                                                color: Color(0xff3F414E),
                                                width: 18.0,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )),
                                  ),
                            //cloud
                            Positioned(
                                top: 10.0,
                                left: 20.0,
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/cloud.png'),
                                  width: 50,
                                  color: Color(0xff616077).withOpacity(.3),
                                )),
                            //cloud
                            Positioned(
                                top: 130.0,
                                right: 20.0,
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/cloud.png'),
                                  width: 50,
                                  color: Color(0xff616077).withOpacity(.3),
                                )),
                            //botton clouds
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/cloud_top.png'),
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Image(
                                image: AssetImage('images/cloud_center.png'),
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                child: Image(
                                  image: AssetImage('images/cloud_bottom.png'),
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            //fins
                            Positioned(
                              top: 140.0,
                              right: 90.0,
                              child: Transform.rotate(
                                angle: 5.0,
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/fin.png'),
                                  width: 70,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 190.0,
                              right: 80.0,
                              child: Transform.rotate(
                                angle: 5.5,
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/fin.png'),
                                  width: 70,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 210.0,
                              right: 20.0,
                              child: Transform.rotate(
                                angle: 6.3,
                                child: Image(
                                  image: AssetImage(
                                      isDark ? '' : 'images/fin.png'),
                                  width: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //title & description
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 10.0, right: 10.0),
                        child: RichText(
                          text: TextSpan(
                            text: '${widget.playListArgs.title}\n',
                            style: TextStyle(
                                color: isDark
                                    ? const Color(0xFFE6E7F2)
                                    : const Color(0xff3F414E),
                                fontSize: 34,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${widget.playListArgs.type}\n',
                                  style: TextStyle(
                                    height: 3.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: isDark
                                        ? const Color(0xFF98A1BD)
                                        : const Color(0xffA1A4B2),
                                  )),
                              TextSpan(
                                  text: 'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13.0,
                                      color: Color(0xffA1A4B2))),
                              TextSpan(
                                  text: '\n\n${S.of(context).narrator}',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: isDark
                                          ? const Color(0xFFE6E7F2)
                                          : const Color(0xff3F414E))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //TabBar
            Theme(
              data: Theme.of(context).copyWith(
                  accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
              child: SliverAppBar(
                elevation: 0,
                snap: false,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  labelColor: isDark
                      ? const Color(0xFF8E97FD)
                      : const Color(0xff8E97FD),
                  unselectedLabelColor: isDark
                      ? const Color(0xFF98A1BD)
                      : const Color(0xffA1A4B2),
                  indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2.0, color: Color(0xff8E97FD)),
                      insets: EdgeInsets.symmetric(horizontal: 70.0)),
                  tabs: [
                    Tab(
                      child: Text(
                        S.of(context).voices,
                        style: TextStyle(letterSpacing: 1.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        S.of(context).favorite,
                        style: TextStyle(letterSpacing: 1.0),
                      ),
                    ),
                  ],
                ),
                expandedHeight: 30,
              ),
            ),
            //Voice & Favorite List
            SliverFillRemaining(
                child: TabBarView(
              controller: _tabController,
              children: [
                // Voice Tab
                Container(
                  color: isDark ? const Color(0xFF03174D) : Colors.white,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: musics.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                                left: 10,
                                top: 10,
                              ),
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
                                        image: AssetImage("images/play.png"),
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
                                    padding: const EdgeInsets.only(left: 10.0),
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
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/sound_player',
                                  arguments: PlayerModel(
                                      title: musics[index]["name"],
                                      boxTitle:
                                          widget.playListArgs.title.toString(),
                                      url:
                                          'https://www.bensound.com/bensound-music/bensound-clearday.mp3'));
                            },
                          );
                        }),
                  ),
                ),
                // Favorite Tab
                Container(
                  color: isDark ? const Color(0xFF03174D) : Colors.white,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: listFavAudio.isEmpty
                        ? Center(
                            child: Lottie.asset(
                              'assets/meditating_lady.json',
                              height: 350.0,
                            ),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listFavAudio.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: 10, left: 10, top: 10),
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
                                              listFavAudio[index].audioName,
                                              style: TextStyle(
                                                  color: isDark
                                                      ? const Color(0xFFE6E7F2)
                                                      : const Color(0xff3F414E),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0),
                                            ),
                                            Text(
                                              listFavAudio[index].audioName,
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
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/sound_player',
                                    arguments: PlayerModel(
                                        title: listFavAudio[index].audioName,
                                        boxTitle: widget.playListArgs.title
                                            .toString(),
                                        url:
                                            'https://www.bensound.com/bensound-music/bensound-clearday.mp3'),
                                  );
                                },
                              );
                            }),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Future<String> getLang() async {
    Future<SharedPreferences> _langPrefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _langPrefs;
    var lang = prefs.getString("lang");
    if (lang == null) {
      return null;
    }
    return lang;
  }
}

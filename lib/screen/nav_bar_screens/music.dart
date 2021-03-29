import 'package:SilentMoon/data/model/sound_play_model.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Map> musics = [
    {"name": "Focus Attention", "time": "10 MIN"},
    {"name": "Body Scan", "time": "4 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Making Happiness ", "time": "3 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Focus Attention", "time": "6 MIN"},
    {"name": "Body Scan", "time": "2 MIN"},
    {"name": "Making Happiness", "time": "7 MIN"},
    {"name": "Making Happiness", "time": "7 MIN"},
    {"name": "7Making Happiness", "time": "7 MIN"},
    {"name": "6Focus Attention", "time": "7 MIN"},
    {"name": "5Body Scan", "time": "7 MIN"},
    {"name": "4Body Scan", "time": "7 MIN"},
    {"name": "3Body Scan", "time": "7 MIN"},
    {"name": "2Body Scan", "time": "7 MIN"},
    {"name": "1Body Scan", "time": "7 MIN"},
  ];
  List<Map> favMusics = [
    {"name": "Body Scan", "time": "10 MIN"},
    {"name": "Body Scan", "time": "10 MIN"},
  ];
  bool isFavorite = false;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          //top images
          Theme(
            data: Theme.of(context).copyWith(
                accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
            child: SliverAppBar(
              expandedHeight: 350,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //top image
                    Container(
                      height: 250.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage("images/man_meditation.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    //title & description
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10.0),
                      child: RichText(
                        text: TextSpan(
                          text: '${S.of(context).musicTitle}\n',
                          style: TextStyle(
                              color: Color(0xff3F414E),
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${S.of(context).musicType}\n',
                                style: TextStyle(
                                  height: 3.0,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color(0xffA1A4B2),
                                )),
                            TextSpan(
                                text: 'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.0,
                                    color: Color(0xffA1A4B2))),
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
            data: Theme.of(context).copyWith(primaryColor: Colors.white),
            child: SliverAppBar(
              elevation: 0,
              snap: false,
              pinned: true,
              floating: true,
              expandedHeight: 0,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: false,
                labelColor: Color(0xff8E97FD),
                unselectedLabelColor: Color(0xffA1A4B2),
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
            ),
          ),
          //Voice & Favorite List
          SliverFillRemaining(
              child: TabBarView(
            controller: _tabController,
            children: [
              // Voice Tab
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 60.0),
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
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 1, color: Color(0xffA1A4B2))),
                                  child: IconButton(
                                    autofocus: true,
                                    icon: Image(
                                      image: AssetImage("images/play.png"),
                                      color: Color(0xffA1A4B2),
                                      width: 12.0,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/sound_player',
                                          arguments: SoundPlayModel(
                                              title: musics[index]["name"],
                                              boxTitle: S.of(context).music));
                                    },
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
                                            color: Color(0xff3F414E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                        musics[index]["time"],
                                        style: TextStyle(
                                            color: Color(0xffA1A4B2),
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
                                arguments: SoundPlayModel(
                                    title: musics[index]["name"],
                                    boxTitle: S.of(context).music));
                          },
                        );
                      }),
                ),
              ),
              // Favorite Tab
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 60.0),
                      itemCount: favMusics.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            padding:
                                EdgeInsets.only(bottom: 10, left: 10, top: 10),
                            child: Row(
                              children: [
                                // play btn
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 1, color: Color(0xffA1A4B2))),
                                  child: IconButton(
                                    autofocus: true,
                                    icon: Image(
                                      image: AssetImage("images/play.png"),
                                      color: Color(0xffA1A4B2),
                                      width: 12.0,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/sound_player',
                                          arguments: SoundPlayModel(
                                              title: musics[index]["name"],
                                              boxTitle: S.of(context).music));
                                    },
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
                                        favMusics[index]["name"],
                                        style: TextStyle(
                                            color: Color(0xff3F414E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                        favMusics[index]["time"],
                                        style: TextStyle(
                                            color: Color(0xffA1A4B2),
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
                                arguments: SoundPlayModel(
                                    title: musics[index]["name"],
                                    boxTitle: S.of(context).music));
                          },
                        );
                      }),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Meditate extends StatefulWidget {
  @override
  _MeditateState createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    List boxs = const [
      {
        "img": "images/meditate_one.png",
        "title": "7 Days of Calm",
      },
      {
        "img": "images/meditate_two.png",
        "title": "Anxiet Release",
      },
      {
        "img": "images/meditate_three.png",
        "title": "Anxiet Release",
      },
      {
        "img": "images/meditate_four.png",
        "title": "Anxiet Release",
      }
    ];
    return Theme(
      data: Theme.of(context).copyWith(accentColor: Color(0xff8E97FD)),
      child: ListView(
        children: [
          // title
          Padding(
            padding: const EdgeInsets.only(top: 66.0),
            child: Center(
              child: Text(
                'Meditate',
                style: TextStyle(fontSize: 28.0, color: Color(0xff3F414E)),
              ),
            ),
          ),
          //description
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
            child: Center(
              child: Text(
                'Soothing bedtime stories to help you fall into a deep and natural sleep',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Color(0xffA0A3B1)),
              ),
            ),
          ),
          // tabbar
          Container(
              padding: const EdgeInsets.only(top: 20.0),
              height: 120.0,
              child: DefaultTabController(
                length: 5,
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    physics: BouncingScrollPhysics(),
                    tabs: [
                      _horizonListViewItem(
                          imgAsset: "images/all.png",
                          title: 'All',
                          bgColor: Color(0xffA0A3B1),
                          titleColor: Color(0xffA0A3B1)),
                      _horizonListViewItem(
                          imgAsset: "images/favorite.png",
                          title: 'My',
                          bgColor: Color(0xffA0A3B1),
                          titleColor: Color(0xffA0A3B1)),
                      _horizonListViewItem(
                          imgAsset: "images/anxious.png",
                          title: 'Anxious',
                          bgColor: Color(0xffA0A3B1),
                          titleColor: Color(0xffA0A3B1)),
                      _horizonListViewItem(
                          imgAsset: "images/sleep_tab.png",
                          title: 'Sleep',
                          bgColor: Color(0xffA0A3B1),
                          titleColor: Color(0xffA0A3B1)),
                      _horizonListViewItem(
                          imgAsset: "images/kids.png",
                          title: 'Kids',
                          bgColor: Color(0xffA0A3B1),
                          titleColor: Color(0xffA0A3B1)),
                    ]),
              )), //Daily Calm
          // Daily Calm
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Container(
              width: 374,
              height: 95,
              decoration: BoxDecoration(
                  color: Color(0xfff9dfce),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage("images/daily_calm.png"))),
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Calm',
                          style: TextStyle(
                              color: Color(0xff3F414E),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'APR 30',
                              style: TextStyle(
                                  color: Color(0xff5A6175), fontSize: 14.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff5A6175),
                                ),
                              ),
                            ),
                            Text(
                              'PAUSE PRACTICE',
                              style: TextStyle(
                                  color: Color(0xff5A6175), fontSize: 14.0),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      decoration: const ShapeDecoration(
                        color: Color(0xff3F414E),
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        autofocus: true,
                        icon: Image(
                          image: AssetImage("images/play.png"),
                          width: 12.0,
                          color: Color(0xffF0F1F2),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/play_list',
                              arguments: {
                                "title": "Daily Calm",
                                "type": "APR 30"
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Voice ListView
          Container(
              padding: EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
              height: MediaQuery.of(context).size.height * .65,
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                itemCount: boxs.length,
                itemBuilder: (BuildContext context, int index) => new InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          image: AssetImage(boxs[index]["img"]),
                          fit: BoxFit.cover,
                        )),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0)),
                              child: SizedBox(
                                child: BackdropFilter(
                                  filter: ui.ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: Center(
                                      child: Text(
                                    boxs[index]["title"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  )),
                                ),
                              ),
                            ))),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/play_list', arguments: {
                      "title": boxs[index]["title"],
                      "type": "MEDITATION"
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _horizonListViewItem(
      {Color bgColor,
      @required String imgAsset,
      @required String title,
      Color titleColor}) {
    return InkWell(
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
                color: Colors.white,
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
      onTap: () {},
    );
  }
}

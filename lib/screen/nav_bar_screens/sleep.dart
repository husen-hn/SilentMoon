import 'package:SilentMoon/widget/music_box.dart';
import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  // used in Grid List
  List musicBoxs = [
    {
      "img_loc": "images/sleep_grid_banner_one.png",
      "title": 'Night Island',
      "time": '45 MIN',
      "type": 'SLEEP MUSIC',
    },
    {
      "img_loc": "images/sleep_grid_banner_two.png",
      "title": 'Night Island',
      "time": '45 MIN',
      "type": 'SLEEP MUSIC',
    },
    {
      "img_loc": "images/sleep_grid_banner_three.png",
      "title": 'Night Island',
      "time": '45 MIN',
      "type": 'SLEEP MUSIC',
    },
    {
      "img_loc": "images/sleep_grid_banner_four.png",
      "title": 'Night Island',
      "time": '45 MIN',
      "type": 'SLEEP MUSIC',
    }, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(accentColor: Color(0xff8E97FD)),
          child: ListView(
            children: [
              //top image & title & description & horizon list
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage("images/sleep_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 90.0),
                          child: Column(
                            children: [
                              //title
                              Text(
                                'Sleep Stories',
                                style: TextStyle(
                                    fontSize: 28.0, color: Color(0xffE6E7F2)),
                              ),
                              //description
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50.0, right: 50.0, top: 10.0),
                                child: Center(
                                  child: Text(
                                    'Soothing bedtime stories to help you fall into a deep and natural sleep',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xffEBEAEC)),
                                  ),
                                ),
                              ),
                              //tabbar
                              Container(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  height: 120.0,
                                  child: DefaultTabController(
                                    length: 5,
                                    child: TabBar(
                                        indicatorColor: Colors.transparent,
                                        isScrollable: true,
                                        tabs: [
                                          _horizonListViewItem(
                                              imgAsset: "images/all.png",
                                              title: 'All',
                                              bgColor: Color(0xff586894),
                                              titleColor: Color(0xff98A1BD)),
                                          _horizonListViewItem(
                                              imgAsset: "images/favorite.png",
                                              title: 'My',
                                              bgColor: Color(0xff586894),
                                              titleColor: Color(0xff98A1BD)),
                                          _horizonListViewItem(
                                              imgAsset: "images/anxious.png",
                                              title: 'Anxious',
                                              bgColor: Color(0xff586894),
                                              titleColor: Color(0xff98A1BD)),
                                          _horizonListViewItem(
                                              imgAsset: "images/sleep_tab.png",
                                              title: 'Sleep',
                                              bgColor: Color(0xff586894),
                                              titleColor: Color(0xff98A1BD)),
                                          _horizonListViewItem(
                                              imgAsset: "images/kids.png",
                                              title: 'Kids',
                                              bgColor: Color(0xff586894),
                                              titleColor: Color(0xff98A1BD)),
                                        ]),
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              // Grid List
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (2 / 1),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                children: musicBoxs.map((e) {
                  return MusicBox(
                    darkMood: false,
                    bgColor: Colors.grey[50],
                    imgLocalPath: e["img_loc"],
                    imgBg: Color(0xff4C53B4),
                    title: e["title"],
                    titleColor: Color(0xff3F414E),
                    time: e["time"],
                    timeColor: Color(0xffA1A4B2),
                    dotColor: Color(0xffA1A4B2),
                    type: e["type"],
                    typeColor: Color(0xffA1A4B2),
                    // onTap: this._natureBoxTap(),
                  );
                }).toList(),
              )
            ],
          )),
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

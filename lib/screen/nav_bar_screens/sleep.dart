import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(
              accentColor: Color(0xff8E97FD), primaryColor: Colors.white),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                pinned: false,
                expandedHeight: 300,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            color: Colors.grey[50]),
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
                                            fontSize: 28.0,
                                            color: Color(0xffE6E7F2)),
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
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          height: 120.0,
                                          child: DefaultTabController(
                                            length: 5,
                                            child: TabBar(
                                                indicatorColor:
                                                    Colors.transparent,
                                                isScrollable: true,
                                                tabs: [
                                                  _horizonListViewItem(
                                                      imgAsset:
                                                          "images/all.png",
                                                      title: 'All',
                                                      bgColor:
                                                          Color(0xff586894),
                                                      titleColor:
                                                          Color(0xff98A1BD)),
                                                  _horizonListViewItem(
                                                      imgAsset:
                                                          "images/favorite.png",
                                                      title: 'My',
                                                      bgColor:
                                                          Color(0xff586894),
                                                      titleColor:
                                                          Color(0xff98A1BD)),
                                                  _horizonListViewItem(
                                                      imgAsset:
                                                          "images/anxious.png",
                                                      title: 'Anxious',
                                                      bgColor:
                                                          Color(0xff586894),
                                                      titleColor:
                                                          Color(0xff98A1BD)),
                                                  _horizonListViewItem(
                                                      imgAsset:
                                                          "images/sleep_tab.png",
                                                      title: 'Sleep',
                                                      bgColor:
                                                          Color(0xff586894),
                                                      titleColor:
                                                          Color(0xff98A1BD)),
                                                  _horizonListViewItem(
                                                      imgAsset:
                                                          "images/kids.png",
                                                      title: 'Kids',
                                                      bgColor:
                                                          Color(0xff586894),
                                                      titleColor:
                                                          Color(0xff98A1BD)),
                                                ]),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Music List
              // SliverFixedExtentList(
              //   itemExtent: 50.0,
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {

              //       return Column(
              //         children: [
              //           Container(
              //             de
              //           )
              //         ],
              //       )
              //     },
              //   ),
              // ),
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

// Widget _sleepMusicBanner() {
//   return Contianer(

//   );
// }
}

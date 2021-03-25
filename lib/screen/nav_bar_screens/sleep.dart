import 'package:SilentMoon/data/model/music_box_model.dart';
import 'package:SilentMoon/widget/banner_night.dart';
import 'package:SilentMoon/widget/music_box.dart';
import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> with TickerProviderStateMixin {
  // used in Grid List
  List<MusicBoxModel> musicBoxs = [
    MusicBoxModel("images/sleep_grid_banner_one.png", Color(0xfff8bbd0),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_two.png", Color(0xffAFDBC5),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_three.png", Color(0xffFFC97E),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
    MusicBoxModel("images/sleep_grid_banner_four.png", Color(0xffFFC97E),
        'Night Island', '45 MIN', 'SLEEP MUSIC'),
  ];
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
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
          child: Column(
            children: [
              // Title
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Center(
                  child: Text(
                    'Sleep Stories',
                    style: TextStyle(fontSize: 28.0, color: Color(0xffE6E7F2)),
                  ),
                ),
              ),
              // Description
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Center(
                  child: Text(
                    'Soothing bedtime stories to help you fall into a deep and natural sleep',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Color(0xffEBEAEC)),
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
              // Tabs Contents
              Container(
                //TODO set height size
                height: MediaQuery.of(context).size.height * .6,
                child: TabBarView(
                    controller: _nestedTabController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      // First Tab (All)
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // banner
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: BannerNight(
                              bgImage: AssetImage("images/sleep_banner.png"),
                              title: 'The Ocean Moon',
                              titleColor: Color(0xffFFE7BF),
                              description:
                                  'Non-stop 8- hour mixes of our\nmost popular sleep audio',
                              descriptionColor: Color(0xffF9F9FF),
                              btnTitle: 'START',
                              btnColor: Color(0xffEBEAEC),
                              btnTxtColor: Color(0xff3F414E),
                              onTap: this._onBannerNightPress,
                            ),
                          ),
                          // Grid List
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10.0),
                            children: musicBoxs.map((e) {
                              return MusicBox(
                                darkMood: false,
                                bgColor: Colors.grey[50],
                                imgLocalPath: e.img,
                                imgBg: Color(0xff4C53B4),
                                title: e.title,
                                titleColor: Color(0xff3F414E),
                                time: e.time,
                                timeColor: Color(0xffA1A4B2),
                                dotColor: Color(0xffA1A4B2),
                                type: e.type,
                                typeColor: Color(0xffA1A4B2),
                                onTap: this._musicBoxTap,
                              );
                            }).toList(),
                          )
                        ],
                      ),
                      Center(child: Text('data2')),
                      Center(child: Text('data3')),
                      Center(child: Text('data4')),
                      Center(child: Text('data5')),
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
      height: 100,
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

  _onBannerNightPress(String title) {
    Navigator.pushNamed(context, '/play_list',
        arguments: {"title": title, "type": 'MUSIC'});
  }

  _musicBoxTap(String title, String type) {
    Navigator.pushNamed(context, '/play_list',
        arguments: {"title": title, "type": type});
  }
}

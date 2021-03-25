import 'package:SilentMoon/data/model/music_box_model.dart';
import 'package:SilentMoon/widget/banner_box.dart';
import 'package:SilentMoon/widget/music_box.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // used in Recomended List
    List<MusicBoxModel> musicBoxs = [
      MusicBoxModel("images/nature.png", Color(0xfff8bbd0), 'Nature',
          '3-10 MIN', 'MEDITATION'),
      MusicBoxModel("images/focus.png", Color(0xffAFDBC5), 'Focus', '3-10 MIN',
          'MEDITATION'),
      MusicBoxModel("images/happiness.png", Color(0xffFFC97E), 'Happiness',
          '3-10 MIN', 'MEDITATION'),
    ];
    //hours to say welcome
    List morning = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    List afternoon = [12, 13, 14, 15, 16, 17, 18];
    List night = [19, 20, 21, 22, 23, 24, 1, 2, 3, 4, 5, 6];
    return Theme(
      data: Theme.of(context).copyWith(accentColor: Color(0xff8E97FD)),
      child: ListView(
        children: [
          // Title
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Silent',
                  style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                      color: Color(0xff3F414E),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .1,
                    height: MediaQuery.of(context).size.height * .1,
                    child: Image(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
                Text(
                  'Moon',
                  style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                      color: Color(0xff3F414E),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Welcome
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                morning.contains(DateTime.now().hour)
                    ? 'Good Morning,'
                    : afternoon.contains(DateTime.now().hour)
                        ? 'Good Afternoon'
                        : 'Good Evening',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3F414E))),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 8.0, left: 12.0, bottom: 12.0),
            child: Text(
                night.contains(DateTime.now().hour)
                    ? 'We Wish you have a good night'
                    : 'We Wish you have a good day',
                style: TextStyle(fontSize: 20.0, color: Color(0xffA1A4B2))),
          ),
          // Basics & Relaxation
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: BannerBox(
                  bgColor: Color(0xff8E97FD),
                  iconLocalPath: "images/apple.png",
                  iconWidth: MediaQuery.of(context).size.width * .3,
                  title: 'Basics',
                  titleColor: Color(0xffFFECCC),
                  type: 'COURSE',
                  typeColor: Color(0xffF7E8D0),
                  time: '3-10 MIN',
                  timeColor: Color(0xffEBEAEC),
                  btnColor: Color(0xffEBEAEC),
                  btnTxtColor: Color(0xff3F414E),
                  onTap: this._basicsBannerBoxTap,
                )),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: BannerBox(
                    bgColor: Color(0xffFFDB9D),
                    iconLocalPath: "images/listen.png",
                    iconWidth: MediaQuery.of(context).size.width * .4,
                    title: 'Relaxation',
                    titleColor: Color(0xff3F414E),
                    type: 'MUSIC',
                    typeColor: Color(0xff524F53),
                    time: '3-10 MIN',
                    timeColor: Color(0xff524F53),
                    btnColor: Color(0xff3F414E),
                    btnTxtColor: Color(0xffFEFFFE),
                    onTap: this._relaxationBannerBoxTap,
                  ),
                )
              ],
            ),
          ),
          // Daily Thought
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: FittedBox(
              child: Container(
                width: 374,
                height: 95,
                decoration: BoxDecoration(
                    color: Color(0xff333242),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image:
                        DecorationImage(image: AssetImage("images/boxbg.png"))),
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily Thought',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'MEDITATION',
                                style: TextStyle(
                                    color: Color(0xffEBEAEC), fontSize: 14.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xffEBEAEC),
                                  ),
                                ),
                              ),
                              Text(
                                '3-10 MIN',
                                style: TextStyle(
                                    color: Color(0xffEBEAEC), fontSize: 14.0),
                              )
                            ],
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          autofocus: true,
                          icon: Image(
                            image: AssetImage("images/play.png"),
                            width: 12.0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/play_list',
                                arguments: {
                                  "title": "Daily Thought",
                                  "type": "MEDITATION"
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Recomended List
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 30.0, bottom: 15.0),
            child: Text('Recomended for you',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3F414E))),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(right: 12.0, left: 12.0),
              scrollDirection: Axis.horizontal,
              itemCount: musicBoxs.length,
              itemBuilder: (BuildContext context, int index) {
                return MusicBox(
                  darkMood: false,
                  bgColor: Colors.grey[50],
                  imgLocalPath: musicBoxs[index].img,
                  imgBg: musicBoxs[index].bgColor,
                  title: musicBoxs[index].title,
                  titleColor: Color(0xff3F414E),
                  time: musicBoxs[index].time,
                  timeColor: Color(0xffA1A4B2),
                  dotColor: Color(0xffA1A4B2),
                  type: musicBoxs[index].type,
                  typeColor: Color(0xffA1A4B2),
                  onTap: this._musicBoxTap,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.0,
                );
              },
            ),
          ),
          Container(
            height: 15.0,
          )
        ],
      ),
    );
  }

  _basicsBannerBoxTap(String title, String type) {
    Navigator.pushNamed(context, '/play_list',
        arguments: {"title": title, "type": type});
  }

  _relaxationBannerBoxTap(String title, String type) {
    Navigator.pushNamed(context, '/play_list',
        arguments: {"title": title, "type": type});
  }

  _musicBoxTap(String title, String type) {
    Navigator.pushNamed(context, '/play_list',
        arguments: {"title": title, "type": type});
  }
}

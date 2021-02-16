import 'package:feedTest/widget/banner_box.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
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
                        fontSize: 16.0,
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
                        fontSize: 16.0,
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
              child: Text('Good Morning,',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3F414E))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 8.0, left: 12.0, bottom: 12.0),
              child: Text('We Wish you have a good day',
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
                          iconWidth: Orientation == Orientation.portrait
                              ? MediaQuery.of(context).size.width * .2
                              : MediaQuery.of(context).size.width * .3,
                          title: 'Basics',
                          titleColor: Color(0xffFFECCC),
                          description: 'COURSE',
                          descriptionColor: Color(0xffF7E8D0),
                          time: '3-10 MIN',
                          timeColor: Color(0xffEBEAEC),
                          btnColor: Color(0xffEBEAEC),
                          btnTxtColor: Color(0xff3F414E))),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: BannerBox(
                        bgColor: Color(0xffFFDB9D),
                        iconLocalPath: "images/listen.png",
                        iconWidth: Orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width * .3
                            : MediaQuery.of(context).size.width * .4,
                        title: 'Relaxation',
                        titleColor: Color(0xff3F414E),
                        description: 'MUSIC',
                        descriptionColor: Color(0xff524F53),
                        time: '3-10 MIN',
                        timeColor: Color(0xff524F53),
                        btnColor: Color(0xff3F414E),
                        btnTxtColor: Color(0xffFEFFFE)),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("images/boxbg.png"))),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)), //here
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
                          padding: EdgeInsets.all(16.0),
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          child: Image(
                            image: AssetImage("images/play.png"),
                            width: 12.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Recomended
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 30.0, bottom: 15.0),
              child: Text('Recomended for you',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3F414E))),
            ),
            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: ,
            //   itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                      color: Color(0xff3F414E)),
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
                      color: Color(0xff3F414E)),
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
                top: 8.0, right: 8.0, left: 8.0, bottom: 12.0),
            child: Text('We Wish you have a good day',
                style: TextStyle(fontSize: 20.0, color: Color(0xffA1A4B2))),
          ),
          // Basics & Relaxation
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: musicBoxFirst(
                        bgColor: Color(0xff8E97FD),
                        icon: "images/apple.png",
                        iconWidth: Orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width * .2
                            : MediaQuery.of(context).size.width * .3,
                        text1: 'Basics',
                        text1color: Color(0xffFFECCC),
                        text2: 'COURSE',
                        text2color: Color(0xffF7E8D0),
                        text3: '3-10 MIN',
                        text3color: Color(0xffEBEAEC),
                        btnbg: Color(0xffEBEAEC),
                        btnTextColor: Color(0xff3F414E))),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: musicBoxFirst(
                      bgColor: Color(0xffFFDB9D),
                      icon: "images/listen.png",
                      iconWidth: Orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * .3
                          : MediaQuery.of(context).size.width * .4,
                      text1: 'Relaxation',
                      text1color: Color(0xff3F414E),
                      text2: 'MUSIC',
                      text2color: Color(0xff524F53),
                      text3: '3-10 MIN',
                      text3color: Color(0xff524F53),
                      btnbg: Color(0xff3F414E),
                      btnTextColor: Color(0xffFEFFFE)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget musicBoxFirst({
    bgColor,
    icon,
    iconWidth,
    text1,
    text1color,
    text2,
    text2color,
    text3,
    text3color,
    btnbg,
    btnTextColor,
  }) {
    return FittedBox(
      child: Container(
        width: 177,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top Icon
            Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(icon),
                        width: iconWidth,
                      ),
                    ),
                  ),
                  flex: 2,
                )
              ],
            ),
            // Text 1
            Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
              child: Text(
                text1,
                style: TextStyle(
                    color: text1color,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Text 2
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                text2,
                style: TextStyle(color: text2color, fontSize: 14.0),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 10.0,
              ),
              child: Row(
                children: [
                  // Text 3
                  Text(
                    text3,
                    style: TextStyle(color: text3color, fontSize: 14.0),
                  ),
                  Expanded(child: Container()),
                  // Button
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                      child: Text('START'),
                      style: TextButton.styleFrom(
                        backgroundColor: btnbg,
                        primary: btnTextColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

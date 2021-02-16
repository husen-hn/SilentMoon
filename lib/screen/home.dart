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
                  child: Image(
                    image: AssetImage("images/logo.png"),
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
                  child: Container(
                    width: 177,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff8E97FD),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container top Icon
                        Align(
                          alignment: Alignment.topRight,
                          child: Image(
                            image: AssetImage("images/apple.png"),
                          ),
                        ),
                        Text('Basics'),
                        Text('COURSE'),
                        Row(
                          children: [
                            Text('3-10 MIN'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Container(
                    width: 177,
                    height: 210,
                    color: Color(0xffFFC97E),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

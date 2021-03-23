import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.only(top: 30.0),
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
              Container(
                width: MediaQuery.of(context).size.width * .1,
                height: MediaQuery.of(context).size.height * .1,
                padding: const EdgeInsets.all(3.0),
                child: Image(
                  image: AssetImage("images/logo.png"),
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
        // Description
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 30.0),
          child: Text(
            'Meditation App, Explore the app, Find some peace of mind to prepare for meditation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              height: 1.5,
              letterSpacing: 1,
              color: Color(0xff3F414E),
            ),
          ),
        ), // Introduction
        // Introduction
        InkWell(
          child: _profile_item('Introduction', Color(0xff565D70),
              Color(0xffFFDB9D), Icons.keyboard_arrow_right),
        ),
        // Suggestions
        InkWell(
          child: _profile_item('Suggestions', Color(0xffFFECCC),
              Color(0xff8E97FD), Icons.keyboard_arrow_right),
          // onTap: () => _sendSuggestionMail(),
        ),
        // AboutUs
        InkWell(
          child: _profile_item('About us', Color(0xffFFECCC), Color(0xffFA6E5A),
              Icons.keyboard_arrow_right),
        ),
        // Share
        InkWell(
          child: _profile_item(
              'share', Color(0xffFFECCC), Color(0xff6CB28E), Icons.share),
          onTap: () => _onShare(),
        ),
        // Recent changes
        InkWell(
          child: _profile_item('Recent changes', Color(0xffFFECCC),
              Color(0xffD9A5B5), Icons.keyboard_arrow_right),
        ),
        // DayMode/NightMode
      ],
    );
  }

  Widget _profile_item(
      String title, Color titleColor, Color bgColor, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), color: bgColor),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: titleColor),
          ),
          Expanded(child: Container()),
          Icon(
            icon,
            color: titleColor,
          )
        ],
      ),
    );
  }

  _onShare() async {
    final RenderBox box = context.findRenderObject();
    //TODO
    await Share.share('check out my app',
        subject: 'Look what I made!',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  // _sendSuggestionMail() async {
  //   final Email email = Email(
  //     body: 'My Suggestions are ....',
  //     subject: 'Suggestions for SilentMoon',
  //     recipients: ['hosseinspell@gmail.com'],
  //     isHTML: false,
  //   );

  //   await FlutterEmailSender.send(email);
  // }
}

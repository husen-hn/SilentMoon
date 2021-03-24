import 'package:SilentMoon/widget/profile_btn.dart';
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
        ProfileBtn(
            btnTitle: 'Introduction',
            btnColor: Color(0xffFFDB9D),
            btnTxtColor: Color(0xff565D70),
            icon: Icons.keyboard_arrow_right),
        // Suggestions
        ProfileBtn(
            btnTitle: 'Suggestions',
            btnColor: Color(0xff8E97FD),
            btnTxtColor: Color(0xffFFECCC),
            icon: Icons.keyboard_arrow_right),

        // AboutUs
        ProfileBtn(
            btnTitle: 'About us',
            btnColor: Color(0xffFA6E5A),
            btnTxtColor: Color(0xffFFECCC),
            icon: Icons.keyboard_arrow_right),

        // Share
        ProfileBtn(
          btnTitle: 'Share',
          btnColor: Color(0xff6CB28E),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.share,
          onTap: this._onItemPress,
        ),

        // Recent changes
        ProfileBtn(
          btnTitle: 'Recent changes',
          btnColor: Color(0xffD9A5B5),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.keyboard_arrow_right,
          onTap: this._onItemPress,
        ),

        // DayMode/NightMode
      ],
    );
  }

  _onItemPress(String title) {
    if (title == 'Share') {
      _onShare();
    } else if (title == 'Recent changes') {
      Navigator.pushNamed(context, '/profile_recent_changes');
    }
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

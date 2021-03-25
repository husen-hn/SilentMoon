import 'package:SilentMoon/widget/profile_btn.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us',
          style: TextStyle(color: const Color(0xff3F414E)),
        ),
        iconTheme: IconThemeData(color: const Color(0xff3F414E)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'meditation app, Explore the app, Find some peace of mind to prepare for meditation. using Flutter and MUSOPEN music services.',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          ProfileBtn(
              btnTitle: 'MUSOPEN',
              btnColor: const Color(0xffB6B8BF),
              btnTxtColor: const Color(0xff3F414E),
              icon: Icons.keyboard_arrow_right,
              onTap: this._onBtnTap),
          ProfileBtn(
              btnTitle: 'GitHub',
              btnColor: const Color(0xffB6B8BF),
              btnTxtColor: const Color(0xff3F414E),
              icon: Icons.keyboard_arrow_right,
              onTap: this._onBtnTap),
          ProfileBtn(
              btnTitle: 'Twitter',
              btnColor: const Color(0xffB6B8BF),
              btnTxtColor: const Color(0xff3F414E),
              icon: Icons.keyboard_arrow_right,
              onTap: this._onBtnTap),
          ProfileBtn(
              btnTitle: 'LICENSE',
              btnColor: const Color(0xffB6B8BF),
              btnTxtColor: const Color(0xff3F414E),
              icon: Icons.keyboard_arrow_right,
              onTap: this._onBtnTap)
        ],
      ),
    );
  }

  _onBtnTap(String btnTitle) {
    if (btnTitle == 'MUSOPEN') {
      _launchURL('https://musopen.org/');
    } else if (btnTitle == 'GitHub') {
      _launchURL('https://github.com/husen-hn/SilentMoon');
    } else if (btnTitle == 'Twitter') {
      _launchURL('https://twitter.com/husen_hn');
    } else if (btnTitle == 'LICENSE') {
      _launchURL('https://github.com/husen-hn/SilentMoon/blob/master/LICENSE');
    }
  }

  void _launchURL(String url) async => await launch(url);
}

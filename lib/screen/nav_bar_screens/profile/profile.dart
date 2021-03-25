import 'package:SilentMoon/widget/lang_btn.dart';
import 'package:SilentMoon/widget/profile_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _switchValue = false;
  List<bool> choosedLang = [true, false, false, false];
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
          icon: Icons.keyboard_arrow_right,
          onTap: this._onItemPress,
        ),
        // Language
        ProfileBtn(
          btnTitle: 'Language',
          btnColor: Color(0xff8E97FD),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.translate,
          onTap: this._onItemPress,
        ),
        // AboutUs
        ProfileBtn(
          btnTitle: 'About us',
          btnColor: Color(0xffFA6E5A),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.keyboard_arrow_right,
          onTap: this._onItemPress,
        ),
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
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
          child: TextButton(
            child: Row(
              children: [
                Text(
                  'Dark Mode',
                ),
                Expanded(child: Container()),
                Container(
                  height: 30,
                  child: CupertinoSwitch(
                    value: _switchValue,
                    activeColor: Color(0xffFFCF86),
                    trackColor: Color(0xff64637D),
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff3F414E),
              primary: const Color(0xffFFCF86),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
            onPressed: () {
              setState(() {
                _switchValue = !_switchValue;
              });
            },
          ),
        )
      ],
    );
  }

  _onItemPress(String title) {
    if (title == 'Share') {
      _onShare();
    } else if (title == 'Recent changes') {
      Navigator.pushNamed(context, '/profile_recent_changes');
    } else if (title == 'About us') {
      Navigator.pushNamed(context, '/profile_about_us');
    } else if (title == 'Language') {
      _langBottomSheet();
    } else if (title == 'Introduction') {
      Navigator.pushNamed(context, '/profile_introduction');
    }
  }

  _langBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: ListView(
                children: [
                  Center(
                      child: Text(
                    'Choose Language\n',
                    style: TextStyle(
                        fontSize: 18.0, color: const Color(0xff3F414E)),
                  )),
                  LangBtn(
                    btnTitle: 'English',
                    imgAsset: AssetImage("images/united_states.png"),
                    isActive: choosedLang[0],
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: 'Germany',
                    imgAsset: AssetImage("images/germany.png"),
                    isActive: choosedLang[1],
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: 'Russia',
                    imgAsset: AssetImage("images/russia.png"),
                    isActive: choosedLang[2],
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: 'United Arab Emirates',
                    imgAsset: AssetImage("images/united_arab_emirates.png"),
                    isActive: choosedLang[3],
                    onTap: this._chooseLanguage,
                  ),
                ],
              ),
            ),
          );
        });
  }

  _chooseLanguage(String btnTitle) {
    if (btnTitle == 'English') {
      setState(() {
        choosedLang = [true, false, false, false];
      });
      Navigator.pop(context);
    } else if (btnTitle == 'Germany') {
      setState(() {
        choosedLang = [false, true, false, false];
      });
      Navigator.pop(context);
    } else if (btnTitle == 'Russia') {
      setState(() {
        choosedLang = [false, false, true, false];
      });
      Navigator.pop(context);
    } else if (btnTitle == 'United Arab Emirates') {
      setState(() {
        choosedLang = [false, false, false, true];
      });
      Navigator.pop(context);
    }
  }

  _onShare() async {
    final RenderBox box = context.findRenderObject();
    //TODO
    await Share.share('check out my app',
        subject: 'Look what I made!',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}

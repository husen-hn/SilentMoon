import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:SilentMoon/theme/style.dart';
import 'package:SilentMoon/component/profile_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool isDark;
  @override
  void didChangeDependencies() {
    isDark = Provider.of<ThemeChanger>(context).getTheme() == darkTheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).aboutUs,
          style: TextStyle(
              color:
                  isDark ? const Color(0xFFE6E7F2) : const Color(0xff3F414E)),
        ),
        iconTheme: IconThemeData(
            color: isDark ? const Color(0xFFE6E7F2) : const Color(0xff3F414E)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF03174C) : Colors.grey[50],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              S.of(context).aboutUsDesc,
              style: TextStyle(
                  fontSize: 14.0,
                  color: isDark
                      ? const Color(0xFFE6E7F2)
                      : const Color(0xff3F414E)),
            ),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ProfileBtn(
                btnTitle: 'MUSOPEN',
                btnColor: const Color(0xffB6B8BF),
                btnTxtColor: const Color(0xff3F414E),
                icon: Icons.keyboard_arrow_right,
                onTap: this._onBtnTap),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ProfileBtn(
                btnTitle: 'GitHub',
                btnColor: const Color(0xffB6B8BF),
                btnTxtColor: const Color(0xff3F414E),
                icon: Icons.keyboard_arrow_right,
                onTap: this._onBtnTap),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ProfileBtn(
                btnTitle: 'Twitter',
                btnColor: const Color(0xffB6B8BF),
                btnTxtColor: const Color(0xff3F414E),
                icon: Icons.keyboard_arrow_right,
                onTap: this._onBtnTap),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: ProfileBtn(
                btnTitle: 'LICENSE',
                btnColor: const Color(0xffB6B8BF),
                btnTxtColor: const Color(0xff3F414E),
                icon: Icons.keyboard_arrow_right,
                onTap: this._onBtnTap),
          )
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

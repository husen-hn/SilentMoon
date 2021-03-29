import 'package:SilentMoon/data/model/language_code.dart';
import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/widget/lang_btn.dart';
import 'package:SilentMoon/widget/lang_dialog.dart';
import 'package:SilentMoon/widget/profile_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _switchValue = false;
  String lang = '';
  bool isRtl = false;

  void _getLang() async {
    try {
      String data = await getLang();
      setState(() {
        lang = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getLang();
  }

  @override
  Widget build(BuildContext context) {
    if (lang == '' || lang == null) {
      lang = 'English';
    }
    if (lang == 'Iran' ||
        lang == 'إيران' ||
        lang == 'ایران' ||
        lang == 'Иран' ||
        lang == 'United Arab Emirates' ||
        lang == 'الإمارات العربية المتحدة' ||
        lang == 'Vereinigte Arabische Emirate' ||
        lang == 'امارات متحده عربی' ||
        lang == 'Объединенные Арабские Эмираты') {
      isRtl = true;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).title1,
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
                  S.of(context).title2,
                  style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                      color: Color(0xff3F414E),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // Description
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 30.0),
          child: Text(
            S.of(context).profileDesc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              height: 1.5,
              letterSpacing: 1,
              color: Color(0xff3F414E),
            ),
          ),
        ), // Introduction
        // Language
        ProfileBtn(
          btnTitle: S.of(context).language,
          btnColor: Color(0xff8E97FD),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.translate,
          onTap: this._onItemPress,
        ),
        // AboutUs
        ProfileBtn(
          btnTitle: S.of(context).aboutUs,
          btnColor: Color(0xffFA6E5A),
          btnTxtColor: Color(0xffFFECCC),
          icon: isRtl ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
          onTap: this._onItemPress,
        ),
        // Share
        ProfileBtn(
          btnTitle: S.of(context).share,
          btnColor: Color(0xff6CB28E),
          btnTxtColor: Color(0xffFFECCC),
          icon: Icons.share,
          onTap: this._onItemPress,
        ),
        // Recent changes
        ProfileBtn(
          btnTitle: S.of(context).recentchanges,
          btnColor: Color(0xffD9A5B5),
          btnTxtColor: Color(0xffFFECCC),
          icon: isRtl ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
          onTap: this._onItemPress,
        ),
        // DayMode/NightMode
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
          child: TextButton(
            child: Row(
              children: [
                Text(
                  S.of(context).darkMode,
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
    if (title == S.of(context).share) {
      _onShare();
    } else if (title == S.of(context).recentchanges) {
      Navigator.pushNamed(context, '/profile_recent_changes');
    } else if (title == S.of(context).aboutUs) {
      Navigator.pushNamed(context, '/profile_about_us');
    } else if (title == S.of(context).language) {
      _langBottomSheet();
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
                    '${S.of(context).chooseLanguage}\n',
                    style: TextStyle(
                        fontSize: 18.0, color: const Color(0xff3F414E)),
                  )),
                  LangBtn(
                    btnTitle: S.of(context).english,
                    imgAsset: AssetImage("images/united_states.png"),
                    isActive: lang == 'English' ? true : false,
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: S.of(context).germany,
                    imgAsset: AssetImage("images/germany.png"),
                    isActive: lang == 'Germany' ? true : false,
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: S.of(context).russia,
                    imgAsset: AssetImage("images/russia.png"),
                    isActive: lang == 'Russia' ? true : false,
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: S.of(context).unitedArabEmirates,
                    imgAsset: AssetImage("images/united_arab_emirates.png"),
                    isActive: lang == 'United Arab Emirates' ? true : false,
                    onTap: this._chooseLanguage,
                  ),
                  LangBtn(
                    btnTitle: S.of(context).iran,
                    imgAsset: AssetImage("images/iran.png"),
                    isActive: lang == 'Iran' ? true : false,
                    onTap: this._chooseLanguage,
                  ),
                ],
              ),
            ),
          );
        });
  }

  _chooseLanguage(String btnTitle) {
    _showDialog(btnTitle);
  }

  _showDialog(String title) {
    return showDialog(
        context: context,
        builder: (context) {
          return LangDialog(
            dialogIcon: Lottie.asset(
              'assets/translate.json',
              height: 100,
            ),
            title: S.of(context).changeLangQues,
            warning: S.of(context).changeLangWarning,
            btn: Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _changeLanguage(title);
                  },
                  child: Text(S.of(context).changeLangDone,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal))),
            ),
          );
        });
  }

  _changeLanguage(String btnTitle) {
    if (btnTitle == 'English' ||
        btnTitle == 'الإنجليزية' ||
        btnTitle == 'Englisch' ||
        btnTitle == 'انگلیسی' ||
        btnTitle == 'английский') {
      setLang('English');
      _languageChoose(
        LanguageCode(
          language: 'English',
          locale: Locale('en'),
        ),
      );
      Navigator.pushNamed(context, '/restart');
    } else if (btnTitle == 'Germany' ||
        btnTitle == 'ألمانيا' ||
        btnTitle == 'Deutschland' ||
        btnTitle == 'آلمان' ||
        btnTitle == 'Германия') {
      setLang('Germany');
      _languageChoose(
        LanguageCode(
          language: 'Germany',
          locale: Locale('de'),
        ),
      );
      Navigator.pushNamed(context, '/restart');
    } else if (btnTitle == 'Russia' ||
        btnTitle == 'روسيا' ||
        btnTitle == 'Russland' ||
        btnTitle == 'روسیه' ||
        btnTitle == 'Россия') {
      setLang('Russia');
      _languageChoose(
        LanguageCode(
          language: 'Russia',
          locale: Locale('ru'),
        ),
      );
      Navigator.pushNamed(context, '/restart');
    } else if (btnTitle == 'United Arab Emirates' ||
        btnTitle == 'الإمارات العربية المتحدة' ||
        btnTitle == 'Vereinigte Arabische Emirate' ||
        btnTitle == 'امارات متحده عربی' ||
        btnTitle == 'Объединенные Арабские Эмираты') {
      setLang('United Arab Emirates');
      _languageChoose(
        LanguageCode(
          language: 'United Arab Emirates',
          locale: Locale('ar'),
        ),
      );
      Navigator.pushNamed(context, '/restart');
    } else if (btnTitle == 'Iran' ||
        btnTitle == 'إيران' ||
        btnTitle == 'ایران' ||
        btnTitle == 'Иран') {
      setLang('Iran');
      _languageChoose(
        LanguageCode(
          language: 'Iran',
          locale: Locale('fa'),
        ),
      );
      Navigator.pushNamed(context, '/restart');
    }
  }

  _languageChoose(LanguageCode languageCode) {
    setState(() {
      S.load(languageCode.locale);
    });
  }

  _onShare() async {
    final RenderBox box = context.findRenderObject();
    //TODO
    await Share.share('check out my app',
        subject: 'Look what I made!',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  setLang(String lang) async {
    Future<SharedPreferences> _langPrefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _langPrefs;
    prefs.setString("lang", lang);
  }

  Future<String> getLang() async {
    Future<SharedPreferences> _langPrefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _langPrefs;
    var lang = prefs.getString("lang");
    if (lang == null) {
      return null;
    }
    return lang;
  }
}

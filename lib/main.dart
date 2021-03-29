import 'package:SilentMoon/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:SilentMoon/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SilentMoonApp());
}

class SilentMoonApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SilentMoonApp> {
  String lang = '';

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
    return MaterialApp(
      theme: Theme.of(context).copyWith(accentColor: Color(0xff8E97FD)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: lang == 'English' || lang == '' || lang == null
          ? Locale.fromSubtags(languageCode: 'en')
          : lang == 'Germany'
              ? Locale.fromSubtags(languageCode: 'de')
              : lang == 'Russia'
                  ? Locale.fromSubtags(languageCode: 'ru')
                  : lang == 'Iran'
                      ? Locale.fromSubtags(languageCode: 'fa')
                      : Locale.fromSubtags(languageCode: 'ar'),
    );
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

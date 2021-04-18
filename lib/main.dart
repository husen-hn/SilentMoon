import 'dart:io';

import 'package:SilentMoon/generated/l10n.dart';
import 'package:SilentMoon/model/audio.dart';
import 'package:SilentMoon/provider/theme_changer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:SilentMoon/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(AudioAdapter());
  runApp(SilentMoonApp());
}

class SilentMoonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider<ThemeChanger>(
              create: (_) => ThemeChanger(snapshot.data),
              child: new SilentMoonAppWithTheme(),
            );
          } else {
            return Container(
              color: Colors.white,
            );
          }
        });
  }
}

class SilentMoonAppWithTheme extends StatefulWidget {
  @override
  _SilentMoonAppWithThemeState createState() => _SilentMoonAppWithThemeState();
}

class _SilentMoonAppWithThemeState extends State<SilentMoonAppWithTheme> {
  String lang = '';

  _getLang() async {
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
      theme: Provider.of<ThemeChanger>(context).getTheme(),
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

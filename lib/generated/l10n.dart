// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `home`
  String get home {
    return Intl.message(
      'English',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `sleep`
  String get sleep {
    return Intl.message(
      'English',
      name: 'sleep',
      desc: '',
      args: [],
    );
  }

  /// `meditate`
  String get meditate {
    return Intl.message(
      'English',
      name: 'meditate',
      desc: '',
      args: [],
    );
  }

  /// `music`
  String get music {
    return Intl.message(
      'English',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'English',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  /// `Welcome`
  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'English',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get goodAfternoon {
    return Intl.message(
      'English',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'English',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `We Wish you have a good day`
  String get weWishDay {
    return Intl.message(
      'English',
      name: 'weWishDay',
      desc: '',
      args: [],
    );
  }

  /// `We Wish you have a good night`
  String get weWishNight {
    return Intl.message(
      'English',
      name: 'weWishNight',
      desc: '',
      args: [],
    );
  }

  /// `Basics & Relaxation`
  String get basic {
    return Intl.message(
      'English',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  String get basicType {
    return Intl.message(
      'English',
      name: 'basicType',
      desc: '',
      args: [],
    );
  }

  String get basicTime {
    return Intl.message(
      'English',
      name: 'basicTime',
      desc: '',
      args: [],
    );
  }

  String get relaxation {
    return Intl.message(
      'English',
      name: 'relaxation',
      desc: '',
      args: [],
    );
  }

  String get relaxationType {
    return Intl.message(
      'English',
      name: 'relaxationType',
      desc: '',
      args: [],
    );
  }

  String get relaxationTime {
    return Intl.message(
      'English',
      name: 'relaxationTime',
      desc: '',
      args: [],
    );
  }

  String get start {
    return Intl.message(
      'English',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Daily Thought`
  String get dailyThought {
    return Intl.message(
      'English',
      name: 'dailyThought',
      desc: '',
      args: [],
    );
  }

  String get meditation {
    return Intl.message(
      'English',
      name: 'meditation',
      desc: '',
      args: [],
    );
  }

  String get meditationTime {
    return Intl.message(
      'English',
      name: 'meditationTime',
      desc: '',
      args: [],
    );
  }

  /// `Recomended List`

  String get recomended {
    return Intl.message(
      'English',
      name: 'recomended',
      desc: '',
      args: [],
    );
  }

  String get nature {
    return Intl.message(
      'English',
      name: 'nature',
      desc: '',
      args: [],
    );
  }

  String get natureTime {
    return Intl.message(
      'English',
      name: 'natureTime',
      desc: '',
      args: [],
    );
  }

  String get natureType {
    return Intl.message(
      'English',
      name: 'natureType',
      desc: '',
      args: [],
    );
  }

  String get focus {
    return Intl.message(
      'English',
      name: 'focus',
      desc: '',
      args: [],
    );
  }

  String get focusType {
    return Intl.message(
      'English',
      name: 'focusType',
      desc: '',
      args: [],
    );
  }

  String get focusTime {
    return Intl.message(
      'English',
      name: 'focusTime',
      desc: '',
      args: [],
    );
  }

  String get happiness {
    return Intl.message(
      'English',
      name: 'happiness',
      desc: '',
      args: [],
    );
  }

  String get happinessType {
    return Intl.message(
      'English',
      name: 'happinessType',
      desc: '',
      args: [],
    );
  }

  String get happinessTime {
    return Intl.message(
      'English',
      name: 'happinessTime',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}

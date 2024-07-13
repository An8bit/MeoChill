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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Demo`
  String get title {
    return Intl.message(
      'Flutter Demo',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to MeoChill`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to MeoChill',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Click Me`
  String get buttonText {
    return Intl.message(
      'Click Me',
      name: 'buttonText',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorMessage {
    return Intl.message(
      'An error occurred',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get pageHome {
    return Intl.message(
      'Home',
      name: 'pageHome',
      desc: '',
      args: [],
    );
  }

  /// `Popular Movies`
  String get titleHomeList {
    return Intl.message(
      'Popular Movies',
      name: 'titleHomeList',
      desc: '',
      args: [],
    );
  }

  /// `Recommand Movies`
  String get titleHomeListbottom {
    return Intl.message(
      'Recommand Movies',
      name: 'titleHomeListbottom',
      desc: '',
      args: [],
    );
  }

  /// `Top Search`
  String get titleSearchList {
    return Intl.message(
      'Top Search',
      name: 'titleSearchList',
      desc: '',
      args: [],
    );
  }

  /// `Movie World`
  String get titleCategoryList {
    return Intl.message(
      'Movie World',
      name: 'titleCategoryList',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get titleFlim1 {
    return Intl.message(
      'Action',
      name: 'titleFlim1',
      desc: '',
      args: [],
    );
  }

  /// `Adventure`
  String get titleFlim2 {
    return Intl.message(
      'Adventure',
      name: 'titleFlim2',
      desc: '',
      args: [],
    );
  }

  /// `Comedy`
  String get titleFlim3 {
    return Intl.message(
      'Comedy',
      name: 'titleFlim3',
      desc: '',
      args: [],
    );
  }

  /// `Romantic`
  String get tiltleFlim4 {
    return Intl.message(
      'Romantic',
      name: 'tiltleFlim4',
      desc: '',
      args: [],
    );
  }

  /// `Psychological`
  String get titleFlim5 {
    return Intl.message(
      'Psychological',
      name: 'titleFlim5',
      desc: '',
      args: [],
    );
  }

  /// `Criminal`
  String get titleFlim6 {
    return Intl.message(
      'Criminal',
      name: 'titleFlim6',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get titleFlim7 {
    return Intl.message(
      'Sport',
      name: 'titleFlim7',
      desc: '',
      args: [],
    );
  }

  /// `Mystery`
  String get titleFlim8 {
    return Intl.message(
      'Mystery',
      name: 'titleFlim8',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Movies`
  String get titleFarvoriteList {
    return Intl.message(
      'My Favorite Movies',
      name: 'titleFarvoriteList',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfileButton {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get InformationButton {
    return Intl.message(
      'Account Information',
      name: 'InformationButton',
      desc: '',
      args: [],
    );
  }

  /// `Affiliate Account`
  String get AffiliateAccountButton {
    return Intl.message(
      'Affiliate Account',
      name: 'AffiliateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `Device Managerment`
  String get ManagermentButton {
    return Intl.message(
      'Device Managerment',
      name: 'ManagermentButton',
      desc: '',
      args: [],
    );
  }

  /// `My Favorite Movies`
  String get MyFarvoriteButton {
    return Intl.message(
      'My Favorite Movies',
      name: 'MyFarvoriteButton',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get LanguageButton {
    return Intl.message(
      'Language',
      name: 'LanguageButton',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LogOutButton {
    return Intl.message(
      'Log Out',
      name: 'LogOutButton',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LogInButton {
    return Intl.message(
      'Log In',
      name: 'LogInButton',
      desc: '',
      args: [],
    );
  }

  /// `Light/Dark Mode`
  String get RegimeButton {
    return Intl.message(
      'Light/Dark Mode',
      name: 'RegimeButton',
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
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

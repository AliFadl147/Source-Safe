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

  /// `Access and reserve your team's files seamlessly and securely`
  String get accessAndReserveYourTeamsFilesSeamlesslyAndSecurely {
    return Intl.message(
      'Access and reserve your team\'s files seamlessly and securely',
      name: 'accessAndReserveYourTeamsFilesSeamlesslyAndSecurely',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `your email is empty or not valid`
  String get emailError {
    return Intl.message(
      'your email is empty or not valid',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `your password must not be empty or less than 6 characters or there are no lowercase and uppercase letters or symbols`
  String get passwordError {
    return Intl.message(
      'your password must not be empty or less than 6 characters or there are no lowercase and uppercase letters or symbols',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `create an account`
  String get createAnAccount {
    return Intl.message(
      'create an account',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Get Started with Us – Create Your Account Today!`
  String get createYourAccountToday {
    return Intl.message(
      'Get Started with Us – Create Your Account Today!',
      name: 'createYourAccountToday',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `FirstName must not be empty or Less than 3 characters`
  String get firstNameError {
    return Intl.message(
      'FirstName must not be empty or Less than 3 characters',
      name: 'firstNameError',
      desc: '',
      args: [],
    );
  }

  /// `LastName must not be empty or Less than 3 characters`
  String get lastNameError {
    return Intl.message(
      'LastName must not be empty or Less than 3 characters',
      name: 'lastNameError',
      desc: '',
      args: [],
    );
  }

  /// `Address must not be empty or Less than 5 characters`
  String get addressError {
    return Intl.message(
      'Address must not be empty or Less than 5 characters',
      name: 'addressError',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number must not be empty or Less than 10`
  String get phoneNumberError {
    return Intl.message(
      'Phone Number must not be empty or Less than 10',
      name: 'phoneNumberError',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `already have an account!`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'already have an account!',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Language change`
  String get languageChange {
    return Intl.message(
      'Language change',
      name: 'languageChange',
      desc: '',
      args: [],
    );
  }

  /// `Switch Language`
  String get switchLanguage {
    return Intl.message(
      'Switch Language',
      name: 'switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Lighting mode      `
  String get lightingMode {
    return Intl.message(
      'Lighting mode      ',
      name: 'lightingMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch Theme`
  String get switchTheme {
    return Intl.message(
      'Switch Theme',
      name: 'switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `Logout account`
  String get logoutAccount {
    return Intl.message(
      'Logout account',
      name: 'logoutAccount',
      desc: '',
      args: [],
    );
  }

  /// `Access and reserve your team's files seamlessly and securely.`
  String get accessAndReserveYourTeamsFiles {
    return Intl.message(
      'Access and reserve your team\'s files seamlessly and securely.',
      name: 'accessAndReserveYourTeamsFiles',
      desc: '',
      args: [],
    );
  }

  /// `Create a group`
  String get createAGroup {
    return Intl.message(
      'Create a group',
      name: 'createAGroup',
      desc: '',
      args: [],
    );
  }

  /// `Add file`
  String get addFile {
    return Intl.message(
      'Add file',
      name: 'addFile',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Group name`
  String get groupName {
    return Intl.message(
      'Group name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `GroupName must not be empty or Less than 3 characters`
  String get groupNameError {
    return Intl.message(
      'GroupName must not be empty or Less than 3 characters',
      name: 'groupNameError',
      desc: '',
      args: [],
    );
  }

  /// `File name`
  String get fileName {
    return Intl.message(
      'File name',
      name: 'fileName',
      desc: '',
      args: [],
    );
  }

  /// `FileName must not be empty or Less than 3 characters`
  String get fileNameError {
    return Intl.message(
      'FileName must not be empty or Less than 3 characters',
      name: 'fileNameError',
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
      Locale.fromSubtags(languageCode: 'ar'),
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_safe_project/core/utils/app_mode.dart';
import 'package:source_safe_project/core/utils/language_manager.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyMode = "PREFS_KEY_MODE";
const String prefsKeyOnboardingScreenViewed =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

const String tOKEN = "TOKEN";

const String dEVICEToken = "DEVICETOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.getValue();
    }
  }

  Future<void> changeAppLanguage(String languageCode) async {
    _sharedPreferences.setString(prefsKeyLang, languageCode);
  }

  static Future<bool> getAppMode() async {
    SharedPreferences shared = getIt.get<SharedPreferences>();
    bool? mode = shared.getBool(prefsKeyMode);
    if (mode != null) {
      return mode;
    } else {
      // return default lang
      return ModeType.light.getValue();
    }
  }

  Future<void> changeAppMode() async {
    bool currentMode = await getAppMode();

    if (currentMode == ModeType.dark.getValue()) {
      // set light
      _sharedPreferences.setBool(prefsKeyMode, ModeType.light.getValue());
    } else {
      // set dark
      _sharedPreferences.setBool(prefsKeyMode, ModeType.dark.getValue());
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingScreenViewed, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreenViewed) ?? false;
  }

  //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(tOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences shared = getIt.get<SharedPreferences>();
    print("tooooooooooooken: ${shared.getString(tOKEN)}");
    return shared.getString(tOKEN) ?? '';
  }

  // Future<void> setDeviceToken(String deviceToken) async {
  //   _sharedPreferences.setString(dEVICEToken, deviceToken);
  // }

  // Future<String> getDeviceToken() async {
  //   return _sharedPreferences.getString(dEVICEToken) ?? '';
  // }

  Future<void> logout() async {
    // _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
    // _sharedPreferences.remove(TOKEN);
    _sharedPreferences.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyOnboardingScreenViewed =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

const String tOKEN = "TOKEN";

const String dEVICEToken = "DEVICETOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  // Future<String> getAppLanguage() async {
  //   String? language = _sharedPreferences.getString(prefsKeyLang);
  //   if (language != null && language.isNotEmpty) {
  //     return language;
  //   } else {
  //     // return default lang
  //     return LanguageType.ENGLISH.getValue();
  //   }
  // }

  // Future<void> changeAppLanguage() async {
  //   String currentLang = await getAppLanguage();

  //   if (currentLang == LanguageType.ARABIC.getValue()) {
  //     // set english
  //     _sharedPreferences.setString(
  //         prefsKeyLang, LanguageType.ENGLISH.getValue());
  //   } else {
  //     // set arabic
  //     _sharedPreferences.setString(
  //         prefsKeyLang, LanguageType.ARABIC.getValue());
  //   }
  // }

  // Future<Locale> getLocal() async {
  //   String currentLang = await getAppLanguage();

  //   if (currentLang == LanguageType.ARABIC.getValue()) {
  //     return arabicLocale;
  //   } else {
  //     return englishLocale;
  //   }
  // }

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

  Future<String> getToken() async {
    return _sharedPreferences.getString(tOKEN) ?? '';
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

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static const _accessTokenKey = 'token';
  static const _fcmToken = 'fcmToken';

  static Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);

    log('token saved $token');
  }

static Future<void> saveLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', languageCode);
    log('language code saved $languageCode');
  }
  static Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('lang') ?? 'ar';
    log('language code get $languageCode');
    return languageCode;
  }
  // ignore: non_constant_identifier_names
  static Future<void> saveFcmToken(String Fcmtoken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcmToken, Fcmtoken);
    log('fcm token saved $Fcmtoken');
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(_accessTokenKey) ?? '';
    log('token get $token');
    return token;
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_accessTokenKey);
  }

  static Future<String?> getFcmToken() async {
    final prefs = await SharedPreferences.getInstance();
    String fcmToken = prefs.getString(_fcmToken) ?? '';
    log('fcm token get $fcmToken');
    return fcmToken;
  }

  static Future<bool> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

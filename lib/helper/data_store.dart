import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStore {
  static final DataStore _dataStore = new DataStore._internal();
  Locale locale;

  factory DataStore() {
    return _dataStore;
  }

  String lang;
  String localLang = 'ar';

  DataStore._internal();

  Future<bool> setLang(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = value;
    return prefs.setString('Lang', value);
  }

  Future<void> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('Lang') ?? 'ar';
  }
}

final dataStore = DataStore();

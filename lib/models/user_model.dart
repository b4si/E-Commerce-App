import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> emailIds = {};

Future<void> saveMapToSharedPreferences(Map<String, dynamic> myMap) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(myMap);
  prefs.setString('myMap', jsonString);
}

Future<Map<String, dynamic>> getMapFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('myMap');
  if (jsonString == null) {
    return {};
  } else {
    return jsonDecode(jsonString);
  }
}

gettingMap() async {
  emailIds = await getMapFromSharedPreferences();
}

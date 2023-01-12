import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// class EmailId {
//   String email;
//   String id;
//   String name;

//   EmailId({
//     required this.email,
//     required this.id,
//     required this.name,
//   });
// }

Map<String, dynamic> emailIds = {};

// void addPreferredShare(String email, String id, String name) {
//   emailIds.add(EmailId(
//     email: email,
//     id: id,
//     name: name,
//   ));
// }

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

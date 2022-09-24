import 'dart:convert';

import 'package:eaterian_menu/model/menu4.dart';
import 'package:eaterian_menu/model/menu_model.dart';
import 'package:eaterian_menu/model/model2.dart';
import 'package:eaterian_menu/model/model3.dart';
import 'package:http/http.dart' as http;

Future<Menu4> getMenus() async {
  String api = 'https://myqa.fleksa.com/pyapi/5/menu';
  final response = await http.get(Uri.parse(api));
  if (response.statusCode == 200) {
    return Menu4.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

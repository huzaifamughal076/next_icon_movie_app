import 'dart:convert';
import 'package:get/get.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';
import 'package:nexticon_task/Models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _keySharedPref = 'My Movie App SharedPref';

  // Load the list of Result from shared preferences
  static Future<List<Result>> loadListFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? movieList = prefs.getStringList(_keySharedPref);
  if (movieList == null) {
    return [];
  }
  List<Result> list = movieList.map((cartMoel) => Result.fromJson(json.decode(cartMoel))).toList();
  Get.find<MovieController>().setFavoriteList(list);
  return list;
  }

  // Save the list of Result to shared preferences
  static Future<void> saveListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = Get.find<MovieController>().favoriteMovesList.map((model) =>  json.encode(model.toJson())).toList();
    await prefs.setStringList(_keySharedPref, list);
  }
}

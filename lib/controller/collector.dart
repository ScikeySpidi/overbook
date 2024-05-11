// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:overbook/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get_storage/get_storage.dart';

// ignore: non_constant_identifier_names

class DataController extends GetxController {
  // List<PostsModel> filteredPaper=[];
  // final box = GetStorage();
// ignore: non_constant_identifier_names

  // Box<PostsModel> box = Hive.box('data');

  RxList favoritePaper = [].obs;
  // late PostsModel  recentPaper;
  List<PostsModel> recentPaper = [];

  List<PostsModel> dataList = [];
  List<PostsModel> filteredPaper = [];
  List<PostsModel> box = [];

  addRecentPaper(PostsModel value) {
    recentPaper.add(value);
  }

  addToFavorite(PostsModel value) {
    favoritePaper.add(value);
  }

  removeFromFavorite(PostsModel value) {
    favoritePaper.remove(value);
  }

  filter(int value, String type) {
    filteredPaper.clear();
    // debugPrint("value is...$value");
    // debugPrint("value is...${dataList.length}");

    for (var e = 0; e < dataList.length; e++) {
      // debugPrint("out");
      if (dataList[e].date.years.toInt() == value &&
          dataList[e].paperType.toString().toLowerCase() == type.toString()) {
        filteredPaper.add(dataList[e]);
      }
      // debugPrint('$e');
      // debugPrint(filteredPaper[e].title.toString());
    }
  }

  Future<void> setData(value) async {
    final PostsModel user = PostsModel(
        id: value.id,
        title: value.title,
        date: value.date,
        paperUrl: value.paperUrl,
        paperType: value.paperType,
        description: value.description);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user', jsonEncode(user));
    print(result);
  }

  Future<PostsModel> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap = {};
    final String? userStr = prefs.getString('user');
    if (userStr != null) {
      userMap = await jsonDecode(userStr) as Map<String, dynamic>;
    }

    final PostsModel user = PostsModel.fromJson(userMap);
    print(user);

    favoritePaper.add(user);

    debugPrint('>>>>>>>favoritePaper>>>${favoritePaper.toString()}');
    return user;
  }

  Future<void> remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    favoritePaper.clear();
  }

  Future<void> removeRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('recent');
    print("Removeing____>");
    // recentPaper.clear();
  }

  Future<void> setRecent(value) async {
    final PostsModel user = PostsModel(
        id: value.id,
        title: value.title,
        date: value.date,
        paperUrl: value.paperUrl,
        paperType: value.paperType,
        description: value.description);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('recent', jsonEncode(user));
    print(result);
  }

  Future<PostsModel> getRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap = {};
    final String? userStr = prefs.getString('recent');
    if (userStr != null) {
      userMap = await jsonDecode(userStr) as Map<String, dynamic>;
    }

    final PostsModel user = PostsModel.fromJson(userMap);
    recentPaper.clear();
    recentPaper.add(user);

    debugPrint('>>>>>>>recentPaper>>>${recentPaper.toString()}');
    return user;
  }
}

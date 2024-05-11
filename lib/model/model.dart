// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

// part 'model.g.dart';

List<PostsModel> postsModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// @HiveType(typeId: 1)
class PostsModel {
  // @HiveField(0)

  String id;
  // @HiveField(1)

  String title;
  // @HiveField(2)

  Date date;
  // @HiveField(3)

  String paperUrl;
  // @HiveField(4)

  String paperType;
  // @HiveField(5)

  String description;

  PostsModel({
    required this.id,
    required this.title,
    required this.date,
    required this.paperUrl,
    required this.paperType,
    required this.description,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json["_id"],
        title: json["Title"],
        date: Date.fromJson(json["Date"]),
        paperUrl: json["PaperUrl"],
        paperType: json["PaperType"],
        description: json["Description"],
      );

  get value => null;

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Title": title,
        "Date": date.toJson(),
        "PaperUrl": paperUrl,
        "PaperType": paperType,
        "Description": description,
      };

  void add(PostsModel filteredPaper) {}
}

class Date {
  // @HiveField(0)

  int years;
  // @HiveField(1)

  String month;
  // @HiveField(2)

  int date;

  Date({
    required this.years,
    required this.month,
    required this.date,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        years: json["years"],
        month: json["month"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "years": years,
        "month": month,
        "date": date,
      };
}

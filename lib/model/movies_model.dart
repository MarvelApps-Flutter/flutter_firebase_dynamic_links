// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

List<MoviesModel> moviesModelFromJson(String str) => List<MoviesModel>.from(json.decode(str).map((x) => MoviesModel.fromJson(x)));

String moviesModelToJson(List<MoviesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesModel {
  MoviesModel({
    this.title,
    this.type,
    this.year,
    this.runtime,
    this.poster,
    this.description
  });

  String? title;
  String? type;
  String? year;
  String? runtime;
  String? poster;
  String? description;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      title: json["Title"],
      type: json["Type"],
      year: json["Year"],
      runtime: json["Runtime"],
      poster: json["Poster"] == null ? null : json["Poster"],
      description: json["Description"]
  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Type": type,
    "Year": year,
    "Runtime": runtime,
    "Poster": poster == null ? null : poster,
    "Description" : description
  };
}

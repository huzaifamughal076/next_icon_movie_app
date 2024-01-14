// To parse this JSON data, do
//
//     final topRatedMovieModel = topRatedMovieModelFromJson(jsonString);

import 'dart:convert';

import 'package:nexticon_task/Models/movie_model.dart';

TopRatedMovieModel topRatedMovieModelFromJson(String str) => TopRatedMovieModel.fromJson(json.decode(str));

String topRatedMovieModelToJson(TopRatedMovieModel data) => json.encode(data.toJson());

class TopRatedMovieModel {
    int? page;
    List<Result>? results;
    int? totalPages;
    int? totalResults;

    TopRatedMovieModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) => TopRatedMovieModel(
        page: json["page"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}


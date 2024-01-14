// To parse this JSON data, do
//
//     final upcomingMovieModel = upcomingMovieModelFromJson(jsonString);

import 'dart:convert';

import 'package:nexticon_task/Models/movie_model.dart';

UpcomingMovieModel upcomingMovieModelFromJson(String str) => UpcomingMovieModel.fromJson(json.decode(str));

String upcomingMovieModelToJson(UpcomingMovieModel data) => json.encode(data.toJson());

class UpcomingMovieModel {
    Dates? dates;
    int? page;
    List<Result>? results;
    int? totalPages;
    int? totalResults;

    UpcomingMovieModel({
        this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) => UpcomingMovieModel(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime? maximum;
    DateTime? minimum;

    Dates({
        this.maximum,
        this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
    };
}


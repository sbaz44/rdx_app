// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.lastPage,
    this.requestCacheExpiry,
    this.requestCached,
    this.requestHash,
    this.results,
  });

  int? lastPage;
  int? requestCacheExpiry;
  bool? requestCached;
  String? requestHash;
  List<Result>? results;

  factory SearchModel.fromJson(Map<dynamic, dynamic> json) => SearchModel(
        lastPage: json["last_page"],
        requestCacheExpiry: json["request_cache_expiry"],
        requestCached: json["request_cached"],
        requestHash: json["request_hash"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "last_page": lastPage,
        "request_cache_expiry": requestCacheExpiry,
        "request_cached": requestCached,
        "request_hash": requestHash,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.airing,
    this.endDate,
    this.episodes,
    this.imageUrl,
    this.malId,
    this.members,
    this.rated,
    this.score,
    this.startDate,
    this.synopsis,
    required this.title,
    this.type,
  });

  bool? airing;
  String? endDate;
  int? episodes;
  String? imageUrl;
  int? malId;
  int? members;
  String? rated;
  double? score;
  String? startDate;
  String? synopsis;
  String title;
  String? type;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        airing: json["airing"],
        endDate: json["end_date"],
        episodes: json["episodes"],
        imageUrl: json["image_url"],
        malId: json["mal_id"],
        members: json["members"],
        rated: json["rated"],
        score: json["score"].toDouble(),
        startDate: json["start_date"],
        synopsis: json["synopsis"],
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "airing": airing,
        "end_date": endDate,
        "episodes": episodes,
        "image_url": imageUrl,
        "mal_id": malId,
        "members": members,
        "rated": rated,
        "score": score,
        "start_date": startDate,
        "synopsis": synopsis,
        "title": title,
        "type": type,
      };
}

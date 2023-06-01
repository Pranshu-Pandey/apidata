// To parse this JSON data, do
//
//     final random = randomFromJson(jsonString);

import 'dart:convert';

class Random {
  List<Result>? result;
  QueryParam? queryParam;
  int? code;
  String? message;

  Random({
    this.result,
    this.queryParam,
    this.code,
    this.message,
  });

  factory Random.fromRawJson(String str) => Random.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Random.fromJson(Map<String, dynamic> json) => Random(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        queryParam: json["queryParam"] == null
            ? null
            : QueryParam.fromJson(json["queryParam"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "queryParam": queryParam?.toJson(),
        "code": code,
        "message": message,
      };
}

class QueryParam {
  String? category;
  String? language;
  String? genre;
  String? sort;

  QueryParam({
    this.category,
    this.language,
    this.genre,
    this.sort,
  });

  factory QueryParam.fromRawJson(String str) =>
      QueryParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QueryParam.fromJson(Map<String, dynamic> json) => QueryParam(
        category: json["category"],
        language: json["language"],
        genre: json["genre"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
      };
}

class Result {
  String? id;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  Language? language;
  int? runTime;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int? voting;

  Result({
    this.id,
    this.director,
    this.writers,
    this.stars,
    this.releasedDate,
    this.productionCompany,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.voted,
    this.poster,
    this.pageViews,
    this.description,
    this.upVoted,
    this.downVoted,
    this.totalVoted,
    this.voting,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        director: json["director"] == null
            ? []
            : List<String>.from(json["director"]!.map((x) => x)),
        writers: json["writers"] == null
            ? []
            : List<String>.from(json["writers"]!.map((x) => x)),
        stars: json["stars"] == null
            ? []
            : List<String>.from(json["stars"]!.map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany: json["productionCompany"] == null
            ? []
            : List<String>.from(json["productionCompany"]!.map((x) => x)),
        title: json["title"],
        language: languageValues.map[json["language"]]!,
        runTime: json["runTime"],
        genre: json["genre"],
        voted: json["voted"] == null
            ? []
            : List<Voted>.from(json["voted"]!.map((x) => Voted.fromJson(x))),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: json["upVoted"] == null
            ? []
            : List<String>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null
            ? []
            : List<String>.from(json["downVoted"]!.map((x) => x)),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director":
            director == null ? [] : List<dynamic>.from(director!.map((x) => x)),
        "writers":
            writers == null ? [] : List<dynamic>.from(writers!.map((x) => x)),
        "stars": stars == null ? [] : List<dynamic>.from(stars!.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany": productionCompany == null
            ? []
            : List<dynamic>.from(productionCompany!.map((x) => x)),
        "title": title,
        "language": languageValues.reverse[language],
        "runTime": runTime,
        "genre": genre,
        "voted": voted == null
            ? []
            : List<dynamic>.from(voted!.map((x) => x.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        "upVoted":
            upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null
            ? []
            : List<dynamic>.from(downVoted!.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

enum Language { KANNADA }

final languageValues = EnumValues({"Kannada": Language.KANNADA});

class Voted {
  List<String>? upVoted;
  List<dynamic>? downVoted;
  String? id;
  int? updatedAt;
  String? genre;

  Voted({
    this.upVoted,
    this.downVoted,
    this.id,
    this.updatedAt,
    this.genre,
  });

  factory Voted.fromRawJson(String str) => Voted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: json["upVoted"] == null
            ? []
            : List<String>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null
            ? []
            : List<dynamic>.from(json["downVoted"]!.map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "upVoted":
            upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null
            ? []
            : List<dynamic>.from(downVoted!.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

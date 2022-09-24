// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu2 menuFromJson(String str) => Menu2.fromJson(json.decode(str));

String menuToJson(Menu2 data) => json.encode(data.toJson());

class Menu2 {
  Menu2({
    required this.categories,
  });

  List<Category> categories;

  factory Menu2.fromJson(Map<String, dynamic> json) => Menu2(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.descriptionJson,
    required this.id,
    required this.inStock,
    required this.nameJson,
  });

  Json descriptionJson;
  int id;

  bool inStock;
  Json nameJson;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        descriptionJson: Json.fromJson(json["description_json"]),
        id: json["id"],
        inStock: json["in_stock"],
        nameJson: Json.fromJson(json["name_json"]),
      );

  Map<String, dynamic> toJson() => {
        "description_json": descriptionJson.toJson(),
        "id": id,
        "in_stock": inStock,
      };
}

class Json {
  Json({
    required this.english,
    required this.german,
  });

  String english;
  String german;

  factory Json.fromJson(Map<String, dynamic> json) => Json(
        english: json["english"],
        german: json["german"],
      );

  Map<String, dynamic> toJson() => {
        "english": english,
        "german": german,
      };
}

class Categories {
  Categories({
    required this.forAll,
    required this.ids,
  });

  bool forAll;
  List<dynamic> ids;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        forAll: json["for_all"],
        ids: List<dynamic>.from(json["ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "for_all": forAll,
        "ids": List<dynamic>.from(ids.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map, this.reverseMap);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

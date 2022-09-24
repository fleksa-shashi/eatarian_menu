// To parse this JSON data, do
//
//     final menu4 = menu4FromJson(jsonString);

import 'dart:convert';

Menu4 menu4FromJson(String str) => Menu4.fromJson(json.decode(str));

String menu4ToJson(Menu4 data) => json.encode(data.toJson());

class Menu4 {
  Menu4({
    this.autoDiscount,
    this.categories,
    this.offers,
    this.parts,
    this.result,
    this.sides,
  });

  dynamic autoDiscount;
  List<Category>? categories;
  List<dynamic>? offers;
  Parts? parts;
  bool? result;
  Sides? sides;

  factory Menu4.fromJson(Map<String, dynamic> json) => Menu4(
        autoDiscount: json["auto_discount"],
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        offers: json["offers"] == null
            ? null
            : List<dynamic>.from(json["offers"].map((x) => x)),
        parts: json["parts"] == null ? null : Parts.fromJson(json["parts"]),
        result: json["result"] == null ? null : json["result"],
        sides: json["sides"] == null ? null : Sides.fromJson(json["sides"]),
      );

  Map<String, dynamic> toJson() => {
        "auto_discount": autoDiscount,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "offers":
            offers == null ? null : List<dynamic>.from(offers!.map((x) => x)),
        "parts": parts == null ? null : parts!.toJson(),
        "result": result == null ? null : result,
        "sides": sides == null ? null : sides!.toJson(),
      };
}

class Category {
  Category({
    this.availability,
    this.descriptionJson,
    this.id,
    this.image,
    this.inStock,
    this.nameJson,
    this.products,
  });

  Availability? availability;
  Json? descriptionJson;
  int? id;
  dynamic image;
  bool? inStock;
  Json? nameJson;
  List<Product>? products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        availability: json["availability"] == null
            ? null
            : Availability.fromJson(json["availability"]),
        descriptionJson: json["description_json"] == null
            ? null
            : Json.fromJson(json["description_json"]),
        id: json["id"] == null ? null : json["id"],
        image: json["image"],
        inStock: json["in_stock"] == null ? null : json["in_stock"],
        nameJson:
            json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "availability": availability == null ? null : availability!.toJson(),
        "description_json":
            descriptionJson == null ? null : descriptionJson!.toJson(),
        "id": id == null ? null : id,
        "image": image,
        "in_stock": inStock == null ? null : inStock,
        "name_json": nameJson == null ? null : nameJson!.toJson(),
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Availability {
  Availability({
    this.always,
    this.end,
    this.start,
  });

  bool? always;
  String? end;
  String? start;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        always: json["always"] == null ? null : json["always"],
        end: json["end"] == null ? null : json["end"],
        start: json["start"] == null ? null : json["start"],
      );

  Map<String, dynamic> toJson() => {
        "always": always == null ? null : always,
        "end": end == null ? null : end,
        "start": start == null ? null : start,
      };
}

class Json {
  Json({
    this.english,
    this.german,
  });

  String? english;
  String? german;

  factory Json.fromJson(Map<String, dynamic> json) => Json(
        english: json["english"] == null ? null : json["english"],
        german: json["german"] == null ? null : json["german"],
      );

  Map<String, dynamic> toJson() => {
        "english": english == null ? null : english,
        "german": german == null ? null : german,
      };
}

class Product {
  Product({
    this.choice,
    this.descriptionJson,
    this.id,
    this.image,
    this.inStock,
    this.isPopular,
    this.nameJson,
    this.oldPrice,
    this.price,
    this.sideProductsJson,
    this.sku,
    this.type,
  });

  dynamic choice;
  Json? descriptionJson;
  int? id;
  String? image;
  bool? inStock;
  bool? isPopular;
  Json? nameJson;
  dynamic oldPrice;
  double? price;
  List<SideProductsJson>? sideProductsJson;
  String? sku;
  Type? type;
  int counter = 1;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        choice: json["choice"],
        descriptionJson: json["description_json"] == null
            ? null
            : Json.fromJson(json["description_json"]),
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        inStock: json["in_stock"] == null ? null : json["in_stock"],
        isPopular: json["is_popular"] == null ? null : json["is_popular"],
        nameJson:
            json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
        oldPrice: json["old_price"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        sideProductsJson: json["side_products_json"] == null
            ? null
            : List<SideProductsJson>.from(json["side_products_json"]
                .map((x) => SideProductsJson.fromJson(x))),
        sku: json["sku"] == null ? null : json["sku"],
        type: json["type_"] == null ? null : typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toJson() => {
        "choice": choice,
        "description_json":
            descriptionJson == null ? null : descriptionJson!.toJson(),
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "in_stock": inStock == null ? null : inStock,
        "is_popular": isPopular == null ? null : isPopular,
        "name_json": nameJson == null ? null : nameJson!.toJson(),
        "old_price": oldPrice,
        "price": price == null ? null : price,
        "side_products_json": sideProductsJson == null
            ? null
            : List<dynamic>.from(sideProductsJson!.map((x) => x.toJson())),
        "sku": sku == null ? null : sku,
        "type_": type == null ? null : typeValues.reverse[type],
      };
}

enum Type { SINGLE, MULTIPLE }

final typeValues =
    EnumValues({"MULTIPLE": Type.MULTIPLE, "SINGLE": Type.SINGLE});

class SideProductsJson {
  SideProductsJson({
    this.hasProducts,
    this.nameJson,
    this.optionIds,
    this.type,
  });

  bool? hasProducts;
  Json? nameJson;
  List<int>? optionIds;
  Type? type;

  factory SideProductsJson.fromJson(Map<String, dynamic> json) =>
      SideProductsJson(
        hasProducts: json["has_products"] == null ? null : json["has_products"],
        nameJson:
            json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
        optionIds: json["option_ids"] == null
            ? null
            : List<int>.from(json["option_ids"].map((x) => x)),
        type: json["type_"] == null ? null : typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toJson() => {
        "has_products": hasProducts == null ? null : hasProducts,
        "name_json": nameJson == null ? null : nameJson?.toJson(),
        "option_ids": optionIds == null
            ? null
            : List<dynamic>.from(optionIds!.map((x) => x)),
        "type_": type == null ? null : typeValues.reverse[type],
      };
}

class Parts {
  Parts();

  factory Parts.fromJson(Map<String, dynamic> json) => Parts();

  Map<String, dynamic> toJson() => {};
}

class Sides {
  Sides({
    this.the18446,
  });

  The18446? the18446;

  factory Sides.fromJson(Map<String, dynamic> json) => Sides(
        the18446:
            json["18446"] == null ? null : The18446.fromJson(json["18446"]),
      );

  Map<String, dynamic> toJson() => {
        "18446": the18446 == null ? null : the18446!.toJson(),
      };
}

class The18446 {
  The18446({
    this.id,
    this.inStock,
    this.nameJson,
    this.oldPrice,
    // this.price,
    this.sku,
  });

  int? id;
  bool? inStock;
  Json? nameJson;
  dynamic oldPrice;
  // int? price;
  String? sku;

  factory The18446.fromJson(Map<String, dynamic> json) => The18446(
        id: json["id"] == null ? null : json["id"],
        inStock: json["in_stock"] == null ? null : json["in_stock"],
        nameJson:
            json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
        oldPrice: json["old_price"],
        // price: json["price"] == null ? null : json["price"],
        sku: json["sku"] == null ? null : json["sku"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "in_stock": inStock == null ? null : inStock,
        "name_json": nameJson == null ? null : nameJson!.toJson(),
        "old_price": oldPrice,
        // "price": price == null ? null : price,
        "sku": sku == null ? null : sku,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

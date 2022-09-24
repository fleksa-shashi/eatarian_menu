// To parse this JSON data, do
//
//     final menu3 = menu3FromJson(jsonString);

import 'dart:convert';

Menu3 menu3FromJson(String str) => Menu3.fromJson(json.decode(str));

String menu3ToJson(Menu3 data) => json.encode(data.toJson());

class Menu3 {
  Menu3({
    this.categories,
    this.parts,
  });

  List<Category>? categories;

  Map<String, Part>? parts;

  factory Menu3.fromJson(Map<String, dynamic> json) => Menu3(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        parts: Map.from(json["parts"])
            .map((k, v) => MapEntry<String, Part>(k, Part.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "parts": Map.from(parts!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Category {
  Category({
    this.availability,
    this.descriptionJson,
    // this.id,
    this.image,
    this.inStock,
    this.nameJson,
    required this.products,
  });

  Availability? availability;
  Json? descriptionJson;
  // int? id;
  String? image;
  bool? inStock;
  Json? nameJson;
  List<Part> products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        availability: Availability.fromJson(json["availability"]),
        descriptionJson: json["description_json"] == null
            ? null
            : Json.fromJson(json["description_json"]),
        // id: json["id"],
        image: json["image"] ?? '',
        inStock: json["in_stock"],
        nameJson: Json.fromJson(json["name_json"]),
        products:
            List<Part>.from(json["products"].map((x) => Part.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "availability": availability?.toJson(),
        "description_json":
            descriptionJson == null ? null : descriptionJson!.toJson(),
        // "id": id,
        "image": image ?? '',
        "in_stock": inStock,
        "name_json": nameJson!.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Availability {
  Availability({
    this.always,
    this.end,
    this.start,
    this.time,
    this.orderType,
    // this.days,
  });

  bool? always;
  List<String>? end;
  List<String>? start;
  Time? time;
  List<String>? orderType;
  // List<int>? days;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        always: json["always"],
        end: json["end"] == null
            ? null
            : List<String>.from(json["end"].map((x) => x)),
        start: json["start"] == null
            ? null
            : List<String>.from(json["start"].map((x) => x)),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        orderType: json["order_type_"] == null
            ? null
            : List<String>.from(json["order_type_"].map((x) => x)),
        // days: json["days"] == null
        //     ? null
        //     : List<int>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "always": always,
        "end": end == null ? null : List<dynamic>.from(end!.map((x) => x)),
        "start":
            start == null ? null : List<dynamic>.from(start!.map((x) => x)),
        "time": time == null ? null : time!.toJson(),
        "order_type_": orderType == null
            ? null
            : List<dynamic>.from(orderType!.map((x) => x)),
        // "days": days == null ? null : List<dynamic>.from(days!.map((x) => x)),
      };
}

class Time {
  Time({
    this.end,
    this.start,
  });

  String? end;
  String? start;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        end: json["end"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "end": end,
        "start": start,
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
        english: json["english"],
        german: json["german"],
      );

  Map<String, dynamic> toJson() => {
        "english": english,
        "german": german,
      };
}

class Part {
  Part({
    this.choice,
    this.descriptionJson,
    // this.id,
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

  List<Choice>? choice;
  Json? descriptionJson;
  // int? id;
  String? image;
  bool? inStock;
  bool? isPopular;
  Json? nameJson;
  dynamic oldPrice;
  double? price;
  List<SideProductsJson>? sideProductsJson;
  String? sku;
  Type? type;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        choice: json["choice"] == null
            ? null
            : List<Choice>.from(json["choice"].map((x) => Choice.fromJson(x))),
        descriptionJson: Json.fromJson(json["description_json"]),
        // id: json["id"],
        image: json["image"] ?? '',
        inStock: json["in_stock"],
        isPopular: json["is_popular"] ?? '',
        nameJson: Json.fromJson(json["name_json"]),
        oldPrice: json["old_price"],
        price: json["price"].toDouble(),
        sideProductsJson: json["side_products_json"] == null
            ? null
            : List<SideProductsJson>.from(json["side_products_json"]
                .map((x) => SideProductsJson.fromJson(x))),
        sku: json["sku"] ?? '',
        type: json["type_"] == null ? null : typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toJson() => {
        "choice": choice == null
            ? null
            : List<dynamic>.from(choice!.map((x) => x.toJson())),
        "description_json": descriptionJson?.toJson(),
        // "id": id,
        "image": image ?? '',
        "in_stock": inStock,
        "is_popular": isPopular ?? '',
        "name_json": nameJson?.toJson(),
        "old_price": oldPrice,
        "price": price,
        "side_products_json": sideProductsJson == null
            ? null
            : List<dynamic>.from(sideProductsJson!.map((x) => x.toJson())),
        "sku": sku ?? '',
        "type_": type == null ? null : typeValues.reverse[type],
      };
}

class Choice {
  Choice({
    this.hasProducts,
    this.nameJson,
    this.options,
    this.type,
    // this.choice,
  });

  bool? hasProducts;
  Json? nameJson;
  List<Option>? options;
  Type? type;
  // List<int>? choice;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        hasProducts: json["has_products"],
        nameJson: Json.fromJson(json["name_json"]),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        type: typeValues.map[json["type_"]],
        // choice: json["choice"] == null
        //     ? null
        //     : List<int>.from(json["choice"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "has_products": hasProducts,
        "name_json": nameJson?.toJson(),
        // "options": options == null
        //     ? null
        //     : List<dynamic>.from(options?.map((x) => x.toJson())),
        "type_": typeValues.reverse[type],
        // "choice":
        //     choice == null ? null : List<dynamic>.from(choice!.map((x) => x)),
      };
}

class Option {
  Option({
    this.nameJson,
    // this.price,
  });

  Json? nameJson;
  // int? price;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        nameJson: Json.fromJson(json["name_json"]),
        // price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name_json": nameJson?.toJson(),
        // "price": price,
      };
}

enum Type { SINGLE, MULTIPLE }

final typeValues =
    EnumValues({"MULTIPLE": Type.MULTIPLE, "SINGLE": Type.SINGLE});

class SideProductsJson {
  SideProductsJson({
    this.nameJson,
    // this.optionIds,
    this.type,
  });

  Json? nameJson;
  // List<int>? optionIds;
  Type? type;

  factory SideProductsJson.fromJson(Map<String, dynamic> json) =>
      SideProductsJson(
        nameJson: Json.fromJson(json["name_json"]),
        // optionIds: List<int>.from(json["option_ids"].map((x) => x)),
        type: typeValues.map[json["type_"]],
      );

  Map<String, dynamic> toJson() => {
        "name_json": nameJson?.toJson(),
        // "option_ids": List<dynamic>.from(optionIds!.map((x) => x)),
        "type_": typeValues.reverse[type],
      };
}

class Offer {
  Offer({
    this.categories,
    this.code,
    this.descriptionJson,
    this.endDate,
    // this.minAmount,
    this.offerType,
    this.orderType,
    this.period,
    // this.provided,
    this.startDate,
  });

  Categories? categories;
  String? code;
  Json? descriptionJson;
  dynamic endDate;
  // int? minAmount;
  String? offerType;
  String? orderType;
  String? period;
  // int? provided;
  dynamic startDate;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        categories: Categories.fromJson(json["categories"]),
        code: json["code"],
        descriptionJson: Json.fromJson(json["description_json"]),
        endDate: json["end_date"],
        // minAmount: json["min_amount"],
        offerType: json["offer_type_"],
        orderType: json["order_type_"],
        period: json["period"],
        // provided: json["provided"],
        startDate: json["start_date"],
      );

  Map<String, dynamic> toJson() => {
        "categories": categories!.toJson(),
        "code": code,
        "description_json": descriptionJson?.toJson(),
        "end_date": endDate,
        // "min_amount": minAmount,
        "offer_type_": offerType,
        "order_type_": orderType,
        "period": period,
        // "provided": provided,
        "start_date": startDate,
      };
}

class Categories {
  Categories({
    this.forAll,
    this.ids,
  });

  bool? forAll;
  List<dynamic>? ids;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        forAll: json["for_all"],
        ids: List<dynamic>.from(json["ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "for_all": forAll,
        "ids": List<dynamic>.from(ids!.map((x) => x)),
      };
}

class Side {
  Side({
    // this.id,
    this.inStock,
    this.nameJson,
    this.oldPrice,
    this.price,
    this.sku,
  });

  // int? id;
  bool? inStock;
  Json? nameJson;
  dynamic oldPrice;
  double? price;
  String? sku;

  factory Side.fromJson(Map<String, dynamic> json) => Side(
        // id: json["id"],
        inStock: json["in_stock"],
        nameJson: Json.fromJson(json["name_json"]),
        oldPrice: json["old_price"],
        price: json["price"].toDouble(),
        sku: json["sku"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "in_stock": inStock,
        "name_json": nameJson?.toJson(),
        "old_price": oldPrice,
        "price": price,
        "sku": sku ?? '',
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}

// import 'dart:convert';

// Menu3 menu3FromJson(String str) => Menu3.fromJson(json.decode(str));

// String menu3ToJson(Menu3 data) => json.encode(data.toJson());

// class Menu3 {
//   Menu3({
//     this.autoDiscount,
//     required this.categories,
//     required this.offers,
//     required this.parts,
//     required this.result,
//     required this.sides,
//   });

//   dynamic autoDiscount;
//   List<Category> categories;
//   List<Offer> offers;
//   Map<String, Part> parts;
//   bool result;
//   Map<String, Side> sides;

//   factory Menu3.fromJson(Map<String, dynamic> json) => Menu3(
//         autoDiscount: json["auto_discount"],
//         categories: List<Category>.from(
//             json["categories"].map((x) => Category.fromJson(x))),
//         offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
//         parts: Map.from(json["parts"])
//             .map((k, v) => MapEntry<String, Part>(k, Part.fromJson(v))),
//         result: json["result"],
//         sides: Map.from(json["sides"])
//             .map((k, v) => MapEntry<String, Side>(k, Side.fromJson(v))),
//       );

//   Map<String, dynamic> toJson() => {
//         "auto_discount": autoDiscount,
//         "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//         "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
//         "parts": Map.from(parts)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "result": result,
//         "sides": Map.from(sides)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//       };
// }

// class Category {
//   Category({
//     required this.availability,
//     this.descriptionJson,
//     required this.id,
//     required this.image,
//     required this.inStock,
//     required this.nameJson,
//     required this.products,
//   });

//   Availability availability;
//   Json? descriptionJson;
//   int id;
//   String image;
//   bool inStock;
//   Json nameJson;
//   List<Part> products;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         availability: Availability.fromJson(json["availability"]),
//         descriptionJson: json["description_json"] == null
//             ? null
//             : Json.fromJson(json["description_json"]),
//         id: json["id"],
//         image: json["image"] ?? '',
//         inStock: json["in_stock"],
//         nameJson: Json.fromJson(json["name_json"]),
//         products:
//             List<Part>.from(json["products"].map((x) => Part.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "availability": availability.toJson(),
//         "description_json": descriptionJson?.toJson() ?? '',
//         "id": id,
//         "image": image,
//         "in_stock": inStock,
//         "name_json": nameJson.toJson(),
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//       };
// }

// class Availability {
//   Availability({
//     required this.always,
//     this.end,
//     this.start,
//     this.time,
//     this.orderType,
//     // this.days,
//   });

//   bool always;
//   List<String>? end;
//   List<String>? start;
//   Time? time;
//   List<String>? orderType;
//   // List<int>? days;

//   factory Availability.fromJson(Map<String, dynamic> json) => Availability(
//         always: json["always"],
//         end: json["end"] == null
//             ? null
//             : List<String>.from(json["end"].map((x) => x)),
//         start: json["start"] == null
//             ? null
//             : List<String>.from(json["start"].map((x) => x)),
//         time: json["time"] == null ? null : Time.fromJson(json["time"]),
//         orderType: json["order_type_"] == null
//             ? null
//             : List<String>.from(json["order_type_"].map((x) => x)),
//         // days: json["days"] == null
//         //     ? null
//         //     : List<int>.from(json["days"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "always": always,
//         "end": end == null ? null : List<dynamic>.from(end!.map((x) => x)),
//         "start":
//             start == null ? null : List<dynamic>.from(start!.map((x) => x)),
//         "time": time == null ? null : time!.toJson(),
//         "order_type_": orderType == null
//             ? null
//             : List<dynamic>.from(orderType!.map((x) => x)),
//         // "days": days == null ? null : List<dynamic>.from(days!.map((x) => x)),
//       };
// }

// class Time {
//   Time({
//     required this.end,
//     required this.start,
//   });

//   String end;
//   String start;

//   factory Time.fromJson(Map<String, dynamic> json) => Time(
//         end: json["end"],
//         start: json["start"],
//       );

//   Map<String, dynamic> toJson() => {
//         "end": end,
//         "start": start,
//       };
// }

// class Json {
//   Json({
//     required this.english,
//     required this.german,
//   });

//   String english;
//   String german;

//   factory Json.fromJson(Map<String, dynamic> json) => Json(
//         english: json["english"],
//         german: json["german"],
//       );

//   Map<String, dynamic> toJson() => {
//         "english": english,
//         "german": german,
//       };
// }

// class Part {
//   Part({
//     this.choice,
//     required this.descriptionJson,
//     required this.id,
//     required this.image,
//     required this.inStock,
//     required this.isPopular,
//     required this.nameJson,
//     this.oldPrice,
//     required this.price,
//     this.sideProductsJson,
//     this.sku,
//     this.type,
//   });

//   List<Choice>? choice;
//   Json descriptionJson;
//   int id;
//   String image;
//   bool inStock;
//   bool isPopular;
//   Json nameJson;
//   dynamic oldPrice;
//   double price;
//   List<SideProductsJson>? sideProductsJson;
//   String? sku;
//   Type? type;

//   factory Part.fromJson(Map<String, dynamic> json) => Part(
//         choice: json["choice"] == null
//             ? null
//             : List<Choice>.from(json["choice"].map((x) => Choice.fromJson(x))),
//         descriptionJson: Json.fromJson(json["description_json"]),
//         id: json["id"],
//         image: json["image"] ?? '',
//         inStock: json["in_stock"],
//         isPopular: json["is_popular"] ?? '',
//         nameJson: Json.fromJson(json["name_json"]),
//         oldPrice: json["old_price"],
//         price: json["price"].toDouble(),
//         sideProductsJson: json["side_products_json"] == null
//             ? null
//             : List<SideProductsJson>.from(json["side_products_json"]
//                 .map((x) => SideProductsJson.fromJson(x))),
//         sku: json["sku"] ?? '',
//         type: json["type_"] == null ? null : typeValues.map[json["type_"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "choice": choice == null
//             ? null
//             : List<dynamic>.from(choice!.map((x) => x.toJson())),
//         "description_json": descriptionJson.toJson(),
//         "id": id,
//         "image": image,
//         "in_stock": inStock,
//         "is_popular": isPopular,
//         "name_json": nameJson.toJson(),
//         "old_price": oldPrice,
//         "price": price,
//         "side_products_json": sideProductsJson == null
//             ? null
//             : List<dynamic>.from(sideProductsJson!.map((x) => x.toJson())),
//         "sku": sku ?? '',
//         "type_": type == null ? null : typeValues.reverse[type],
//       };
// }

// class Choice {
//   Choice({
//     required this.hasProducts,
//     required this.nameJson,
//     this.options,
//     this.type,
//     // this.choice,
//   });

//   bool hasProducts;
//   Json nameJson;
//   List<Option>? options;
//   Type? type;
//   // List<int>? choice;

//   factory Choice.fromJson(Map<String, dynamic> json) => Choice(
//         hasProducts: json["has_products"],
//         nameJson: Json.fromJson(json["name_json"]),
//         options: json["options"] == null
//             ? null
//             : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
//         type: typeValues.map[json["type_"]],
//         // choice: json["choice"] == null
//         //     ? null
//         //     : List<int>.from(json["choice"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "has_products": hasProducts,
//         "name_json": nameJson.toJson(),
//         "options": options == null
//             ? null
//             : List<dynamic>.from(options!.map((x) => x.toJson())),
//         "type_": typeValues.reverse[type],
//         // "choice":
//         //     choice == null ? null : List<dynamic>.from(choice!.map((x) => x)),
//       };
// }

// class Option {
//   Option({
//     required this.nameJson,
//     // required this.price,
//   });

//   Json nameJson;
//   // int price;

//   factory Option.fromJson(Map<String, dynamic> json) => Option(
//         nameJson: Json.fromJson(json["name_json"]),
//         // price: json["price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name_json": nameJson.toJson(),
//         // "price": price,
//       };
// }

// enum Type { SINGLE, MULTIPLE }

// final typeValues =
//     EnumValues({"MULTIPLE": Type.MULTIPLE, "SINGLE": Type.SINGLE});

// class SideProductsJson {
//   SideProductsJson({
//     required this.nameJson,
//     // required this.optionIds,
//     this.type,
//   });

//   Json nameJson;
//   // List<int> optionIds;
//   Type? type;

//   factory SideProductsJson.fromJson(Map<String, dynamic> json) =>
//       SideProductsJson(
//         nameJson: Json.fromJson(json["name_json"]),
//         // optionIds: List<int>.from(json["option_ids"].map((x) => x)),
//         type: typeValues.map[json["type_"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "name_json": nameJson.toJson(),
//         // "option_ids": List<dynamic>.from(optionIds.map((x) => x)),
//         "type_": typeValues.reverse[type],
//       };
// }

// class Offer {
//   Offer({
//     required this.categories,
//     required this.code,
//     required this.descriptionJson,
//     this.endDate,
//     // required this.minAmount,
//     required this.offerType,
//     required this.orderType,
//     required this.period,
//     // required this.provided,
//     this.startDate,
//   });

//   Categories categories;
//   String code;
//   Json descriptionJson;
//   dynamic endDate;
//   // int minAmount;
//   String offerType;
//   String orderType;
//   String period;
//   // int provided;
//   dynamic startDate;

//   factory Offer.fromJson(Map<String, dynamic> json) => Offer(
//         categories: Categories.fromJson(json["categories"]),
//         code: json["code"],
//         descriptionJson: Json.fromJson(json["description_json"]),
//         endDate: json["end_date"],
//         // minAmount: json["min_amount"],
//         offerType: json["offer_type_"],
//         orderType: json["order_type_"],
//         period: json["period"],
//         // provided: json["provided"],
//         startDate: json["start_date"],
//       );

//   Map<String, dynamic> toJson() => {
//         "categories": categories.toJson(),
//         "code": code,
//         "description_json": descriptionJson.toJson(),
//         "end_date": endDate,
//         // "min_amount": minAmount,
//         "offer_type_": offerType,
//         "order_type_": orderType,
//         "period": period,
//         // "provided": provided,
//         "start_date": startDate,
//       };
// }

// class Categories {
//   Categories({
//     required this.forAll,
//     required this.ids,
//   });

//   bool forAll;
//   List<dynamic> ids;

//   factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         forAll: json["for_all"],
//         ids: List<dynamic>.from(json["ids"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "for_all": forAll,
//         "ids": List<dynamic>.from(ids.map((x) => x)),
//       };
// }

// class Side {
//   Side({
//     required this.id,
//     required this.inStock,
//     required this.nameJson,
//     this.oldPrice,
//     required this.price,
//     required this.sku,
//   });

//   int id;
//   bool inStock;
//   Json nameJson;
//   dynamic oldPrice;
//   double price;
//   String sku;

//   factory Side.fromJson(Map<String, dynamic> json) => Side(
//         id: json["id"],
//         inStock: json["in_stock"],
//         nameJson: Json.fromJson(json["name_json"]),
//         oldPrice: json["old_price"],
//         price: json["price"].toDouble(),
//         sku: json["sku"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "in_stock": inStock,
//         "name_json": nameJson.toJson(),
//         "old_price": oldPrice,
//         "price": price,
//         "sku": sku,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }


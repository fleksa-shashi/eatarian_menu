// // To parse this JSON data, do
// //
// //     final menu4 = menu4FromJson(jsonString);

// import 'dart:convert';

// Menu4 menu4FromJson(String str) => Menu4.fromJson(json.decode(str));

// String menu4ToJson(Menu4 data) => json.encode(data.toJson());

// class Menu4 {
//     Menu4({
//         this.autoDiscount,
//         this.categories,
//         this.offers,
//         this.parts,
//         this.result,
//         this.sides,
//     });

//     dynamic autoDiscount;
//     List<Category> categories;
//     List<Offer> offers;
//     Map<String, Part> parts;
//     bool result;
//     Map<String, Side> sides;

//     factory Menu4.fromJson(Map<String, dynamic> json) => Menu4(
//         autoDiscount: json["auto_discount"],
//         categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//         offers: json["offers"] == null ? null : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
//         parts: json["parts"] == null ? null : Map.from(json["parts"]).map((k, v) => MapEntry<String, Part>(k, Part.fromJson(v))),
//         result: json["result"] == null ? null : json["result"],
//         sides: json["sides"] == null ? null : Map.from(json["sides"]).map((k, v) => MapEntry<String, Side>(k, Side.fromJson(v))),
//     );

//     Map<String, dynamic> toJson() => {
//         "auto_discount": autoDiscount,
//         "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
//         "offers": offers == null ? null : List<dynamic>.from(offers.map((x) => x.toJson())),
//         "parts": parts == null ? null : Map.from(parts).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "result": result == null ? null : result,
//         "sides": sides == null ? null : Map.from(sides).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//     };
// }

// class Category {
//     Category({
//         this.availability,
//         this.descriptionJson,
//         this.id,
//         this.image,
//         this.inStock,
//         this.nameJson,
//         this.products,
//     });

//     Availability availability;
//     Json descriptionJson;
//     int id;
//     dynamic image;
//     bool inStock;
//     Json nameJson;
//     List<Part> products;

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
//         descriptionJson: json["description_json"] == null ? null : Json.fromJson(json["description_json"]),
//         id: json["id"] == null ? null : json["id"],
//         image: json["image"],
//         inStock: json["in_stock"] == null ? null : json["in_stock"],
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         products: json["products"] == null ? null : List<Part>.from(json["products"].map((x) => Part.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "availability": availability == null ? null : availability.toJson(),
//         "description_json": descriptionJson == null ? null : descriptionJson.toJson(),
//         "id": id == null ? null : id,
//         "image": image,
//         "in_stock": inStock == null ? null : inStock,
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
//     };
// }

// class Availability {
//     Availability({
//         this.always,
//     });

//     bool always;

//     factory Availability.fromJson(Map<String, dynamic> json) => Availability(
//         always: json["always"] == null ? null : json["always"],
//     );

//     Map<String, dynamic> toJson() => {
//         "always": always == null ? null : always,
//     };
// }

// class Json {
//     Json({
//         this.english,
//         this.german,
//     });

//     String english;
//     String german;

//     factory Json.fromJson(Map<String, dynamic> json) => Json(
//         english: json["english"] == null ? null : json["english"],
//         german: json["german"] == null ? null : json["german"],
//     );

//     Map<String, dynamic> toJson() => {
//         "english": english == null ? null : english,
//         "german": german == null ? null : german,
//     };
// }

// class Part {
//     Part({
//         this.choice,
//         this.descriptionJson,
//         this.id,
//         this.image,
//         this.inStock,
//         this.isPopular,
//         this.nameJson,
//         this.oldPrice,
//         this.price,
//         this.sideProductsJson,
//         this.sku,
//         this.type,
//     });

//     List<Choice> choice;
//     Json descriptionJson;
//     int id;
//     dynamic image;
//     bool inStock;
//     bool isPopular;
//     Json nameJson;
//     dynamic oldPrice;
//     double price;
//     List<SideProductsJson> sideProductsJson;
//     String sku;
//     Type type;

//     factory Part.fromJson(Map<String, dynamic> json) => Part(
//         choice: json["choice"] == null ? null : List<Choice>.from(json["choice"].map((x) => Choice.fromJson(x))),
//         descriptionJson: json["description_json"] == null ? null : Json.fromJson(json["description_json"]),
//         id: json["id"] == null ? null : json["id"],
//         image: json["image"],
//         inStock: json["in_stock"] == null ? null : json["in_stock"],
//         isPopular: json["is_popular"] == null ? null : json["is_popular"],
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         oldPrice: json["old_price"],
//         price: json["price"] == null ? null : json["price"].toDouble(),
//         sideProductsJson: json["side_products_json"] == null ? null : List<SideProductsJson>.from(json["side_products_json"].map((x) => SideProductsJson.fromJson(x))),
//         sku: json["sku"] == null ? null : json["sku"],
//         type: json["type_"] == null ? null : typeValues.map[json["type_"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "choice": choice == null ? null : List<dynamic>.from(choice.map((x) => x.toJson())),
//         "description_json": descriptionJson == null ? null : descriptionJson.toJson(),
//         "id": id == null ? null : id,
//         "image": image,
//         "in_stock": inStock == null ? null : inStock,
//         "is_popular": isPopular == null ? null : isPopular,
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "old_price": oldPrice,
//         "price": price == null ? null : price,
//         "side_products_json": sideProductsJson == null ? null : List<dynamic>.from(sideProductsJson.map((x) => x.toJson())),
//         "sku": sku == null ? null : sku,
//         "type_": type == null ? null : typeValues.reverse[type],
//     };
// }

// class Choice {
//     Choice({
//         this.hasProducts,
//         this.nameJson,
//         this.options,
//         this.type,
//         this.choice,
//     });

//     bool hasProducts;
//     Json nameJson;
//     List<Option> options;
//     Type type;
//     List<int> choice;

//     factory Choice.fromJson(Map<String, dynamic> json) => Choice(
//         hasProducts: json["has_products"] == null ? null : json["has_products"],
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
//         type: json["type_"] == null ? null : typeValues.map[json["type_"]],
//         choice: json["choice"] == null ? null : List<int>.from(json["choice"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "has_products": hasProducts == null ? null : hasProducts,
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
//         "type_": type == null ? null : typeValues.reverse[type],
//         "choice": choice == null ? null : List<dynamic>.from(choice.map((x) => x)),
//     };
// }

// class Option {
//     Option({
//         this.nameJson,
//         this.price,
//     });

//     Json nameJson;
//     double price;

//     factory Option.fromJson(Map<String, dynamic> json) => Option(
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         price: json["price"] == null ? null : json["price"].toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "price": price == null ? null : price,
//     };
// }

// enum Type { SINGLE, MULTIPLE }

// final typeValues = EnumValues({
//     "MULTIPLE": Type.MULTIPLE,
//     "SINGLE": Type.SINGLE
// });

// class SideProductsJson {
//     SideProductsJson({
//         this.hasProducts,
//         this.nameJson,
//         this.optionIds,
//         this.type,
//     });

//     bool hasProducts;
//     Json nameJson;
//     List<int> optionIds;
//     Type type;

//     factory SideProductsJson.fromJson(Map<String, dynamic> json) => SideProductsJson(
//         hasProducts: json["has_products"] == null ? null : json["has_products"],
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         optionIds: json["option_ids"] == null ? null : List<int>.from(json["option_ids"].map((x) => x)),
//         type: json["type_"] == null ? null : typeValues.map[json["type_"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "has_products": hasProducts == null ? null : hasProducts,
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "option_ids": optionIds == null ? null : List<dynamic>.from(optionIds.map((x) => x)),
//         "type_": type == null ? null : typeValues.reverse[type],
//     };
// }

// class Offer {
//     Offer({
//         this.categories,
//         this.code,
//         this.descriptionJson,
//         this.endDate,
//         this.minAmount,
//         this.offerType,
//         this.orderType,
//         this.period,
//         this.provided,
//         this.startDate,
//     });

//     Categories categories;
//     String code;
//     Json descriptionJson;
//     dynamic endDate;
//     int minAmount;
//     String offerType;
//     String orderType;
//     String period;
//     int provided;
//     dynamic startDate;

//     factory Offer.fromJson(Map<String, dynamic> json) => Offer(
//         categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
//         code: json["code"] == null ? null : json["code"],
//         descriptionJson: json["description_json"] == null ? null : Json.fromJson(json["description_json"]),
//         endDate: json["end_date"],
//         minAmount: json["min_amount"] == null ? null : json["min_amount"],
//         offerType: json["offer_type_"] == null ? null : json["offer_type_"],
//         orderType: json["order_type_"] == null ? null : json["order_type_"],
//         period: json["period"] == null ? null : json["period"],
//         provided: json["provided"] == null ? null : json["provided"],
//         startDate: json["start_date"],
//     );

//     Map<String, dynamic> toJson() => {
//         "categories": categories == null ? null : categories.toJson(),
//         "code": code == null ? null : code,
//         "description_json": descriptionJson == null ? null : descriptionJson.toJson(),
//         "end_date": endDate,
//         "min_amount": minAmount == null ? null : minAmount,
//         "offer_type_": offerType == null ? null : offerType,
//         "order_type_": orderType == null ? null : orderType,
//         "period": period == null ? null : period,
//         "provided": provided == null ? null : provided,
//         "start_date": startDate,
//     };
// }

// class Categories {
//     Categories({
//         this.forAll,
//         this.ids,
//     });

//     bool forAll;
//     List<dynamic> ids;

//     factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         forAll: json["for_all"] == null ? null : json["for_all"],
//         ids: json["ids"] == null ? null : List<dynamic>.from(json["ids"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "for_all": forAll == null ? null : forAll,
//         "ids": ids == null ? null : List<dynamic>.from(ids.map((x) => x)),
//     };
// }

// class Side {
//     Side({
//         this.id,
//         this.inStock,
//         this.nameJson,
//         this.oldPrice,
//         this.price,
//         this.sku,
//     });

//     int id;
//     bool inStock;
//     Json nameJson;
//     dynamic oldPrice;
//     double price;
//     dynamic sku;

//     factory Side.fromJson(Map<String, dynamic> json) => Side(
//         id: json["id"] == null ? null : json["id"],
//         inStock: json["in_stock"] == null ? null : json["in_stock"],
//         nameJson: json["name_json"] == null ? null : Json.fromJson(json["name_json"]),
//         oldPrice: json["old_price"],
//         price: json["price"] == null ? null : json["price"].toDouble(),
//         sku: json["sku"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "in_stock": inStock == null ? null : inStock,
//         "name_json": nameJson == null ? null : nameJson.toJson(),
//         "old_price": oldPrice,
//         "price": price == null ? null : price,
//         "sku": sku,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }

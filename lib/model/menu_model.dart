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

class Menu {
  Json nameJson;
  Menu({
    required this.nameJson,
  });
  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(nameJson: Json.fromJson(json["name_json"]));
  }
}

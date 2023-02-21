class Instruction {
  final String displayText;

  Instruction({required this.displayText});

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        displayText: json['display_text'] != null
            ? json['display_text']
            : 'No description',
      );
}

class Section {
  Section({
    required this.components,
  });

  List<Component> components;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        components: json["components"] != null
            ? List<Component>.from(
                json["components"].map((x) => Component.fromJson(x)))
            : [],
      );
}

class Component {
  Component({
    required this.rawText,
  });

  String rawText;
  factory Component.fromJson(Map<String, dynamic> json) => Component(
        rawText: json["raw_text"] != null ? json["raw_text"] : "",
      );
}

class Recipe {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final List<Instruction> instructions;
  final List<Section> sections;

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime,
      required this.description,
      required this.instructions,
      required this.sections});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['thumbnail_url'] as String,
        rating: json['country'] as String,
        totalTime: json['total_time_minutes'] != null
            ? json['total_time_minutes'].toString() + " min"
            : "30 min",
        description: json['description'] != null ? json['description'] : "",
        instructions: json['instructions'] != null
            ? List<Instruction>.from(
                json['instructions'].map((x) => Instruction.fromJson(x)))
            : [],
        sections: json['sections'] != null
            ? List<Section>.from(
                json['sections'].map((x) => Section.fromJson(x)))
            : []);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
// To parse this JSON data, do
//
//     final doa = doaFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<Doa> doaFromJson(String str) =>
//     List<Doa>.from(json.decode(str).map((x) => Doa.fromJson(x)));

// String doaToJson(List<Doa> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Doa {
//   Doa({
//     this.id,
//     this.doa,
//     this.ayat,
//     this.latin,
//     this.artinya,
//   });

//   String? id;
//   String? doa;
//   String? ayat;
//   String? latin;
//   String? artinya;

//   factory Doa.fromJson(Map<String, dynamic> json) => Doa(
//         id: json["id"],
//         doa: json["doa"],
//         ayat: json["ayat"],
//         latin: json["latin"],
//         artinya: json["artinya"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "doa": doa,
//         "ayat": ayat,
//         "latin": latin,
//         "artinya": artinya,
//       };
// }

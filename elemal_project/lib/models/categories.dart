// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final String message;
  final List<Category> category;

  Categories({
    required this.message,
    required this.category,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    message: json["message"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  final Name name;
  final Name slug;
  final String id;
  final Image image;

  Category({
    required this.name,
    required this.slug,
    required this.id,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: Name.fromJson(json["name"]),
    slug: Name.fromJson(json["slug"]),
    id: json["_id"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "slug": slug.toJson(),
    "_id": id,
    "image": image.toJson(),
  };
}

class Image {
  final String secureUrl;
  final String publicId;

  Image({
    required this.secureUrl,
    required this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    secureUrl: json["secure_url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "secure_url": secureUrl,
    "public_id": publicId,
  };
}

class Name {
  final String ar;
  final String en;

  Name({
    required this.ar,
    required this.en,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    ar: json["ar"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "en": en,
  };
}

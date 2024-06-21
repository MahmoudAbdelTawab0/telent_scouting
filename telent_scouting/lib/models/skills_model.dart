
// To parse this JSON data, do
//
//     final skils = skilsFromJson(jsonString);


class Skils {
  final String name;
  final String content;
  final String video;

  Skils({
    required this.name,
    required this.content,
    required this.video,
  });

  factory Skils.fromJson(Map<String, dynamic> json) => Skils(
    name: json["name"],
    content: json["content"],
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "content": content,
    "video": video,
  };
}



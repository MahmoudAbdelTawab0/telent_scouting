
class GetToptenUser {
  final int id;
  final String username;
  final double jugglingScore;
  final double speedScore;
  final double agilityScore;
  final double dribblingScore;
  final double totalScore;

  GetToptenUser({
    required this.id,
    required this.username,
    required this.jugglingScore,
    required this.speedScore,
    required this.agilityScore,
    required this.dribblingScore,
    required this.totalScore,
  });

  factory GetToptenUser.fromJson(Map<String, dynamic> json) => GetToptenUser(
    id: json["id"],
    username: json["username"],
    jugglingScore: json["juggling_score"]?.toDouble(),
    speedScore: json["speed_score"]?.toDouble(),
    agilityScore: json["agility_score"]?.toDouble(),
    dribblingScore: json["dribbling_score"]?.toDouble(),
    totalScore: json["total_score"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "juggling_score": jugglingScore,
    "speed_score": speedScore,
    "agility_score": agilityScore,
    "dribbling_score": dribblingScore,
    "total_score": totalScore,
  };
}

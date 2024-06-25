import 'package:dio/dio.dart';
import 'package:telent_scouting/models/skills_model.dart';

//List<String> skillName =["Passing","Eglty"];


class SkillRepo {
  final dio = Dio();

  void uploadSkillsData(
      {required String username,
      double juggling_score = 0,
      double speed_score = 0,
      double agility_score = 0,
        double dribbling_score = 0
      }) async {
    const path = "https://graduationmodel.pythonanywhere.com/api/add/";
    Map<String, dynamic> data = {
      "username": username,
      "juggling_score": juggling_score,
      "speed_score": speed_score,
      "agility_score": agility_score,
      "dribbling_score": dribbling_score
    };
    try {
      final response = await dio.post(path, data: data);
      print(response);
    } on Exception catch (e) {
      print(e);
    }
  }
}

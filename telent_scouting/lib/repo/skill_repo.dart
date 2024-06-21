
import 'package:dio/dio.dart';
import 'package:telent_scouting/models/skills_model.dart';
//List<String> skillName =["Passing","Eglty"];

class SkillRepo{

  Future<List<Response<dynamic>>> getSkill() async{
  final dio  = Dio();
  const path = "https://footballscout.pythonanywhere.com/api/skills/";
  final response =await dio.get(path);
  final List<Response<dynamic>> skillData = Skils.fromJson(response.data) as List<Response>;
  return skillData ;

}
}
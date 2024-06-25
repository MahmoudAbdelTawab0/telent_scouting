import 'package:dio/dio.dart';
import 'package:telent_scouting/models/get_topten_model.dart';

class GetToptenUserRepo {
  final dio = Dio();
  Future<List<GetToptenUser>> getData() async {
    final path = "https://graduationmodel.pythonanywhere.com/api/top10/";
    final Response<List<dynamic>> response = await dio.get(path);
    final  data = response.data!.map((e) => GetToptenUser.fromJson(e)).toList();
    return data;
  }
}



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SkillVideoRepo {
  final dio = Dio();

  Future<Response> uploadSkillsVideo(
      {required String username,
        required FormData source_video
      }) async {
    const path = "http://47.186.54.192:53785/juggling/";

    Response response =Response(requestOptions: RequestOptions()) ;
    try {
       response = await dio.post(path, data: source_video);


    } on Exception catch (e) {
      print(e);
    }
    return response;
  }
}
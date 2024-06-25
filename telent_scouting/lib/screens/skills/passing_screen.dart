import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shimmer/shimmer.dart';
import 'package:telent_scouting/bloc_skills/skills_cubit.dart';
//import 'package:telent_scouting/bloc_skills/skills_cubit.dart';
import 'package:telent_scouting/models/skills_model.dart';
import 'package:telent_scouting/repo/skill_repo.dart';
import 'package:telent_scouting/repo/upload_videospeed_repo.dart';
import 'package:telent_scouting/screens/login_screen.dart';
import 'package:video_player/video_player.dart';


class PassingScreen extends StatefulWidget {
  final String skillName;
  const PassingScreen({super.key, required this.skillName});

  @override
  State<PassingScreen> createState() => _PassingScreenState();
}

class _PassingScreenState extends State<PassingScreen> {
  File? _video;
  bool pause = false;
  late FlickManager flickManager;
  late VideoPlayerController _videoPlayerController;
  final picker = ImagePicker();
  final _auth =  FirebaseAuth.instance.currentUser;



  Future<void> pickVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
      });
    }
  }
  Future<void> uploadVideo() async {
    if (_video == null) {
      print('No video selected');
      return;
    }

    String fileName = basename(_video!.path);
    print("$fileName");
    FormData formData = FormData.fromMap({
      "username" : _auth!.email!,
      "source_video" : await MultipartFile.fromFile(_video!.path, filename: fileName),
    });
    print("formData: $formData");
    try {
      final data =
      await SkillSpeedVideoRepo().uploadSkillSpeedVideo(username: _auth.email!, source_video: formData);
      print("mahmoud:$data");
    } catch (e) {
      print("File upload error: $e");
    }

  }

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse("https://footballscout.pythonanywhere.com/media/videos/Pass_AB4JMEH.mp4")
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.skillName,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 30,
              fontFamily: "Kanit"),
        ),
        backgroundColor: Colors.green.shade400,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [

        Column(
        children: [
        Container(

        child: FlickVideoPlayer(flickManager: flickManager)
      ),
      SizedBox(height: 20,),
      Text(
        "Passing",
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          "the key techniques for passing a football accurately include proper body positioning, using the inside of the foot for short passes and instep for longer passes, keeping your eyes on the target, and following through with the pass",
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF78787c),
              fontSize: 16),
          maxLines: 7,
          textAlign: TextAlign.left,
        ),
      ),
      ],
    ),


            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset(
                "assets/images/img_4-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 60,),
            ElevatedButton(
              onPressed: ()async{
                print("before video");
                await pickVideo();
                print("before mahmoud video");
                await uploadVideo();
                print("after upload video");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.92, // width
                    57 // height
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Upload Vedio',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ), //
    );
  }
}

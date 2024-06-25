import 'dart:io';


import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:telent_scouting/repo/upload_videodribbling_repo.dart';
import 'package:video_player/video_player.dart';

class DribblingScreen extends StatefulWidget {
  final String skillName;
  const DribblingScreen({super.key, required this.skillName});

  @override
  State<DribblingScreen> createState() => _DribblingScreenState();
}

class _DribblingScreenState extends State<DribblingScreen> {
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
      await SkillDribblingVideoRepo().uploadSkillDrbblingVideo(username: _auth.email!, source_video: formData);
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
            Uri.parse("https://footballscout.pythonanywhere.com/media/videos/Dribbling.mp4")
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
        "Dribbling",
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
          "dribbling is maneuvering a ball by one player while moving in a given direction, avoiding defenders' attempts to intercept the ball",
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
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                "assets/images/img_3-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 60,),
            ElevatedButton(
              onPressed: () async{
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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:telent_scouting/models/skills_model.dart';
import 'package:telent_scouting/repo/skill_repo.dart';
import 'package:telent_scouting/screens/login_screen.dart';
import 'package:video_player/video_player.dart';

class JugglingScreen extends StatefulWidget {
  final String skillName;
  const JugglingScreen({super.key, required this.skillName});

  @override
  State<JugglingScreen> createState() => _JugglingScreenState();
}

class _JugglingScreenState extends State<JugglingScreen> {
  File? _video;
  bool pause = false;
  late FlickManager flickManager;
  late VideoPlayerController _videoPlayerController;
  final picker = ImagePicker();


  _pickVideo() async {
    final video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _video = File(video.path);

      _videoPlayerController = VideoPlayerController.file(_video!)
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController.play();
        });
    }
  }

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse("https://footballscout.pythonanywhere.com/media/videos/juggling.mp4")
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
        "Juggling",
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
          "is one of the basic skills in football. It helps control the ball, but it requires training",
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
                "assets/images/img_2-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 60,),
            ElevatedButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Please login first and try again",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins"),
                      ),
                      backgroundColor: Colors.green.shade400,
                    ),
                  );
                  Future.delayed(
                    const Duration(seconds: 1),
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  );
                } else {
                  _pickVideo();
                }
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

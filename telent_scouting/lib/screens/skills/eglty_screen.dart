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
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EgltyScreen extends StatefulWidget {
  final String skillName;
  const EgltyScreen({super.key, required this.skillName});

  @override
  State<EgltyScreen> createState() => _EgltyScreenState();
}

class _EgltyScreenState extends State<EgltyScreen> {
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
            Uri.parse("https://footballscout.pythonanywhere.com/media/videos/Agility.mp4")
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
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: FlickVideoPlayer(flickManager: flickManager)
                ),
                SizedBox(height: 20,),
                Text(
                  "Agility",
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
                      "Shuttle Run is used to measure a player's speed within a distance of 10 meters between two points" ,
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
                "assets/images/img_1-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 60,),
            ElevatedButton(
              onPressed: () {
                  _pickVideo();

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

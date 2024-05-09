import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telent_scouting/screens/login_screen.dart';
import 'package:video_player/video_player.dart';

class PassingScreen extends StatefulWidget {
  const PassingScreen({super.key});

  @override
  State<PassingScreen> createState() => _PassingScreenState();
}

class _PassingScreenState extends State<PassingScreen> {
  File? _video;
  bool pause = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Passing",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 30,
              fontFamily: "Poppins"),
        ),
        backgroundColor: Colors.lightGreen,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _video != null
                ? _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: 1.2,
                        child: SizedBox(
                          height: 300,
                          width: 400,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      )
                    : Container()
                : Image.asset(
                    "assets/images/img_0.png",
                    height: 300,
                    fit: BoxFit.fill,
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please login first and try again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins"
                      ),
                    ),
                      backgroundColor: Colors.lightGreen,
                    ),
                  );
                  Future.delayed(const Duration(seconds: 1),() =>
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      ),);

                } else {
                  _pickVideo();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
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
            ), //
          ],
        ),
      ),
    );
  }
}

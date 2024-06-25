import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telent_scouting/repo/get_topten_repo.dart';
import 'package:telent_scouting/repo/skill_repo.dart';

import 'package:telent_scouting/models/get_topten_model.dart';
import 'package:telent_scouting/models/skills_model.dart';
import 'package:telent_scouting/screens/pages.dart';

Color primeColor = const Color(0xFF69A03A);
Color secondColor = Colors.green.shade900;

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Result();
  }
}

class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var futureToptenUsers;

  String? username = "user3";
  int? age = 10;
  String? city = "Fayoum";
  int? height = 100;
  int? weight = 35;

  double? juggling_score = 1.9 * 4;
  double? passing_score = 2 * 4;
  double? dribbling_score = 2 * 4;
  double? agility_score = 2 * 4;

  double? totalScore = 0;

  @override
  void initState() {
    super.initState();
    // calculate totalScore
    totalScore =
        (juggling_score! + passing_score! + dribbling_score! + agility_score!) /
            4;

    var data = GetToptenUserRepo().getData();
    futureToptenUsers = data;

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
        backgroundColor: primeColor,
        //   actions: [
        //     GestureDetector(
        //   // onTap: () =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Pages()),),
        //   child: const Icon(
        //     Icons.arrow_forward_ios_rounded,
        //     color: Colors.white,
        //     size: 25,
        //   ),
        // )
        //   ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 16.0,
                right: 16.0,
                left: 16.0,
              ),
              // height: MediaQuery.of(context).size.height*0.4,

              decoration: BoxDecoration(
                color: primeColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(children: [
                Column(children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: secondColor,
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Column(
                    children: [
                      Text(
                        username!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('age: ${age!}'),
                                Text('city: ${city!}'),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                Text('height: ${height!}'),
                                Text('weight: ${weight!}'),
                              ],
                            ),
                          ])
                    ],
                  )
                ]),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: totalScore! / 10,
                          backgroundColor: Colors.white,
                          strokeWidth: 16,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(secondColor),
                        ),
                      ),
                      Text(
                        totalScore!.toString(),
                        style: const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ],
                  ),
                  // Text(
                  //   '47',
                  //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  // ),
                ),
              ]),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    skillProgress("juggling"),
                    const SizedBox(width: 20),
                    skillProgress("passing"),
                  ]),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    skillProgress("agility"),
                    const SizedBox(width: 20),
                    skillProgress("dribbling"),
                  ]),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'List of Top Players',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 6,
                      width: MediaQuery.of(context).size.width - 60,
                      child: Container(
                        color: secondColor,
                      )),
                  listOfTopTen(futureToptenUsers, username!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Widget skillProgress(String skill) {

  return FutureBuilder(
    future: SharedPreferences.getInstance(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final value = snapshot.data?.getDouble(skill);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(skill, style: const TextStyle(fontSize: 18, color: Colors.black)),
              const SizedBox(width: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      value: value ?? 0 / 10,
                      backgroundColor: Colors.white,
                      strokeWidth: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(secondColor),
                    ),
                  ),
                   Text(
                    "$value",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return const SizedBox();
    },
  );
}

Widget listOfTopTen(futureToptenUsers, String userid) {
  return FutureBuilder<List<GetToptenUser>>(
    future: futureToptenUsers,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text('No data available'));
      } else {
        return ListView.builder(
          shrinkWrap:
              true, // Important to prevent ListView from expanding infinitely
          physics:
              const NeverScrollableScrollPhysics(), // Prevent the ListView from scrolling separately
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final user = snapshot.data![index];
            return Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: user.username == userid
                      ? secondColor
                      : primeColor, // Background color of the container
                  borderRadius: BorderRadius.circular(
                      8), // Optional: Border radius of the container
                ),
                child: ListTile(
                  title: Text(user.username),
                  subtitle: Text('Total Score: ${user.totalScore}'),
                ));
          },
        );
      }
    },
  );
}
//

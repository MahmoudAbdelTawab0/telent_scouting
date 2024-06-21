import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telent_scouting/screens/register_screen.dart';
import 'package:telent_scouting/screens/text_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
Future<void> editField (String field) async {
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.green.shade400,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              Icons.person,
              size: 72,
            ),
            Text(
              currentUser.email!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "My Details",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
            TextBox(text: "text",
                sectionName: "sectionName",
                onPressed: () => editField("username")
            ),
            TextBox(text: "empty bio",
                sectionName: "name",
                onPressed: () => editField("bio")
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "My Posts",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
          ],
        ));
  }
}

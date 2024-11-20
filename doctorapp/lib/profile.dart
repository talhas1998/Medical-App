import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  String? userName = "Guest";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('RegisterUsers')
            .doc(user.uid)
            .get();

        print(snapshot);
        if (snapshot.exists) {
          setState(() {
            userName = snapshot['name'] ?? "Guest";
          });
        } else {
          print("User document does not exist!");
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Circular Avatar
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Text Information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hi, $userName',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Welcome to Quick Medical Store',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.edit_note_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arial',
                      ),
                    ),
                    tileColor: Colors.white,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  ListTile(
                    leading: Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      'My Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arial',
                      ),
                    ),
                    tileColor: Colors.white,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Billing',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arial',
                      ),
                    ),
                    tileColor: Colors.white,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.question_mark,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Faq',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arial',
                      ),
                    ),
                    tileColor: Colors.white,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

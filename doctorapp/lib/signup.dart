import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/NextScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();

  Future<void> RegisterUser() async {
    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      await FirebaseFirestore.instance
          .collection('RegisterUsers')
          .doc(userCredential.user!.uid)
          .set({
        'contact': contactcontroller.text,
        'email': emailcontroller.text,
        'name': namecontroller.text,
        'uid': userCredential.user!.uid,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextScreenView()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Quick Medical App',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'User Registration Form',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: namecontroller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                label: const Text('Name'),
                hintText: 'E.g: Burhan',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: contactcontroller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                label: const Text('Contact'),
                hintText: 'E.g: 0311-1234567',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailcontroller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                label: const Text('Email'),
                hintText: 'E.g: Burhan.Ali11556688@example.com',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                label: const Text('Password'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmpasswordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                label: const Text('Confirm Password'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                RegisterUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextScreenView(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Already have an Account?'),
            ),
          ],
        ),
      ),
    );
  }
}

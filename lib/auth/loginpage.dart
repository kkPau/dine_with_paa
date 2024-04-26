// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dine_with_paa/auth/signuppage.dart';
import 'package:dine_with_paa/pages/adminpage.dart';
import 'package:dine_with_paa/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailContoller = TextEditingController();
TextEditingController passwordController = TextEditingController();

String role = 'user';

class _LoginPageState extends State<LoginPage> {
  void checkAdminorUser(User user) async {
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'user') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    } else if (role == 'admin') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const AdminPage(),
          ),
          (route) => false);
    }
  }

  void logIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailContoller.text, password: passwordController.text);

      final user = FirebaseAuth.instance.currentUser;

      checkAdminorUser(user!);

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => const HomePage(),
      //     ),
      //     (route) => false);
      emailContoller.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    Widget textspace(
        IconData icon, String label, TextEditingController controller) {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(211, 47, 47, 1))),
            label: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.red[700],
                ),
                SizedBox(width: phoneWidth * 0.03),
                Text(
                  label,
                  style: TextStyle(color: Colors.red[700], fontSize: 14),
                ),
              ],
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      );
    }

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: phoneHeight * 0.1),
              textspace(Icons.email_rounded, "Email", emailContoller),
              SizedBox(height: phoneHeight * 0.01),
              textspace(Icons.lock, "Password", passwordController),
              SizedBox(height: phoneHeight * 0.05),
              InkWell(
                onTap: () => logIn(context),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(
                      horizontal: phoneWidth * 0.2, vertical: 20),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: phoneHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account? "),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    )),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

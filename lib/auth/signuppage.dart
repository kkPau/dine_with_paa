// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dine_with_paa/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

String countrycode = "+233";

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailContoller = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    void signUp() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailContoller.text, password: passwordController.text);

        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user!.uid)
            .set({
          "name": nameController.text,
          "number": phoneController.text,
          "email": user.email,
          "role": "user",
        });

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false);

        nameController.clear();
        phoneController.clear();
        passwordController.clear();
        emailContoller.clear();
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }

    Widget textspace(IconData icon, String label,
        TextEditingController controller, bool obscure) {
      return TextField(
        controller: controller,
        obscureText: obscure,
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
                  "Sign Up",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: phoneHeight * 0.1),
              textspace(Icons.abc, "Name", nameController, false),
              SizedBox(height: phoneHeight * 0.01),
              textspace(Icons.onetwothree_rounded, "Phone number",
                  phoneController, false),
              SizedBox(height: phoneHeight * 0.01),
              textspace(Icons.email_rounded, "Email", emailContoller, false),
              SizedBox(height: phoneHeight * 0.01),
              textspace(Icons.lock, "Password", passwordController, true),
              SizedBox(height: phoneHeight * 0.05),
              InkWell(
                onTap: () {
                  signUp();
                },
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
              )
            ],
          )),
    );
  }
}

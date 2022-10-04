// ignore_for_file: unnecessary_const

import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Forgot Password",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Don’t worry! It happens. Please enter the address"
              "\n associated with your account.",
              style: const TextStyle(fontSize: 14, color: const Color(0xff808080)),
            ),
            const SizedBox(height: 30),
            const Text(
              "Email Address",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff231f20)),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Simranahitaan1997@gmail.com",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  border: OutlineInputBorder()),
            ),
             const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

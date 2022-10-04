// ignore_for_file: unnecessary_const

import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Reset Password", onBackClick: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 24),
            const Text(
              "New Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: const TextStyle(color: const Color(0xff808080)),
                  suffixIcon: const Icon(Icons.visibility),
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Confirm Password",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8,),
            const TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "********",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder()

                
              ),
            ),
            const SizedBox(height: 66),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 elevation: 0,
                 primary: const Color(0xfff26b23),
                 fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
               ),
               onPressed: () {},
               child: const Text(
                 "Submit",
                 style: const TextStyle(fontSize: 18),
               ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

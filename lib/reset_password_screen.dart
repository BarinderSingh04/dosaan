// ignore_for_file: unnecessary_const

import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

import 'screens/creating pdf/creating_pdf_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Reset Password", onBackClick: () {}),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
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
          const SizedBox(
            height: 8,
          ),
          const TextField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "********",
                hintStyle: TextStyle(color: Color(0xff808080)),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 66),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: const Color(0xfff26b23),
                fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 32.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      child: Image.asset(
                                          "assets/images/Certified.png"),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: LoadingWidget(
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      onComplete: () {
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()),
                                                  (route) => false);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24.0),
                              const Text(
                                "Good job!",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Password changed successfully!",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text(
                "Submit",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

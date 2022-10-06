import 'package:dosaan/login_screen.dart';
import 'package:dosaan/my_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Profile", onBackClick: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfileScreen(),
                  ),
                );
              },
              child: const Text(
                "My Profile",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Update your basic account information.",
              style: TextStyle(fontSize: 14, color: Color(0xff808080)),
            ),
            const SizedBox(height: 22),
            const Divider(),
            const SizedBox(height: 22),
            const Text(
              "History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Update & outlook your added surveys",
              style: TextStyle(fontSize: 14, color: Color(0xff808080)),
            ),
            const SizedBox(height: 22),
            const Divider(),
            const SizedBox(height: 22),
            const Text(
              "Terms & Conditions",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23)),
            ),
            const SizedBox(height: 32),
            const Text(
              "Help",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23)),
            ),
            const SizedBox(height: 32),
            const Text(
              "Logout",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfff26b23)),
            )
          ],
        ),
      ),
    );
  }
}

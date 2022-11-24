import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Update Password", onBackClick: () {
        Navigator.of(context).pop();
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 24),
            const Text(
              "Old Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "New Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text(
              "Confirm Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 200),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {},
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

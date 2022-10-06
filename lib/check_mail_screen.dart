import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Forgot Password", onBackClick: () {
         Navigator.of(context).pop();
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Check your mail",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              "We have sent a password recover instructions to"
              "\n your email address",
              style: TextStyle(fontSize: 14, color: Color(0xff808080)),
            ),
            const SizedBox(height: 24),
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 38),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/Group.png")),
            const SizedBox(height: 66),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text(
                  "Open email app",
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
            const SizedBox(height: 36),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Skip, I’ll confirm later",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 178),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Did not receive the email? Check your spam filter,",
                style: TextStyle(color: Color(0xff808080)),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Or try another email address",
                style: TextStyle(color: Color(0xfff26b23)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

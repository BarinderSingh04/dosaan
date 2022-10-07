// ignore_for_file: unnecessary_const

import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Rating", onBackClick: (() {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/rating.png")),
                const SizedBox(height: 14),
                const Text("Mini Excavator",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff26b23),
                ),),
                const SizedBox(height: 8),
                const Text("734TWYRR",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff231f20)
                ),),
                const SizedBox(height: 22),
                const Align(
                  alignment: Alignment.topLeft,
                  child: const Text("Rate your final Survey",
                  style: TextStyle(
                    color: const Color(0xff231f20),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                  hintText: "Add Comment",
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 16),
                const Align(alignment: Alignment.topLeft,
                  child: Text("Add your Signature",
                  style: TextStyle(
                    fontSize: 16,
                      color: Color(0xff231f20),
                      fontWeight: FontWeight.bold
                  ),),
                )
          ],
        ),
      ),
    );
  }
}

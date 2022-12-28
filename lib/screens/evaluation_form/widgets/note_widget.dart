import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String text;
  const NoteWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        children: [
          const TextSpan(
            text: "Note: ",
            style: TextStyle(
              fontFamily: "ProductSans",
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text,
            style: const TextStyle(
              fontFamily: "ProductSans",
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

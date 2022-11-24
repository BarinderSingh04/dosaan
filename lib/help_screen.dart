import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Help",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffd7dae0)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Chat with Us",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "For a better experience, chat from your registered number",
                    style: TextStyle(fontSize: 14, color: Color(0xff808080)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints.tight(const Size.fromHeight(95)),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffd7dae0),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Call Now",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "For a better experience, call from your registered number",
                    style: TextStyle(fontSize: 14, color: Color(0xff808080)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints.tight(const Size.fromHeight(95)),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffd7dae0),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Write to Us",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Average response time 24-48 Hrs",
                    style: TextStyle(fontSize: 14, color: Color(0xff808080)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

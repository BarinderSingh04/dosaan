import 'package:dosaan/login_screen.dart';
import 'package:dosaan/rating_screen.dart';
import 'package:dosaan/screens/pre_form/first_page.dart';
import 'package:dosaan/screens/pre_form/second_page.dart';
import 'package:dosaan/screens/pre_form/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';

class PreWorkScreen extends StatefulWidget {
  const PreWorkScreen({Key? key}) : super(key: key);

  @override
  State<PreWorkScreen> createState() => _PreWorkScreenState();
}

class _PreWorkScreenState extends State<PreWorkScreen> {
  int selectedIndex = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Pre-work",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            StepperWidget(
              index: selectedIndex,
              onStepperTap: (page) {
                controller.animateToPage(page,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut);
              },
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (index) => setState(() => selectedIndex = index),
                children: const [
                  FirstPage(),
                  SecondPage(),
                  FirstPage(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {
                  if (selectedIndex == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RatingScreen(),
                      ),
                    );
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

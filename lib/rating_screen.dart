// ignore_for_file: unnecessary_const

import 'package:dosaan/data_summary_screen.dart';
import 'package:dosaan/login_screen.dart';
import 'package:dosaan/screens/pre_form/widgets/first_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

import 'screens/creating pdf/creating_pdf_screen.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Rating",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/rating.png"),
            ),
            const SizedBox(height: 14),
            Column(
              children: const [
                Text(
                  "Mini Excavator",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff26b23),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "734TWYRR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff231f20)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const FirstStepWidget(
              title: "Rate your final Survey",
              isBlackTheme: true,
            ),
            const SizedBox(height: 30),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Add Comment",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add your Signature",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    control.clear();
                  },
                  child: Text(
                    "Clear".toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SignatureWidget(
              control: control,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.info,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8.0),
                const Text(
                  "Your rating will be sent to our database servers",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xff808080),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xfff26b23),
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
                              horizontal: 44.0,
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
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DataSummaryScreen(
                                                  isHistory: false,
                                                ),
                                              ),
                                            );
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
                                  "Rating Sent Successfully",
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

class SignatureWidget extends StatelessWidget {
  final HandSignatureControl control;
  const SignatureWidget({
    Key? key,
    required this.control,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(height: 160),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffd7dae0)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: HandSignature(
        width: 1,
        control: control,
      ),
    );
  }
}

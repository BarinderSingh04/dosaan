import 'package:dosaan/config/config.dart';
import 'package:dosaan/screens/evaluation_form/evaluation_screen.dart';
import 'package:dosaan/screens/evaluation_form/widgets/toggle_form_field.dart';
import 'package:dosaan/screens/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../login_screen.dart';

class PreWorkScreen extends StatelessWidget {
  const PreWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Pre-Work",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              children: [
                Wrap(
                  runSpacing: 16.0,
                  children: Config.prework
                      .map((e) => ToggleFormField(title: e, context: context))
                      .toList(),
                ),
              ],
            ),
          ),
          SafeArea(
            bottom: true,
            child: Align(
              alignment: Alignment.center,
              child: PrimaryButton(
                title: "Next",
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EvaluationScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

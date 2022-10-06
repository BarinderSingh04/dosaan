import 'package:dosaan/screens/pre_form/widgets/first_step_widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => const FirstStepWidget(),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
    );
  }
}

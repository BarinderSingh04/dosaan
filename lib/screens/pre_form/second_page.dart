import 'package:dosaan/screens/pre_form/widgets/second_step_widget.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => const SecondStepWidget(),
      separatorBuilder: (context, index) => const Divider(
        thickness: 5.0,
        height: 24,
        color: Color(0xfff8f9fd),
      ),
    );
  }
}

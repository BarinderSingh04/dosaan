import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const PrimaryButton({
    super.key,
    required this.onClick,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xfff26b23),
        fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
      ),
      onPressed: onClick,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../config/config.dart';

class SecondStepWidget extends StatefulWidget {
  const SecondStepWidget({Key? key}) : super(key: key);

  @override
  State<SecondStepWidget> createState() => _SecondStepWidgetState();
}

class _SecondStepWidgetState extends State<SecondStepWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do you find yourself struggling more?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(height: 18.0),
          Wrap(
            runSpacing: 14.0,
            children: List.generate(Config.step2Options.length, (index) {
              final option = Config.step2Options[index];
              return Step2Item(
                isSelected: selectedIndex == index,
                onClick: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                text: option,
              );
            }),
          )
        ],
      ),
    );
  }
}

class Step2Item extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onClick;
  final String text;
  const Step2Item(
      {Key? key,
      required this.isSelected,
      required this.onClick,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Row(
          key: ValueKey<bool>(isSelected),
          children: [
            Image.asset(
              isSelected
                  ? "assets/images/checkbox_s.png"
                  : "assets/images/checkbox.png",
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: isSelected
                    ? Theme.of(context).primaryColorDark
                    : const Color(0xff808080),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../config/config.dart';

class FirstStepWidget extends StatefulWidget {
  const FirstStepWidget({Key? key}) : super(key: key);

  @override
  State<FirstStepWidget> createState() => _FirstStepWidgetState();
}

class _FirstStepWidgetState extends State<FirstStepWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
          const SizedBox(height: 12.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xfff8f9fd),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                Config.preWorkOptions.length,
                (index) {
                  final workOption = Config.preWorkOptions[index];
                  return PreItem(
                    text: workOption,
                    isSelected: index == selectedIndex,
                    onClick: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PreItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onClick;
  const PreItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : const Color(0xffd7dae0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).primaryColorDark
                : const Color(0xff808080),
          ),
        ),
      ),
    );
  }
}

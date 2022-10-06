import 'package:dosaan/config/config.dart';
import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class PreWorkScreen extends StatefulWidget {
  const PreWorkScreen({Key? key}) : super(key: key);

  @override
  State<PreWorkScreen> createState() => _PreWorkScreenState();
}

class _PreWorkScreenState extends State<PreWorkScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Pre-work",
        onBackClick: () {},
      ),
      body: Column(children: [
        const SizedBox(height: 16.0),
      ]),
    );
  }
}

class StepperWidget extends StatelessWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Timeline.tileBuilder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      theme: TimelineThemeData(
        direction: Axis.horizontal,
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: 3,
        contentsAlign: ContentsAlign.basic,
        connectionDirection: ConnectionDirection.after,
        connectorBuilder: (context, index, connectorType) {
          return SolidLineConnector(
            color: index < 1
                ? Theme.of(context).primaryColor
                : const Color(0xfff8f9fd),
            thickness: 1.5,
          );
        },
        indicatorBuilder: (context, index) {
          return Column(
            children: [
              if (index < 2)
                OutlinedDotIndicator(
                  borderWidth: 1,
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                  size: 44,
                  child: Center(
                    child: Text(
                      "0${++index}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              else
                DotIndicator(
                  color: const Color(0xfff8f9fd),
                  size: 44,
                  child: Center(
                    child: Text(
                      "0${++index}",
                      style: const TextStyle(
                        color: Color(0xff808080),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 4.0),
              Text(
                "Step $index",
                style: TextStyle(
                  color: index < 3
                      ? Theme.of(context).primaryColor
                      : const Color(0xff808080),
                  fontSize: 11,
                ),
              ),
            ],
          );
        },
        contentsBuilder: (context, index) {
          return Step2Widget();
        },
      ),
    ));
  }
}

class PreWidget extends StatefulWidget {
  const PreWidget({Key? key}) : super(key: key);

  @override
  State<PreWidget> createState() => _PreWidgetState();
}

class _PreWidgetState extends State<PreWidget> {
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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

class Step2Widget extends StatefulWidget {
  const Step2Widget({Key? key}) : super(key: key);

  @override
  State<Step2Widget> createState() => _Step2WidgetState();
}

class _Step2WidgetState extends State<Step2Widget> {
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
            const SizedBox(width: 14.0),
            Text(
              text,
              style: TextStyle(
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

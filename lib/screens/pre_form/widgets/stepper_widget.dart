import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  final int index;
  final void Function(int index) onStepperTap;
  const StepperWidget(
      {Key? key, required this.index, required this.onStepperTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  StepWidget(
                    step: 1,
                    isEnable: index >= 0,
                    onClick: () {
                      onStepperTap(0);
                    },
                  ),
                  Expanded(
                    child: DividerWidget(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                      color: index >= 1
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(255, 231, 231, 231),
                    ),
                  ),
                  StepWidget(
                    step: 2,
                    isEnable: index >= 1,
                    onClick: () {
                      onStepperTap(1);
                    },
                  ),
                  Expanded(
                    child: DividerWidget(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                      color: index >= 2
                          ? Theme.of(context).primaryColor
                          : const Color.fromARGB(255, 231, 231, 231),
                    ),
                  ),
                  StepWidget(
                    step: 3,
                    isEnable: index >= 2,
                    onClick: () => onStepperTap(2),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (i) {
                      int step = i;
                      return Text(
                        "Step ${++step}",
                        style: TextStyle(
                          color: i <= index
                              ? Theme.of(context).primaryColor
                              : const Color(0xff808080),
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  final int step;
  final VoidCallback? onClick;
  final bool isEnable;

  const StepWidget({
    Key? key,
    required this.step,
    required this.isEnable,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isEnable ? null : const Color(0xfff8f9fd),
              border: isEnable
                  ? Border.all(
                      width: 1.2,
                      color: Theme.of(context).primaryColor,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                "0$step",
                style: TextStyle(
                  color: isEnable
                      ? Theme.of(context).primaryColorDark
                      : const Color(0xff808080),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  final double thickness;
  final Color color;
  final double indent;
  final double endIndent;

  const DividerWidget(
      {Key? key,
      required this.thickness,
      required this.color,
      required this.indent,
      required this.endIndent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 0.0,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: color, width: thickness),
        ),
      ),
    );
  }
}

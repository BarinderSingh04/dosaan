import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';

class FirstStepWidget extends StatefulWidget {
  final String? title;
  final bool isBlackTheme;
  const FirstStepWidget({
    Key? key,
    this.title,
    this.isBlackTheme = false,
  }) : super(key: key);

  @override
  State<FirstStepWidget> createState() => _FirstStepWidgetState();
}

class _FirstStepWidgetState extends State<FirstStepWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? "Do you find yourself struggling more?",
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
            color: widget.isBlackTheme
                ? const Color(0xff131313)
                : const Color(0xfff8f9fd),
            borderRadius: widget.isBlackTheme
                ? BorderRadius.circular(7.0)
                : BorderRadius.circular(2.0),
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
                  isBlackTheme: widget.isBlackTheme,
                  isSelected: index == selectedIndex,
                  onClick: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (!widget.isBlackTheme) {
                      if (index == 2 || index == 3) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context)
                                  .viewInsets
                                  .copyWith(left: 24.0, right: 24.0),
                              child: Wrap(
                                runSpacing: 16.0,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 80,
                                      height: 6,
                                      margin: const EdgeInsets.only(top: 24.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd6ddde),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32.0),
                                  Text(
                                    "Add Comment",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  const TextField(
                                    maxLines: 2,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      hintText: "Type here….",
                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox.fromSize(
                                    size: const Size.fromHeight(200),
                                    child: DottedBorder(
                                      color: const Color(0xff808080),
                                      strokeWidth: 1,
                                      dashPattern: const [6, 6],
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(12),
                                      strokeCap: StrokeCap.round,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.photo_camera,
                                              color: Color(0xfff26b23),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Take a Picture",
                                              style: TextStyle(
                                                  color: Color(0xff808080)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SafeArea(
                                    bottom: true,
                                    top: false,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 16.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0, backgroundColor: const Color(0xfff26b23),
                                            fixedSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                50),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "Next",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class PreItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isBlackTheme;
  final VoidCallback onClick;
  const PreItem(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onClick,
      this.isBlackTheme = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: isSelected
              ? isBlackTheme
                  ? const Color(0xff131313)
                  : Colors.white
              : Colors.white,
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
                ? isBlackTheme
                    ? Colors.white
                    : Theme.of(context).primaryColorDark
                : const Color(0xff808080),
          ),
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
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

                      if (index == 2 || index == 3) {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          builder: (context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(height: 24.0),
                                  Text(
                                    "Add Comment",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
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
                                            SizedBox(height: 4),
                                            Text(
                                              "Size 1.84kb",
                                              style: TextStyle(
                                                  color: Color(0xff808080)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      
                                        hintText: "Add Comment",
                                        hintStyle:
                                            const TextStyle(color: Color(0xff808080)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5)
                                        )),
                                  ),
                                  const SizedBox(height: 36),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: const Color(0xfff26b23),
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width /
                                                2,
                                            50),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
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

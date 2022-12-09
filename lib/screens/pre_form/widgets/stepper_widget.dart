import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  final int selectedIndex;
  final int itemCount;
  final PageController controller;
  final Map<String, dynamic> titleMap;
  final void Function(int selectedIndex) onStepperTap;

  const StepperWidget({
    Key? key,
    required this.selectedIndex,
    required this.onStepperTap,
    required this.controller,
    required this.itemCount,
    required this.titleMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: PageView.builder(
            padEnds: false,
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              overscroll: true,
            ),
            controller: controller,
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isEnable = index <= selectedIndex;
              final isRouteEnable = selectedIndex > index;
              int step = index;
              return InkWell(
                onTap: () {
                  onStepperTap(index);
                },
                child: Row(
                  children: [
                    StepWidget(
                      step: ++step,
                      isEnable: isEnable,
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        titleMap.keys.elementAt(index),
                        style: TextStyle(
                          fontSize: 14,
                          color: isEnable
                              ? Theme.of(context).primaryColor
                              : const Color(0xff808080),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if ((index + 1) != itemCount)
                      Expanded(
                        child: DividerWidget(
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                          color: isRouteEnable
                              ? Theme.of(context).primaryColor
                              : const Color.fromARGB(255, 231, 231, 231),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final int step;
  final bool isEnable;

  const StepWidget({
    Key? key,
    required this.step,
    required this.isEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
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
        // Text(
        //   "Step $step",
        //   style: TextStyle(
        //     color: isEnable
        //         ? Theme.of(context).primaryColor
        //         : const Color(0xff808080),
        //     fontSize: 12,
        //   ),
        // ),
      ],
    );
  }
}

class DividerWidget extends StatelessWidget {
  final double thickness;
  final Color color;
  final double indent;
  final double endIndent;

  const DividerWidget({
    Key? key,
    required this.thickness,
    required this.color,
    required this.indent,
    required this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 50,
      height: thickness,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: color, width: thickness),
        ),
      ),
    );
  }
}

// Padding(
//                         padding: const EdgeInsets.only(bottom: 16.0),
//                         child: Text(
//                           titleMap.keys.elementAt(index),
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: isEnable
//                                 ? Theme.of(context).primaryColor
//                                 : const Color(0xff808080),
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),

//  return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: 80,
//         child: ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           itemCount: itemCount,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             int step = index;
//             final isEnable = index <= selectedIndex;
//             return StepWidget(
//               step: ++step,
//               isEnable: isEnable,
//               onClick: () {
//                 onStepperTap(index);
//               },
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             final isEnable = selectedIndex > index;
//             return Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: DividerWidget(
//                   lenght: itemCount,
//                   thickness: 2,
//                   indent: 10,
//                   endIndent: 10,
//                   color: isEnable
//                       ? Theme.of(context).primaryColor
//                       : const Color.fromARGB(255, 231, 231, 231),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
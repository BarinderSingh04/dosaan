import 'package:cached_network_image/cached_network_image.dart';
import 'package:dosaan/home_screen.dart';
import 'package:dosaan/login_screen.dart';
import 'package:dosaan/models/machine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../remarketing_evaluation.dart';

class MachineTypeScreen extends ConsumerStatefulWidget {
  const MachineTypeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MachineTypeScreen> createState() => _MachineTypeScreenState();
}

class _MachineTypeScreenState extends ConsumerState<MachineTypeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final machineListState = ref.watch(machineListProvider);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(
        appBar: AppbarWidget(
          title: "Machine type",
          onBackClick: () {
            Navigator.of(context).pop();
          },
        ),
        persistentFooterButtons: [
          Center(
            child: Container(
              color: Colors.white,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xfff26b23),
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                ),
                onPressed: () {
                  final machines = machineListState.asData?.value ?? [];
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RemarketingEvaluation(
                        machine: machines[selectedIndex],
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
              child: Row(
                children: const [
                  Text(
                    "6 Total types",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffe3e3e3),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: machineListState.when(
                  data: (data) {
                    return GridView.builder(
                      itemCount: data.length,
                      padding: const EdgeInsets.only(bottom: 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        final machineType = data[index];
                        return LayoutBuilder(builder: (context, constraints) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: MachineTypeItem(
                              constraints: constraints,
                              isSelected: selectedIndex == index,
                              machineType: machineType,
                            ),
                          );
                        });
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MachineTypeItem extends StatelessWidget {
  final bool isSelected;
  final BoxConstraints constraints;
  final Machine machineType;

  const MachineTypeItem(
      {Key? key,
      this.isSelected = true,
      required this.constraints,
      required this.machineType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Column(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.black,
                        border: isSelected
                            ? Border.all(
                                width: 2.0,
                                color: Theme.of(context).primaryColor,
                              )
                            : null,
                      ),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: machineType.image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    machineType.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 250),
            scale: isSelected ? 1.0 : 0,
            child: Image.asset("assets/images/tick-circle.png"),
          ),
        ),
      ],
    );
  }
}

import 'package:dosaan/home_screen.dart';
import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class MachineTypeScreen extends StatefulWidget {
  const MachineTypeScreen({Key? key}) : super(key: key);

  @override
  State<MachineTypeScreen> createState() => _MachineTypeScreenState();
}

class _MachineTypeScreenState extends State<MachineTypeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Machine type",
        onBackClick: () {},
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  return const MachineItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

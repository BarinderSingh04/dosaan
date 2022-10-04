import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class DataSummaryScreen extends StatelessWidget {
  const DataSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Data Summary", onBackClick: (() {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mini Excavator",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xfff26b23)),
                ),
                Row(
                  children: const [
                    Text(
                      "Download Invoice",
                      style: TextStyle(color: Color(0xff808080), fontSize: 12),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.download),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "734TWYRR",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff231f20)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Date",
                  style: TextStyle(color: Color(0xff808080)),
                ),
                Text(
                  "07/18/2020",
                  style: TextStyle(color: Color(0xff269f75)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Miles",
                  style: TextStyle(color: Color(0xff808080)),
                ),
                Text(
                  "342 km",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Model Year",
                  style: TextStyle(color: Color(0xff808080)),
                ),
                Text(
                  "2018",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              "No. of attachments",
              style: TextStyle(color: Color(0xff808080)),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset("assets/images/mask_group.png"),
                const SizedBox(width: 8),
                Image.asset("assets/images/maskone.png"),
                const SizedBox(width: 8),
                Image.asset("assets/images/mask_group.png"),
              ],
            ),
            const SizedBox(height: 21),
            const Divider(),
            const SizedBox(height: 21),
            const Text("Do you find yourself struggling more?"),
            const SizedBox(height: 8),
            const Text(
              "Not really",
              style: TextStyle(
                  color: Color(0xfff26b23), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            const Text("Lorem Ipsum is simply dummy text of the printing ?"),
            const SizedBox(height: 8),
            const Text(
              "Not really",
              style: TextStyle(
                  color: Color(0xfff26b23), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            const Text("Do you find yourself struggling more?"),
            const SizedBox(height: 8),
            const Text(
              "Not really",
              style: TextStyle(
                  color: Color(0xfff26b23), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            const Text("Lorem Ipsum is simply dummy text of the printing ?"),
            const SizedBox(height: 8),
            const Text(
              "Not really",
              style: TextStyle(
                  color: Color(0xfff26b23), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            const Text("Do you find yourself struggling more?"),
            const SizedBox(height: 8),
            const Text(
              "Not really",
              style: TextStyle(
                  color: Color(0xfff26b23), fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50)),
                child: const Text(
                  "Edit Survey",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

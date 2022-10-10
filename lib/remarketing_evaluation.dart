import 'package:dosaan/login_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RemarketingEvaluation extends StatelessWidget {
  const RemarketingEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppbarWidget(title: "Remarketing Evaluation", onBackClick: (() {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "07/18/2020",
                      style: TextStyle(color: Color(0xff269f75), fontSize: 20),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Filter by",
                          style:
                              TextStyle(color: Color(0xff808080), fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Image.asset("assets/images/remarket.png")
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Model",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff231f20),
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "734TWYRR",
                      hintStyle: TextStyle(color: Color(0xff808080)),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                const Text("Serial number",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "HGS94877400",
                      hintStyle: TextStyle(color: Color(0xff808080)),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                const Text("Hours",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "342",
                      hintStyle: TextStyle(color: Color(0xff808080)),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                const Text("Year",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff231f20),
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "2018",
                      hintStyle: TextStyle(color: Color(0xff808080)),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                const Text(
                  "No. of attachments",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16.0),
                SizedBox.fromSize(
                  size: const Size.fromHeight(160),
                  child: DottedBorder(
                    color: const Color(0xff808080),
                    strokeWidth: 1,
                    dashPattern: const [6, 6],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(5),
                    strokeCap: StrokeCap.round,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.photo_camera,
                            color: Color(0xfff26b23),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Take a Picture",
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Size 1.84kb",
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffd7dae0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Attachments0012",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff231f20),
                                fontSize: 16),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Size 1.84kb",
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                          Icon(Icons.cancel)
                        ],
                      ),
                      const SizedBox(height: 10),
                      const LinearProgressIndicator(
                        minHeight: 3,
                        backgroundColor: Color(0xfff0f0f0),
                        color: Color(0xfff26b23),
                        value: 0.4,
                      ),
                      const Text("40%")
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffd7dae0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Attachments0013",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff231f20),
                                fontSize: 16),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Size 1.84kb",
                            style: TextStyle(color: Color(0xff808080)),
                          ),
                          Icon(Icons.cancel)
                        ],
                      ),
                      const SizedBox(height: 10),
                      const LinearProgressIndicator(
                        minHeight: 3,
                        backgroundColor: Color(0xfff0f0f0),
                        color: Color(0xfff26b23),
                        value: 0.4,
                      ),
                      const Text("60%")
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  "Add Speciality text",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                      hintText: "Type here….",
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 29),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: const Color(0xfff26b23),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 2, 50),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

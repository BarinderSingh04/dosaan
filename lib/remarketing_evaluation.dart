import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RemarketingEvaluation extends StatelessWidget {
  const RemarketingEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppbarWidget(title: "Remarketing Evaluation", onBackClick: (() {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "07/18/2020",
                  style: TextStyle(color: Color(0xff269f75), fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      "Filter by",
                      style: TextStyle(color: Color(0xff808080), fontSize: 14),
                    ),
                    SizedBox(width: 16),
                    Image.asset("assets/images/remarket.png")
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Model",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff231f20),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                  hintText: "734TWYRR",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text("Serial number",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                  hintText: "HGS94877400",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text("Hours",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                  hintText: "342",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text("Year",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                  hintText: "2018",
                  hintStyle: TextStyle(color: Color(0xff808080)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            Text("No. of attachments",
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),),
            
          ],
        ),
      ),
    );
  }
}

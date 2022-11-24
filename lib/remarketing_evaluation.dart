import 'package:dosaan/config/config.dart';
import 'package:dosaan/login_screen.dart';
import 'package:dosaan/screens/pre_form/pre_work_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'screens/filter/filter_screen.dart';

class RemarketingEvaluation extends StatefulWidget {
  const RemarketingEvaluation({Key? key}) : super(key: key);

  @override
  State<RemarketingEvaluation> createState() => _RemarketingEvaluationState();
}

class _RemarketingEvaluationState extends State<RemarketingEvaluation> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Remarketing Evaluation",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat("MM/dd/yyyy").format(_selectedDate),
                    style: const TextStyle(
                      color: Color(0xff269f75),
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Filter by",
                        style:
                            TextStyle(color: Color(0xff808080), fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        iconSize: 30,
                        icon: Image.asset(
                          "assets/images/remarket.png",
                          fit: BoxFit.cover,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => FilterScreen(
                                selectedDay: DateTime.now(),
                              ),
                            ),
                          ).then((value) {
                            setState(() {
                              _selectedDate = value ?? DateTime.now();
                            });
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Model",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff231f20),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              dropDownWidget(Config.models, "734TWYRR"),
              const SizedBox(height: 16),
              const Text("Serial number",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff231f20),
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              dropDownWidget(Config.serialNumber, "HGS94877400"),
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
              const Text(
                "Year",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff231f20),
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox.fromSize(
                size: const Size.fromHeight(160),
                child: DottedBorder(
                  color: const Color(0xff808080),
                  strokeWidth: 1,
                  dashPattern: const [8, 8],
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
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const UploadWidget(
                fileName: "Attachments01",
                progress: 0.4,
              ),
              const SizedBox(height: 16),
              const UploadWidget(
                fileName: "Attachments02",
                progress: 0.3,
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
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 29),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PreWorkScreen(),
                      ),
                    );
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
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDownWidget(List<String> list, String hint) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(hintText: hint),
      items: list
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (_) {},
    );
  }
}

class UploadWidget extends StatelessWidget {
  final String fileName;
  final double progress;

  const UploadWidget({
    Key? key,
    required this.fileName,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xffd7dae0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      fileName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff231f20),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Size 1.84kb",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  minHeight: 3,
                  backgroundColor: const Color(0xfff0f0f0),
                  color: const Color(0xfff26b23),
                  value: progress,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24.0),
          Column(
            children: [
              const Icon(Icons.cancel),
              const SizedBox(height: 10.0),
              Text("${progress * 100}%"),
            ],
          )
        ],
      ),
    );
  }
}

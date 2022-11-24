import 'package:dosaan/login_screen.dart';
import 'package:dosaan/screens/creating%20pdf/creating_pdf_screen.dart';
import 'package:flutter/material.dart';

class DataSummaryScreen extends StatelessWidget {
  final bool isHistory;
  const DataSummaryScreen({Key? key, required this.isHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
          title: "Data Summary",
          onBackClick: () {
            Navigator.of(context).pop();
          }),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        children: [
          Column(
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
                    children: [
                      const Text(
                        "Download Invoice",
                        style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreatingPdfScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/images/document-download.png",
                        ),
                      ),
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
              const AttachmentWidget(),
              const SizedBox(height: 21),
              const Divider(),
              const SizedBox(height: 21),
              Wrap(
                runSpacing: 18.0,
                children: List.generate(
                  5,
                  (index) => QuestionWidget(
                    question: index % 2 == 0
                        ? "Do you find yourself struggling more?"
                        : "Lorem Ipsum is simply dummy text of the printing?",
                    answer: "Not really",
                  ),
                ),
              ),
              const Divider(
                height: 44,
              ),
              Wrap(
                runSpacing: 18.0,
                children: List.generate(
                  5,
                  (index) => QuestionWidget(
                    question: index % 2 == 0
                        ? "Do you find yourself struggling more?"
                        : "Lorem Ipsum is simply dummy text of the printing?",
                    answer: "Yes",
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const AttachmentWidget(),
              const SizedBox(height: 24),
              const CommentSection(),
              const SizedBox(height: 24),
              if(isHistory)
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: const Color(0xfff26b23),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 2, 50)),
                  child: const Text(
                    "Edit Survey",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Comments",
          style: TextStyle(color: Color(0xff808080)),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "It is a long established fact that a reader will be distracted"
          "by the readable content of a page when looking at its layout.",
        )
      ],
    );
  }
}

class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "No. of attachments",
          style: TextStyle(color: Color(0xff808080)),
        ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 10.0,
          children: [
            Image.asset("assets/images/mask_group.png"),
            Image.asset("assets/images/maskone.png"),
            Image.asset("assets/images/mask_group.png"),
          ],
        ),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final String answer;
  const QuestionWidget({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        const SizedBox(height: 8),
        Text(
          answer,
          style: const TextStyle(
            color: Color(0xfff26b23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

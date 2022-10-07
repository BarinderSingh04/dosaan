// ignore_for_file: unnecessary_const

import 'package:dosaan/login_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "History", onBackClick: (() {})),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "3 Total Surveys",
                  style: TextStyle(
                    color: Color(0xff231f20),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      "assets/images/setting.png",
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 18),
            const HistoryItem(
              name: "Mini Excavator",
              date: "18/07/2020",
              model: "734TWYRR",
              miles: "342 km",
              year: "2018",
            ),
            const SizedBox(height: 14),
            const HistoryItem(
              name: "Mini Excavator",
              date: "18/07/2020",
              model: "734TWYRR",
              miles: "342 km",
              year: "2018",
            ),
            const SizedBox(height: 14),
            const HistoryItem(
              name: "Mini Excavator",
              date: "18/07/2020",
              model: "734TWYRR",
              miles: "342 km",
              year: "2018",
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String name;
  final String date;
  final String model;
  final String miles;
  final String year;

  const HistoryItem({
    Key? key,
    required this.name,
    required this.date,
    required this.model,
    required this.miles,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xffd7dae0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xfff26b23),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff269f75),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            model,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff231f20),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Miles",
                style: const TextStyle(color: const Color(0xff808080)),
              ),
              Text(
                miles,
                style: const TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Model Year",
                style: const TextStyle(color: Color(0xff808080)),
              ),
              Text(
                year,
                style: const TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}

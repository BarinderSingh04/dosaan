import 'package:dosaan/remarketing_evaluation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doosan',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "ProductSans",
        primaryColor: const Color(0xfff26b23),
        primaryColorDark: const Color(0xff231f20),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xff808080)),
          suffixIconColor: Colors.black,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
              width: 2,
            ),
          ),
        ),
      ),
      home: const RemarketingEvaluation(),
    );
  }
}

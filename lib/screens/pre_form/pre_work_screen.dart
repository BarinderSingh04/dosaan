import 'dart:convert';

import 'package:dosaan/login_screen.dart';
import 'package:dosaan/rating_screen.dart';
import 'package:dosaan/screens/pre_form/question_page.dart';
import 'package:dosaan/screens/pre_form/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionsProvider = FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  String data = await rootBundle.loadString("assets/json/questionare.json");
  final jsonResult = jsonDecode(data);
  return jsonResult["questions"];
});

class PreWorkScreen extends ConsumerStatefulWidget {
  const PreWorkScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PreWorkScreen> createState() => _PreWorkScreenState();
}

class _PreWorkScreenState extends ConsumerState<PreWorkScreen> {
  int selectedIndex = 0;
  double scrollOffset = 0.0;
  final controller = PageController();
  final stepperController = PageController(viewportFraction: 0.5);
  final List<GlobalKey<FormState>> formKeys = [];

  @override
  Widget build(BuildContext context) {
    final questionListState = ref.watch(questionsProvider);
    ref.listen<AsyncValue<Map<String, dynamic>>>(questionsProvider,
        (previous, next) {
      next.maybeMap(
        data: (data) {
          for (var i = 0; i < data.value.keys.length; i++) {
            formKeys.add(GlobalKey<FormState>());
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppbarWidget(
        title: "Pre-work",
        onBackClick: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: questionListState.when(data: (Map<String, dynamic> data) {
          return Column(
            children: [
              StepperWidget(
                itemCount: data.length,
                titleMap: data,
                selectedIndex: selectedIndex,
                controller: stepperController,
                onStepperTap: (page) {
                  controller.animateToPage(page,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                  stepperController.animateToPage(page,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
              ),
              Expanded(
                child: PageView.builder(
                  pageSnapping: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (index) =>
                      setState(() => selectedIndex = index),
                  itemBuilder: (context, index) {
                    return QuestionPage(
                      formKey: formKeys[index],
                      questions: data.values.elementAt(index),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  ),
                  onPressed: () {
                    if (formKeys[selectedIndex].currentState!.validate()) {
                      if (selectedIndex == (data.length - 1)) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RatingScreen(),
                          ),
                        );
                      }
                      controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                      stepperController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          );
        }, error: (error, _) {
          return Column(
            children: [
              const Icon(Icons.error),
              Text(error.toString()),
            ],
          );
        }, loading: () {
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}

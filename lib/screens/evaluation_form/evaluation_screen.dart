import 'dart:convert';

import 'package:dosaan/login_screen.dart';
import 'package:dosaan/rating_screen.dart';
import 'package:dosaan/screens/evaluation_form/form_notifier.dart';
import 'package:dosaan/screens/evaluation_form/question_page.dart';
import 'package:dosaan/screens/evaluation_form/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionsProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  String data = await rootBundle.loadString("assets/json/questionare.json");
  final jsonResult = jsonDecode(data);
  return jsonResult["questions"];
});

class EvaluationScreen extends ConsumerStatefulWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends ConsumerState<EvaluationScreen> {
  int selectedIndex = 0;
  double scrollOffset = 0.0;
  final controller = PageController();
  final stepperController = PageController(viewportFraction: 0.6);
  final List<GlobalKey<FormState>> formKeys = [];

  @override
  void initState() {
    super.initState();
    ref.read(surveyListProvider);
  }

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
        title: "Evaluation",
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
                padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Row(
                  children: [
                    if (selectedIndex != 0)
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width / 2, 56),
                            foregroundColor: const Color(0xfff26b23),
                          ),
                          onPressed: () {
                            controller.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                            stepperController.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                          child: const Text(
                            "Previous",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    if (selectedIndex != 0) const SizedBox(width: 16.0),
                    Expanded(
                      child: Align(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(14.0),
                            elevation: 0,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width / 2, 56),
                            backgroundColor: const Color(0xfff26b23),
                          ),
                          onPressed: () {
                            if (formKeys[selectedIndex]
                                .currentState!
                                .validate()) {
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
                      ),
                    ),
                  ],
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

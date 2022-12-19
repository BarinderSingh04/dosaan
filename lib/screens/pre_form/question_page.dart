import 'package:dosaan/screens/pre_form/widgets/input_form_widget.dart';
import 'package:dosaan/screens/pre_form/widgets/note_widget.dart';
import 'package:dosaan/screens/pre_form/widgets/selection_form_field.dart';
import 'package:dosaan/screens/pre_form/widgets/second_step_widget.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final List<dynamic> questions;
  final GlobalKey<FormState>? formKey;
  const QuestionPage({Key? key, required this.questions, this.formKey})
      : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Wrap(
            runSpacing: 16.0,
            children: List.generate(
              widget.questions.length,
              (index) {
                final questionMap = widget.questions[index];
                if (questionMap["type"] == 1) {
                  return SelectionFormField(
                    title: questionMap["question"],
                    context: context,
                    isBlackTheme: false,
                    validator: (value) {
                      if (value == null) {
                        return "Required";
                      }
                      return null;
                    },
                  );
                } else if (questionMap["type"] == 3) {
                  final questions = questionMap["questions"];
                  return Wrap(
                    runSpacing: 16.0,
                    children: [
                      Text(
                        questionMap["heading"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const Divider(height: 0),
                      ...questionWidget(questions),
                      const Divider(height: 0),
                    ],
                  );
                } else if (questionMap["type"] == 4) {
                  return InputFormField(
                    context: context,
                    leading: questionMap["leading"],
                    trailing: questionMap["trailing"],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                  );
                } else if (questionMap["type"] == 5) {
                  return NoteWidget(text: questionMap["note"]);
                } else {
                  return ToggleFormField(
                    context: context,
                    title: questionMap["question"],
                    validator: (value) {
                      if (value == null) {
                        return "Please select a value first";
                      }
                      return null;
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> questionWidget(List<dynamic> questions) {
    return questions.map<Widget>((e) {
      if (e["type"] == 1) {
        return SelectionFormField(
          title: e["question"],
          context: context,
          isBlackTheme: false,
          validator: (value) {
            if (value == null) {
              return "Required";
            }
            return null;
          },
        );
      } else {
        return ToggleFormField(
          context: context,
          title: e["question"],
          validator: (value) {
            if (value == null) {
              return "Please select a value first";
            }
            return null;
          },
        );
      }
    }).toList();
  }

  @override
  bool get wantKeepAlive => true;
}

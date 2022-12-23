import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/config.dart';
import '../../../remarketing_evaluation.dart';

class SelectionFormField extends FormField<QuestionState> {
  final BuildContext context;
  final bool isBlackTheme;
  final String title;
  final EdgeInsets? padding;

  SelectionFormField({
    super.key,
    required this.title,
    required this.context,
    required this.isBlackTheme,
    this.padding,
    FormFieldSetter<QuestionState>? onSaved,
    FormFieldValidator<QuestionState>? validator,
    QuestionState? initialValue,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<QuestionState?> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    if (state.hasError)
                      Text(
                        "Required",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: padding ?? const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: state.hasError
                        ? Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 0.5,
                          )
                        : null,
                    color: isBlackTheme
                        ? const Color(0xff131313)
                        : const Color(0xfff8f9fd),
                    borderRadius: isBlackTheme
                        ? BorderRadius.circular(7.0)
                        : BorderRadius.circular(2.0),
                  ),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      Config.preWorkOptions.length,
                      (index) {
                        final workOption = Config.preWorkOptions[index];
                        return PreItem(
                          text: workOption,
                          isBlackTheme: isBlackTheme,
                          isSelected: state.value?.optionSelected == index,
                          onClick: () async {
                            if (index > 1) {
                              final QuestionState? qState =
                                  await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24.0),
                                  ),
                                ),
                                builder: (context) {
                                  return BottomSheet(
                                    questionState: state.value,
                                    selectedOption: index,
                                  );
                                },
                              );
                              if (qState != null) {
                                state.didChange(qState);
                                state.validate();
                              }
                            } else {
                              state.didChange(
                                QuestionState(optionSelected: index),
                              );
                              state.validate();
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        );
}

class BottomSheet extends StatefulWidget {
  final int selectedOption;
  final QuestionState? questionState;
  const BottomSheet(
      {super.key, this.questionState, required this.selectedOption});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  XFile? selectedImage;
  final commentController = TextEditingController();

  @override
  void initState() {
    if (widget.questionState != null) {
      commentController.text = widget.questionState?.comment ?? "";
      selectedImage = widget.questionState?.selectedImage;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          MediaQuery.of(context).viewInsets.copyWith(left: 24.0, right: 24.0),
      child: Wrap(
        runSpacing: 16.0,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 6,
              margin: const EdgeInsets.only(top: 24.0),
              decoration: BoxDecoration(
                color: const Color(0xffd6ddde),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Text(
            "Add Comment",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          TextField(
            controller: commentController,
            maxLines: 2,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: "Type here….",
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(),
            ),
          ),
          if (selectedImage == null)
            InkWell(
              onTap: () async {
                XFile? pickedImage = await showDialog(
                  context: context,
                  builder: (context) {
                    return const ImagePickerOptions();
                  },
                );
                if (pickedImage != null) {
                  setState(() {
                    selectedImage = pickedImage;
                  });
                }
              },
              child: SizedBox.fromSize(
                size: const Size.fromHeight(200),
                child: DottedBorder(
                  color: const Color(0xff808080),
                  strokeWidth: 1,
                  dashPattern: const [6, 6],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
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
            )
          else
            SizedBox.fromSize(
              size: const Size.fromHeight(200),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(selectedImage!.path),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedImage = null;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          SafeArea(
            bottom: true,
            top: false,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xfff26b23),
                    fixedSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(
                      QuestionState(
                        optionSelected: widget.selectedOption,
                        selectedImage: selectedImage,
                        comment: commentController.text,
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
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}

class QuestionState {
  int optionSelected;
  String? image;
  XFile? selectedImage;
  String? comment;

  QuestionState({
    this.selectedImage,
    this.comment,
    this.image,
    required this.optionSelected,
  });
}

class PreItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isBlackTheme;
  final VoidCallback onClick;
  const PreItem(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onClick,
      this.isBlackTheme = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (isSelected) {
            if (isBlackTheme) {
              return Colors.white;
            }
            return Theme.of(context).primaryColorDark;
          } else {
            return const Color(0xff808080);
          }
        }),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (isSelected && isBlackTheme) {
            return Colors.black;
          }
          return Colors.white;
        }),
        overlayColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>((states) {
          if (isSelected) {
            if (isBlackTheme) {
              return BorderSide(
                  color: Theme.of(context).primaryColor, width: 1.5);
            }
            return BorderSide(
                color: Theme.of(context).primaryColor, width: 1.5);
          }
          return const BorderSide(color: Color(0xffd7dae0));
        }),
      ),
      onPressed: onClick,
      child: Text(text),
    );
  }
}

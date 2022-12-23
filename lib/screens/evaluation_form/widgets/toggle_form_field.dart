import 'package:flutter/material.dart';

import '../../../config/config.dart';

class ToggleFormField extends FormField<int> {
  final BuildContext context;
  final String title;

  ToggleFormField({
    super.key,
    required this.title,
    required this.context,
    FormFieldSetter<int>? onSaved,
    FormFieldValidator<int>? validator,
    int? initialValue,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<int> state) {
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
                if (state.hasError)
                  Divider(color: Theme.of(context).colorScheme.error),
                SizedBox(height: state.hasError ? 0.0 : 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Wrap(
                    spacing: 24.0,
                    children:
                        List.generate(Config.step2Options.length, (index) {
                      final option = Config.step2Options[index];
                      return Step2Item(
                        text: option,
                        isSelected: index == state.value,
                        onClick: () {
                          state.didChange(index);
                          state.validate();
                        },
                      );
                    }),
                  ),
                )
              ],
            );
          },
        );
}

class Step2Item extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onClick;
  final String text;
  const Step2Item(
      {Key? key,
      required this.isSelected,
      required this.onClick,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return isSelected
              ? Theme.of(context).primaryColorDark
              : const Color(0xff808080);
        }),
      ),
      icon: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          isSelected
              ? "assets/images/checkbox_s.png"
              : "assets/images/checkbox.png",
          width: 24,
          height: 24,
        ),
      ),
      onPressed: onClick,
      label: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

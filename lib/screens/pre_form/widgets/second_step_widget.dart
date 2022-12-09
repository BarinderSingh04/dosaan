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
                SizedBox(height: state.hasError ? 8.0 : 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Wrap(
                    runSpacing: 14.0,
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
    return InkWell(
      onTap: onClick,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Row(
          key: ValueKey<bool>(isSelected),
          children: [
            Image.asset(
              isSelected
                  ? "assets/images/checkbox_s.png"
                  : "assets/images/checkbox.png",
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: isSelected
                    ? Theme.of(context).primaryColorDark
                    : const Color(0xff808080),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

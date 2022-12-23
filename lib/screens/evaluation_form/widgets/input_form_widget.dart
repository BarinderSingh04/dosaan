import 'package:flutter/material.dart';

class InputFormField extends FormField<String> {
  final BuildContext context;
  final String leading;
  final String trailing;

  InputFormField({
    super.key,
    required this.context,
    required this.leading,
    required this.trailing,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? initialValue,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<String?> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: leading,
                    style: const TextStyle(),
                    children: <InlineSpan>[
                      const WidgetSpan(child: SizedBox(width: 8.0)),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 100),
                          child: TextFormField(
                            initialValue: initialValue,
                            onSaved: onSaved,
                            validator: validator,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 8.0)),
                      TextSpan(
                        text: trailing,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
}

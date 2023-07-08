import 'package:flutter/material.dart';

import '../misc/app_colors.dart';

class CommonDropdownInput extends StatelessWidget {
  final String labelText, placeholder;
  final List<String> data;
  final void Function(String?)? onChanged;

  const CommonDropdownInput({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.data,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: colorBlue,
          ),
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          hint: Text(placeholder),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: colorBlue,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: colorBlue,
                width: 1,
              ),
            ),
          ),
          items: data.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        )
      ],
    );
  }
}

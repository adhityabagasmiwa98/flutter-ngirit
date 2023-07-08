import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:intl/intl.dart';

class CommonDateInput extends StatelessWidget {
  final String labelText, placeholder, value;
  final Function(String) onChanged;

  const CommonDateInput({
    super.key,
    required this.labelText,
    required this.placeholder,
    required this.onChanged,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    void showDatePickerModal() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      ).then((value) {
        String date =
            DateFormat('dd MMMM yyyy').format(value ?? DateTime.now());
        onChanged(date);
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: colorBlue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: showDatePickerModal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value.isNotEmpty ? value : placeholder,
                  style: const TextStyle(
                    color: Color(0xff2D3648),
                  ),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: colorBlue.withAlpha(15),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.date_range_outlined,
                    color: colorBlue,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

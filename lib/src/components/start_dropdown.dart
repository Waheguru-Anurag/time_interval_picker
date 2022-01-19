import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/utils.dart' as utils;
import 'full_touch_dropdown.dart';

class StartDropdown extends StatelessWidget {
  const StartDropdown({
    Key? key,
    required this.time,
    required this.onChanged,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 8,
    this.contentPadding,
    this.dropdownTextStyle,
    this.enabled = true,
  }) : super(key: key);

  final DateTime time;
  final bool? filled;
  final bool enabled;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final TextStyle? dropdownTextStyle;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    return FullTouchDropdown(
      value: utils.getIndexFromDateTime(
        time,
      ),
      filled: filled,
      fillColor: fillColor,
      borderColor: borderColor,
      contentPadding: contentPadding,
      enabled: enabled,
      items: utils.getDateTimeList(24).map(
        (time) {
          final int value = utils.getIndexFromDateTime(time);
          final String text = utils.getIndexFromDateTime(time) == 24
              ? 'Midnight'
              : DateFormat.jm().format(time);
          return DropdownMenuItem(
            value: value,
            child: Text(
              text,
              style: dropdownTextStyle,
            ),
          );
        },
      ).toList(),
      onChanged: (int? value) {
        final startTime = utils.getDateTimeFromIndex(
          value!,
        );
        onChanged(startTime);
      },
    );
  }
}

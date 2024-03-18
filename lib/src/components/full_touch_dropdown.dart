import 'package:flutter/material.dart';

import '../core/colors.dart';

class FullTouchDropdown extends StatefulWidget {
  const FullTouchDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    this.enabled = false,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 8,
    this.contentPadding,
    this.items,
  }) : super(key: key);

  final int value;
  final bool enabled;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final ValueChanged<int?> onChanged;
  final List<DropdownMenuItem<int>>? items;

  @override
  FullTouchDropdownState createState() => FullTouchDropdownState();
}

class FullTouchDropdownState extends State<FullTouchDropdown> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shadowColor: LibColors.transparent,
        backgroundColor: LibColors.white,
      ),
      onPressed: () {
        if (!widget.enabled) return;
        if (widget.items == null || widget.items!.isEmpty) return;
        late GestureDetector detector;
        void searchForGestureDetector(BuildContext element) {
          element.visitChildElements((Element element) {
            if (element.widget is GestureDetector) {
              detector = element.widget as GestureDetector;
              return;
            } else {
              searchForGestureDetector(element);
            }
            return;
          });
        }

        searchForGestureDetector(_key.currentContext!);
        detector.onTap!();
      },
      child: DropdownButtonFormField<int>(
        key: _key,
        value: widget.value,
        decoration: InputDecoration(
          isDense: true,
          filled: widget.filled,
          fillColor: widget.fillColor,
          contentPadding: widget.contentPadding,
          enabled: widget.enabled,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? LibColors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? LibColors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? LibColors.black,
            ),
          ),
        ),
        items: widget.items,
        onChanged: widget.onChanged,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'colors.dart';

@immutable
class LibTheme {
  static ThemeData get theme => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: LibColors.white,
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: LibColors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: LibColors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: LibColors.black,
            ),
          ),
        ),
      );
}

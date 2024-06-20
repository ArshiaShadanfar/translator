import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/vars.dart';

class MyInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const MyInputField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: themeData.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: themeData.textTheme.bodyMedium!.apply(
            color: themeData.textTheme.bodyMedium!.color!.withAlpha(150)),
        filled: true,
        fillColor: themeData.colorScheme.surface,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(20)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(width: 2, color: Colors.red.shade400),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(20)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(150)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'این فیلد نمی‌تواند خالی باشد';
        }
        return null;
      },
    );
  }
}

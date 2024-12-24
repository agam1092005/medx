// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/constants.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.icon,
    this.preIcon,
    required this.color,
  });

  final String hintText;
  final controller;
  final validator;
  final icon;
  final preIcon;
  final color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: Colors.black38,
      controller: controller,
      keyboardType: TextInputType.name,
      style: const TextStyle(
        fontSize: 16,
        color: accentColor,
        fontWeight: FontWeight.bold,
      ),
      autofocus: false,
      textInputAction: TextInputAction.search,
      onChanged: (value) {
        TextSelection previousSelection = controller.selection;
        controller.text = value;
        controller.selection = previousSelection;
      },
      decoration: InputDecoration(
        suffixIcon: icon,
      prefixIcon: preIcon,
      hintText: hintText,
        hintStyle: TextFormTextStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: accentColor,
          ),
        ),
      ),
    );
  }
}

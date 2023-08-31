import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Metrics.dart';

enum InputType { TextInput, PasswordInput, NumberInput, PhoneInput }

class AppInput extends StatelessWidget {
  final InputType? type;
  final String placeholder;
  final Icon? icon;
  final Color iconColor;
  final Color placeholderColor;
  final Color textColor;
  final Radius radius;
  final Color backgroundColor;
  final double border;
  final Color borderColor;
  final EdgeInsets contentPadding;

  const AppInput(
      {super.key,
      this.type = InputType.TextInput,
      this.textColor = Colors.black54,
      required this.placeholder,
      this.placeholderColor = Colors.black26,
      this.icon,
      this.iconColor = Colors.transparent,
      this.radius = radius_tiny,
      this.backgroundColor = Colors.transparent,
      this.border = 0,
      this.borderColor = Colors.black26,
      this.contentPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType = TextInputType.text;
    if (type == InputType.NumberInput) {
      keyboardType = TextInputType.number;
    } else if (type == InputType.PhoneInput) {
      keyboardType = TextInputType.phone;
    }
    InputBorder inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2));
    if (border > 0) {
      inputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: borderColor, width: border));
    }

    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: iconColor,
          filled: true,
          fillColor: backgroundColor,
          contentPadding: contentPadding,
          focusedBorder: inputBorder,
          border: inputBorder,
          enabledBorder: inputBorder,
          hintText: placeholder,
          hintStyle: TextStyle(color: placeholderColor)),
      style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
    );
  }
}

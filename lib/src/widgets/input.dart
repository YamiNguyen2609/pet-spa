import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../theme/constant.dart';
import '../ultis/utils.dart';

class AppInput extends StatefulWidget {
  final String value;
  final InputType? type;
  final String label;
  final double width;
  final double height;
  final String placeholder;
  final Icon? icon;
  final Color iconColor;
  final Color placeholderColor;
  final Color textColor;
  final Radius radius;
  final Color backgroundColor;
  final double border;
  final Color borderColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final double borderUnderLine;
  final int minLine;
  final int? maxLine;
  final Function onChangeText;

  const AppInput(
      {super.key,
      this.width = 0,
      this.height = 0,
      this.value = '',
      this.type = InputType.TextInput,
      this.textColor = Colors.black54,
      this.label = '',
      this.placeholder = '',
      this.placeholderColor = Colors.black26,
      this.icon,
      this.iconColor = Colors.transparent,
      this.radius = radius_tiny,
      this.backgroundColor = Colors.transparent,
      this.border = 0,
      this.borderUnderLine = 1,
      this.borderColor = Colors.black12,
      this.margin = EdgeInsets.zero,
      this.padding = EdgeInsets.zero,
      this.contentPadding = EdgeInsets.zero,
      this.minLine = 1,
      this.maxLine,
      required this.onChangeText});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.value != '') {
      _controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    double Width = widget.width > 0 ? widget.width : Utils.width(context);
    double Height = widget.height > 0
        ? widget.height
        : widget.label != ""
            ? height_default
            : 44;
    TextInputType keyboardType = TextInputType.text;
    if (widget.type == InputType.NumberInput) {
      keyboardType = TextInputType.number;
    } else if (widget.type == InputType.PhoneInput) {
      keyboardType = TextInputType.phone;
    } else if (widget.type == InputType.MultilineInput) {
      keyboardType = TextInputType.multiline;
      Height = 30.0 * widget.minLine;
    }
    InputBorder inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(
            color: widget.borderColor, width: widget.borderUnderLine));
    if (widget.border > 0) {
      inputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(widget.radius),
          borderSide:
              BorderSide(color: widget.borderColor, width: widget.border));
    }

    return SizedBox(
      width: Width,
      height: Height,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            labelText:
                widget.placeholder == '' ? widget.label : widget.placeholder,
            labelStyle: TextStyle(color: widget.placeholderColor),
            fillColor: widget.backgroundColor,
            contentPadding: widget.contentPadding,
            focusedBorder: inputBorder,
            border: inputBorder,
            enabledBorder: inputBorder),
        style: TextStyle(
            fontSize: text_size_sub,
            color: widget.textColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../theme/Color.dart';
import '../theme/Metrics.dart';
import '../ultis/utils.dart';

class Calendar extends StatelessWidget {
  final DateTime value;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Radius radius;
  final Color backgroundColor;
  final double border;
  final Color borderColor;
  final Function callback;
  const Calendar(
    this.value, {
    super.key,
    required this.callback,
    this.width = 0,
    this.height = 0,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.radius = radius_tiny,
    this.backgroundColor = Colors.transparent,
    this.border = 0,
    this.borderColor = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    double Width = width > 0 ? width : Utils.width(context);
    double Height = height > 0 ? height : 350;
    InputBorder inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 2));
    if (border > 0) {
      inputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: borderColor, width: border));
    }
    return Container(
      width: Width,
      height: Height,
      margin: margin,
      padding: padding,
      child: CalendarDatePicker2(
          value: [value],
          config: CalendarDatePicker2Config(
              selectedDayHighlightColor: color_primary)),
    );
  }
}

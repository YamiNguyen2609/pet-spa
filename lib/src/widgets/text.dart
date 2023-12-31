import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double size;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppText(this.text,
      {super.key,
      this.weight = FontWeight.w500,
      this.size = text_size_normal,
      this.italic = false,
      this.line,
      this.overflow,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    String value = '';
    if (text != null) value = text!;
    return Container(
      margin: margin,
      child: SelectionContainer.disabled(
          child: Text(
        value,
        overflow: overflow,
        maxLines: line,
        softWrap: true,
        // textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: weight,
            fontSize: size,
            color: color,
            fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            decoration: TextDecoration.none),
      )),
    );
  }
}

class AppLabelText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppLabelText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.italic = false,
      this.weight = FontWeight.w700,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: text_size_label,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

class AppLabelMediumText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppLabelMediumText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.italic = false,
      this.weight = FontWeight.w900,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: text_size_medium,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

class AppSubTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppSubTitleText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.italic = false,
      this.weight = FontWeight.w700,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: text_size_sub,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

class AppHeading2Text extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppHeading2Text(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.italic = false,
      this.weight = FontWeight.w800,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: text_size_heading_2,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

class AppHeading1Text extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  final bool italic;
  const AppHeading1Text(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.italic = false,
      this.weight = FontWeight.bold,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: text_size_heading_1,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

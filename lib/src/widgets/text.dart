import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  const AppText(this.text,
      {super.key,
      this.weight = FontWeight.normal,
      this.size = 12,
      this.line,
      this.overflow,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SelectionContainer.disabled(
          child: Text(
        text,
        overflow: overflow,
        maxLines: line,
        softWrap: true,
        // textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: weight,
            fontSize: size,
            color: color,
            decoration: TextDecoration.none),
      )),
    );
  }
}

class AppLabelMediumText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  const AppLabelMediumText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.weight = FontWeight.w900,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: 14,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

class AppLabelText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets margin;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? line;
  const AppLabelText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.weight = FontWeight.w700,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: 12,
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
  const AppSubTitleText(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.weight = FontWeight.w700,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: 16,
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
  const AppHeading2Text(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.weight = FontWeight.w800,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: 18,
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
  const AppHeading1Text(this.text,
      {super.key,
      this.line,
      this.overflow,
      this.weight = FontWeight.bold,
      this.color = color_primary,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return AppText(text,
        weight: weight,
        size: 20,
        color: color,
        margin: margin,
        overflow: overflow,
        line: line);
  }
}

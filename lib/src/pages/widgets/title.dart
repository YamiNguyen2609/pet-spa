import 'package:flutter/material.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final double size;
  const HeaderTitle(this.title, {super.key, this.size = text_size_heading_2});

  @override
  Widget build(BuildContext context) {
    return AppText(
      title,
      color: Colors.black87,
      size: size,
      weight: FontWeight.w800,
      margin: EdgeInsets.symmetric(
          horizontal: padding_regular.left, vertical: padding_small.top),
    );
  }
}

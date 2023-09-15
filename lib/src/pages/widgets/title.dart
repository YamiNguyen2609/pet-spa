import 'package:flutter/material.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubTitleText(
      title,
      color: Colors.black87,
      margin: padding_regular,
    );
  }
}

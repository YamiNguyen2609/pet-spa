import 'package:flutter/material.dart';

import '../theme/Metrics.dart';
import '../ultis/utils.dart';

enum CardAlignment { Horizontal, Vertical }

class CardContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Radius radius;
  final CardAlignment alignment;
  final Color color;
  const CardContainer(
      {super.key,
      this.alignment = CardAlignment.Horizontal,
      this.margin = padding_small,
      this.padding = padding_small,
      this.radius = radius_regular,
      this.color = Colors.white,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.width(context) - padding_regular.left * 2,
      padding: padding,
      margin: margin,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.all(radius)),
      child: alignment == CardAlignment.Horizontal
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children),
    );
  }
}

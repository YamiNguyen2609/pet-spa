import 'package:flutter/material.dart';

import '../theme/Metrics.dart';
import '../ultis/utils.dart';

class CardContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Radius radius;
  const CardContainer(
      {super.key,
      this.margin = padding_regular,
      this.padding = padding_regular,
      this.radius = radius_regular,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.width(context) - padding_regular.left * 2,
      padding: padding,
      margin: EdgeInsets.symmetric(horizontal: margin.left),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(radius)),
      child: Column(children: children),
    );
  }
}

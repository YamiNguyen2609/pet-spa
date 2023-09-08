import 'package:flutter/material.dart';

class AppScollview extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  const AppScollview(
      {super.key,
      required this.children,
      this.margin = EdgeInsets.zero,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scrollbar(
      thumbVisibility: false,
      trackVisibility: false,
      thickness: 0,
      child: SingleChildScrollView(
          child: Container(
        margin: margin,
        padding: padding,
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: children),
      )),
    ));
  }
}

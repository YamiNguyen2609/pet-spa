import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';

import '../theme/Metrics.dart';

class AppSwitch extends StatefulWidget {
  final double witth;
  final double height;
  final Radius radius;
  final bool value;
  final Color inActiveColor;
  final Color activeColor;
  final Function onChange;
  final EdgeInsets padding;
  final Widget? inActiveChild;
  final Widget? activeChild;
  const AppSwitch(this.value,
      {super.key,
      this.witth = 60,
      this.height = 30,
      this.radius = radius_tiny,
      this.inActiveColor = Colors.black26,
      this.activeColor = color_primary,
      this.padding = EdgeInsets.zero,
      this.inActiveChild,
      this.activeChild,
      required this.onChange});

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    EdgeInsets Padding = widget.padding == EdgeInsets.zero
        ? EdgeInsets.symmetric(horizontal: padding_tiny.left / 5)
        : widget.padding;
    return GestureDetector(
        onTap: () => {
              setState(() {
                value = !value;
                widget.onChange(value);
              })
            },
        child: Container(
            width: widget.witth,
            height: widget.height,
            decoration: BoxDecoration(
                color: value ? widget.activeColor : widget.inActiveColor,
                borderRadius: BorderRadius.all(widget.radius)),
            padding: Padding,
            child: Stack(children: [
              AnimatedAlign(
                  alignment:
                      value ? Alignment.centerRight : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    height: widget.height - Padding.left * 2,
                    width: widget.height - Padding.left * 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(widget.radius)),
                  )),
              Row(children: [
                Container(
                    width: (widget.witth - Padding.left * 2) / 2,
                    height: widget.height - Padding.left * 2,
                    alignment: Alignment.center,
                    child: widget.activeChild ?? const SizedBox()),
                Container(
                    width: (widget.witth - Padding.left * 2) / 2,
                    height: widget.height - Padding.left * 2,
                    alignment: Alignment.center,
                    child: widget.inActiveChild ?? const SizedBox()),
              ])
            ])));
  }
}

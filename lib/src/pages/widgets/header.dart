import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Metrics.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double? iconSize;
  final Function? onPress;
  const Header(this.title, {super.key, this.icon, this.iconSize, this.onPress});

  @override
  Widget build(BuildContext context) {
    const double size = icon_medium;
    return Container(
        height: height_header,
        padding: EdgeInsets.only(
            left: padding_small.left,
            right: padding_small.left,
            top: status_bar_height + padding_regular.top,
            bottom: padding_regular.top),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: color_primary,
                    size: size,
                  )),
              AppHeading1Text(title, color: color_primary),
              icon != null
                  ? GestureDetector(
                      onTap: () => onPress!(),
                      child: Icon(
                        icon,
                        color: color_primary,
                        size: iconSize ?? iconSize,
                      ))
                  : const Icon(
                      null,
                      color: color_primary,
                      size: size,
                    )
            ]));
  }
}

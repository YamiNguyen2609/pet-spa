import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Metrics.dart';

class Header extends StatelessWidget {
  final String title;
  const Header(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 25;
    return Container(
        height: 70,
        padding: EdgeInsets.symmetric(
            horizontal: padding_small.left, vertical: padding_regular.top),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: color_primary,
                    size: iconSize,
                  )),
              AppHeading1Text(title, color: color_primary),
              const Icon(
                null,
                color: color_primary,
                size: iconSize,
              )
            ]));
  }
}

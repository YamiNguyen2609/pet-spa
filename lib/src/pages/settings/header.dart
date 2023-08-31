import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Metrics.dart';

class Header extends StatelessWidget {
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: color_secondary_3,
            borderRadius: BorderRadius.only(
                bottomLeft: radius_medium, bottomRight: radius_medium)),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                const Padding(
                  padding: padding_regular,
                  child: AppHeading1Text(
                    "Hồ sơ",
                    weight: FontWeight.bold,
                  ),
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: color_primary,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                        child: Padding(
                            padding: padding_tiny / 2,
                            child: Image.asset(
                              'assets/launcher.png',
                              width: 100,
                              height: 100,
                            )))),
                Padding(
                  padding: EdgeInsets.only(top: padding_small.top),
                  child: const AppText(
                    "Yami Nguyen",
                    size: 23,
                    weight: FontWeight.bold,
                  ),
                ),
                const AppLabelMediumText(
                  "Yami",
                  color: Colors.black45,
                )
              ],
            )));
  }
}

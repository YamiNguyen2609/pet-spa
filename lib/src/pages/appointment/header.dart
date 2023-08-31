import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Metrics.dart';
import '../pet/pet_detail.dart';

class Header extends StatelessWidget {
  final Function onPressTab;
  final int state;
  Header({super.key, required this.onPressTab, this.state = 0});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 25;
    return Container(
        height: 60,
        padding: padding_small,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                null,
                color: color_primary,
                size: iconSize,
              ),
              const AppHeading1Text('Appointment', color: color_primary),
              GestureDetector(
                  child: const Icon(
                    Icons.add_rounded,
                    color: color_primary,
                    size: 28,
                  ),
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const PetDetail(null)))),
            ]));
  }
}

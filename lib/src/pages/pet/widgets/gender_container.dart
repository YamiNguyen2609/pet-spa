import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';

class GenderContainer extends StatelessWidget {
  final bool value;
  final Function onPress;
  const GenderContainer(this.value, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
          width: 60,
          decoration: BoxDecoration(
              color: value ? color_primary : color_pink,
              borderRadius: const BorderRadius.all(radius_large)),
          padding: EdgeInsets.symmetric(horizontal: padding_tiny.left / 5),
          height: 30,
          child: Stack(
            children: [
              AnimatedAlign(
                  alignment:
                      value ? Alignment.centerRight : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(radius_medium)),
                  )),
              Row(children: []),
            ],
          )),
    );
  }
}

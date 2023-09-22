import 'package:flutter/material.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/text.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: padding_regular.left,
          right: padding_regular.right,
          top: padding_regular.top),
      width: Utils.width(context) - padding_regular.left * 2,
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(radius_regular)),
      height: 200,
      child: Stack(children: [
        Container(
          height: 30,
          margin: EdgeInsets.only(
              top: padding_small.top, right: padding_small.right),
          alignment: Alignment.centerRight,
          child: AppSubTitleText(user.name),
        ),
        Image.asset(
          'assets/logo-card.png',
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/button.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLabelMediumText(
          "Dịch vụ tại Lin's house",
          color: Colors.black87,
          weight: FontWeight.w400,
          margin: EdgeInsets.symmetric(horizontal: padding_regular.left),
        ),
        Container(
            padding: padding_regular,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Item("Lưu trú"),
                Item("Làm đẹp"),
                Item("Điều trị tại nhà")
              ],
            ))
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  const Item(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final double width =
        (MediaQuery.of(context).size.width - padding_regular.left * 2);
    return Container(
      width: width,
      height: 160,
      margin: EdgeInsets.only(bottom: padding_regular.bottom),
      padding: EdgeInsets.only(
          bottom: padding_tiny.bottom,
          left: padding_medium.left,
          right: padding_tiny.right),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(radius_tiny),
          border: Border.all(width: 2, color: color_secondary_2),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/lodging.png',
              ))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 130,
              height: 30,
              child: AppHeading2Text(
                title,
                color: Colors.white,
              )),
          AppButton(
              width: 75,
              height: 30,
              backgroundColor: color_green,
              type: ButtonType.TextButton,
              size: 12,
              text: 'Đặt ngay',
              radius: radius_tiny,
              onPress: () {})
        ],
      ),
    );
  }
}

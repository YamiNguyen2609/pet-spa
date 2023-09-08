import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/home/beauty.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';

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
            padding: EdgeInsets.symmetric(vertical: padding_regular.top),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Item("Lưu trú", Beauty()),
                Item("Làm đẹp", Beauty()),
                Item("Chăm sóc", Beauty()),
              ],
            ))
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final Widget widget;
  const Item(this.title, this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width) / 3;
    return GestureDetector(
        onTap: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => widget)),
        child: SizedBox(
          width: size,
          height: size + padding_tiny.bottom,
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(bottom: padding_tiny.bottom),
                decoration: BoxDecoration(
                  color: color_primary,
                  borderRadius: BorderRadius.all(Radius.circular(size)),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(size)),
                    child: Image.asset(
                      'assets/lodging.png',
                      fit: BoxFit.cover,
                      width: size - padding_large.left,
                      height: size - padding_large.left,
                    ))),
            AppSubTitleText(
              title,
              color: Colors.black87,
            )
          ]),
        ));
  }
}

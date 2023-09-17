import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/ultis/utils.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../widgets/text.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final Widget widget;
  const ServiceItem(this.title, this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, CupertinoPageRoute(builder: (context) => widget)),
      child: Container(
        alignment: Alignment.center,
        width: (Utils.width(context) - padding_regular.left * 3) / 2,
        padding: padding_tiny,
        decoration: const BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.all(radius_small)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(radius_large),
                child: Image.asset(
                  'assets/lodging.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                )),
            AppText(
              title,
              margin: EdgeInsets.only(left: padding_small.top / 2),
              size: text_size_sub,
              color: color_primary,
            ),
          ],
        ),
      ),
    );
  }
}

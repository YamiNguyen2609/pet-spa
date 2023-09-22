import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/lodging/Lodging.dart';
import '../../service/veterinary/Veterinary.dart';
import '../../widgets/title.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/text.dart';
import '../../service/grooming/grooming.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderTitle("Dịch vụ của Lin's house"),
        Padding(
          padding: EdgeInsets.only(
              left: padding_regular.left, right: padding_regular.right),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Item('Lưu trú', Lodging()),
              Item('Làm đẹp', Grooming()),
              Item('Điều trị', Veterinary())
            ],
          ),
        ),
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
    return GestureDetector(
      onTap: () => Navigator.push(
          context, CupertinoPageRoute(builder: (context) => widget)),
      child: Container(
        alignment: Alignment.center,
        width: (Utils.width(context) - padding_regular.left * 6) / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(
                    (Utils.width(context) - padding_regular.left * 4) / 3)),
                child: Image.asset(
                  'assets/lodging.png',
                  fit: BoxFit.cover,
                  width: (Utils.width(context) - padding_regular.left * 6) / 3,
                  height: (Utils.width(context) - padding_regular.left * 6) / 3,
                )),
            AppText(
              title,
              margin: EdgeInsets.only(top: padding_small.top / 2),
              size: text_size_sub,
              color: color_primary,
            ),
          ],
        ),
      ),
    );
  }
}

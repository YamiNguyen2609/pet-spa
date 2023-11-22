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
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Item('Lưu trú', 'lodging', Lodging()),
                    Item('Vaccine', 'vaccine', Lodging()),
                  ],
                ),
                SizedBox(
                  height: padding_tiny.top,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Item('Làm đẹp', 'grooming', Grooming()),
                    Item('Điều trị', 'veterinary', Grooming()),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String icon;
  final Widget widget;
  const Item(this.title, this.icon, this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, CupertinoPageRoute(builder: (context) => widget)),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding_tiny.top / 2),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black12),
            borderRadius: const BorderRadius.all(radius_large)),
        width: (Utils.width(context) - padding_regular.left * 3) / 2,
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(
                  (Utils.width(context) - padding_regular.left * 4) / 3)),
              child: ColoredBox(
                  color: color_primary,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/icon_$icon.png',
                        fit: BoxFit.cover,
                        width: icon_small,
                        height: icon_small,
                      )))),
          AppText(
            title,
            margin: EdgeInsets.only(left: padding_small.top / 2),
            size: text_size_sub,
            color: color_primary,
          )
        ]),
      ),
    );
  }
}

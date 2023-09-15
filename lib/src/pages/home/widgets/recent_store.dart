import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/data/data.dart';
import 'package:pet_spa/src/pages/home/location.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';

class RecentStore extends StatelessWidget {
  const RecentStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderTitle("Chi nhánh gần đây"),
            AppButton(
                type: ButtonType.TextButton,
                text: 'xem thêm',
                textColor: color_secondary_1,
                size: text_size_label,
                width: 65,
                height: 30,
                margin: EdgeInsets.only(right: padding_regular.right),
                onPress: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Location())))
          ],
        ),
        SizedBox(
            height: 295,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  3,
                  (index) => Container(
                        width: Utils.width(context) - padding_regular.left * 6,
                        margin: EdgeInsets.only(
                            right: padding_regular.right,
                            left: index == 0 ? padding_regular.left : 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.black12),
                            borderRadius:
                                const BorderRadius.all(radius_medium)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: radius_medium),
                                child: Image.asset(
                                  'assets/location_test.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AppSubTitleText(stores[index].name,
                                  margin: padding_tiny),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: padding_tiny.left),
                                  child: Row(children: [
                                    const Icon(
                                      Icons.map_rounded,
                                      color: color_primary,
                                      size: icon_regular,
                                    ),
                                    Flexible(
                                        child: AppLabelText(
                                      '${stores[index].address}, Phường ${stores[index].ward}, Quận ${stores[index].district}, ${stores[index].city}',
                                      color: Colors.black54,
                                      margin: EdgeInsets.only(
                                          left: padding_tiny.left),
                                    ))
                                  ])),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: padding_tiny.left),
                                  child: Row(children: [
                                    const Icon(
                                      Icons.access_time_filled_rounded,
                                      color: color_primary,
                                      size: icon_regular,
                                    ),
                                    Flexible(
                                        child: AppLabelText(
                                      'cách đây ${stores[index].time} ${stores[index].unittime} - ${stores[index].distance} ${stores[index].unitdistance}',
                                      color: Colors.black54,
                                      margin: EdgeInsets.only(
                                          left: padding_tiny.left),
                                    ))
                                  ]))
                            ]),
                      )),
            )),
      ],
    );
  }
}

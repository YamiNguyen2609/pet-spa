import 'package:flutter/material.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';

class HeaderMain extends StatelessWidget {
  const HeaderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.5, color: Colors.black12))),
      padding: EdgeInsets.fromLTRB(
          padding_tiny.left, padding_tiny.top, 5, padding_tiny.bottom),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: color_primary,
                    borderRadius: BorderRadius.all(radius_large),
                  ),
                  child: Padding(
                      padding: padding_tiny / 2,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ))),
              Container(
                  width: MediaQuery.of(context).size.width -
                      padding_large.left * 4,
                  padding: EdgeInsets.only(left: padding_tiny.left),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLabelText(
                        "Yami Nguyễn",
                        color: color_primary,
                        weight: FontWeight.w900,
                      ),
                      AppLabelText(
                        "142 Huỳnh Tấn Phát, Phường Phú Thuận, Quận 07, TP.Hồ Chí Minh",
                        color: color_green,
                        line: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ))
            ],
          ),
          AppButton(
            onPress: () => {},
            type: ButtonType.IconButton,
            icon: const Icon(Icons.map_rounded),
            iconColor: color_secondary_1,
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}

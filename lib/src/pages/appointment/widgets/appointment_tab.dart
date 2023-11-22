import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Metrics.dart';

class AppointmentTab extends StatelessWidget {
  final int state;
  final Function onPress;
  const AppointmentTab(this.state, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    var states = ['Chờ xác nhận', 'Đang xử lý', 'Hoàn Thành'];
    return Container(
      padding: EdgeInsets.only(top: status_bar_height),
      width: Utils.width(context),
      child: Row(
          children: List.generate(
              states.length,
              (index) => GestureDetector(
                    onTap: () => onPress(index),
                    child: Container(
                        width: Utils.width(context) / states.length,
                        height: 50,
                        // padding: EdgeInsets.only(top: padding_tiny.top),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2,
                                    color: state == index
                                        ? color_primary
                                        : Colors.black26))),
                        child: AppText(
                          states[index],
                          size: text_size_medium,
                          color:
                              state == index ? color_primary : Colors.black54,
                        )),
                  ))),
    );
  }
}

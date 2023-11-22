import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/models/appoinment_model.dart';
import 'package:pet_spa/src/pages/appointment/widgets/appointment_detail.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/card.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Metrics.dart';
import '../../theme/constant.dart';
import '../../widgets/bottom.dart';
import '../../widgets/scrollview.dart';
import 'widgets/appointment_tab.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int currentState = 0;
  void onPressTab(int state) {
    setState(() {
      currentState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appointments_state =
        appointments.where((element) => element.state == currentState).toList();
    return CupertinoPageScaffold(
        backgroundColor: background_color,
        child: Column(children: [
          AppointmentTab(
            currentState,
            onPress: onPressTab,
          ),
          AppScollview(children: [
            ...List.generate(appointments_state.length,
                (index) => Item(appointments_state[index])),
            Bottom()
          ])
        ]));
  }
}

class Item extends StatelessWidget {
  final AppointmentModel item;
  const Item(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: radius_medium),
            ),
            builder: (BuildContext context) {
              return AppointmentDetail(item);
            }),
        child: CardContainer(
          margin: EdgeInsets.only(
              top: padding_regular.top,
              left: padding_regular.left,
              right: padding_regular.right),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: padding_tiny.right / 2),
                          padding: EdgeInsets.all(padding_tiny.top / 2),
                          decoration: const BoxDecoration(
                            color: color_primary,
                            borderRadius: BorderRadius.all(radius_large),
                          ),
                          child: Icon(
                            item.service == Service.Lodging
                                ? Icons.home_rounded
                                : (item.service == Service.Grooming
                                    ? Icons.shower_rounded
                                    : Icons.vaccines_rounded),
                            color: Colors.white,
                            size: icon_small,
                          )),
                      AppText(
                        '#${item.code}',
                        size: text_size_sub,
                      ),
                    ]),
                item.state == 2
                    ? (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding_tiny.left / 2,
                                vertical: padding_tiny.top / 3),
                            decoration: BoxDecoration(
                                color: item.isCancel
                                    ? Colors.red.shade600
                                    : Colors.green.shade600,
                                borderRadius: BorderRadius.all(radius_tiny)),
                            child: AppText(
                              item.isCancel ? 'Đã Hủy' : 'Hoàn thành',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ))
                    : SizedBox()
              ],
            ),
            Divider(
              height: padding_regular.top,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(
                    'assets/avatar.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: padding_small.left),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.pets,
                              color: color_secondary_1,
                              size: icon_regular,
                            ),
                            AppLabelText(
                              item.pet.name,
                              color: Colors.black87,
                              margin: EdgeInsets.only(
                                  left: padding_tiny.left / 2, top: 2),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.content_paste_rounded,
                              color: color_secondary_1,
                              size: icon_regular,
                            ),
                            AppLabelText(
                              item.service == Service.Lodging
                                  ? 'Dịch vụ lưu trú - ${item.lodging!.name}'
                                  : (item.service == Service.Grooming
                                      ? 'Dịch vụ spa - ${item.grooming!.name}'
                                      : 'Dịch vụ điều trị'),
                              color: Colors.black87,
                              margin: EdgeInsets.only(
                                  left: padding_tiny.left / 2, top: 2),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: color_secondary_1,
                              size: icon_regular,
                            ),
                            AppLabelText(
                              DateFormat('dd-MM-yyyy HH:mm')
                                  .format(item.dateStart),
                              color: Colors.black87,
                              margin: EdgeInsets.only(
                                  left: padding_tiny.left / 2, top: 2),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../models/pet_model.dart';
import '../../../models/store_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';
import '../../widgets/pet_container.dart';
import '../../widgets/pickup_container.dart';
import '../../widgets/store_container.dart';
import '../../widgets/time_container.dart';
import '../../widgets/title.dart';

class Lodging extends StatefulWidget {
  const Lodging({super.key});

  @override
  State<Lodging> createState() => _LodgingState();
}

class _LodgingState extends State<Lodging> {
  PetModel _selectedPet = pets[0];
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  StoreModel _selectedLocation = stores[0];
  bool isPickupAtHome = true;
  void _setPet(item) {
    setState(() {
      _selectedPet = item;
      Navigator.pop(context);
    });
  }

  void _setDateTime(date, time) {
    String x = "";
    setState(() {
      _date = date;
      _time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Dịch vụ lưu trú"),
          AppScollview(children: [
            const HeaderTitle('Thông tin'),
            CardContainer(children: [
              PetContainer(_selectedPet, onPress: _setPet),
            ]),
            const HeaderTitle('Hệ thống cửa hàng'),
            CardContainer(
              children: [
                StoreContainer(_selectedLocation, onPress: () {}),
                Divider(
                  height: padding_large.top,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        'Tự đến cửa hàng',
                        size: text_size_medium,
                        weight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      SizedBox(
                          width: 45,
                          height: 30,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: CupertinoSwitch(
                                  value: isPickupAtHome,
                                  activeColor: color_primary,
                                  onChanged: (bool value) => setState(() {
                                        isPickupAtHome = value;
                                      }))))
                    ]),
                AnimatedContainer(
                    width: Utils.width(context) - padding_small.left * 4,
                    height: isPickupAtHome ? 0 : 44 + padding_tiny.top,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: padding_tiny.top),
                    child: PickupContainer(_selectedLocation, onPress: () {})),
                Divider(
                  height: padding_large.top,
                ),
                TimeContainer(_date, _time, onChange: _setDateTime),
              ],
            )
          ])
        ]));
  }
}

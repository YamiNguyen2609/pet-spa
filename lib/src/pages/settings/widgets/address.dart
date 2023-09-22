import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/models/address_model.dart';
import 'package:pet_spa/src/pages/settings/widgets/address_detail.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Color.dart';
import '../../widgets/header.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(
            'Địa chỉ đã lưu',
            icon: Icons.add,
            iconSize: 28,
            onPress: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => AddressDetail(AddressModel(0)))),
          ),
          AppScollview(children: [
            const HeaderTitle('Địa chỉ đặt gần đây'),
            ...List.generate(2, (index) => Item(user.address![index], index)),
            const HeaderTitle('Địa chỉ khác'),
            ...List.generate(user.address!.length,
                (index) => Item(user.address![index], index))
          ])
        ]));
  }
}

class Item extends StatelessWidget {
  final AddressModel item;
  final int index;
  const Item(this.item, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: padding_tiny,
      margin: EdgeInsets.only(
          left: padding_regular.left,
          right: padding_regular.right,
          top: index == 0 ? 0 : padding_regular.top),
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(radius_small)),
      child: Row(children: [
        const Icon(
          Icons.location_on_rounded,
          size: icon_medium,
          color: color_secondary_1,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: padding_tiny.left),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  '${item.name != "" ? item.name : user.name}  |  ${item.phone != '' ? item.phone : user.phone}',
                  size: text_size_medium,
                  weight: FontWeight.w700,
                  color: Colors.black,
                ),
                AppText(
                  item.address,
                  size: text_size_label,
                  weight: FontWeight.w500,
                  color: Colors.black87,
                  margin: EdgeInsets.only(top: padding_tiny.left / 5),
                ),
                AppText(
                  '${item.ward}, ${item.district}, ${item.city}',
                  size: text_size_label,
                  weight: FontWeight.w500,
                  color: Colors.black87,
                  margin: EdgeInsets.only(top: padding_tiny.left / 5),
                ),
                item.isDefault
                    ? Container(
                        height: 25,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: color_primary,
                            borderRadius: BorderRadius.all(radius_tiny)),
                        child: const AppText(
                          'Mặc định',
                          color: Colors.white,
                        ),
                      )
                    : SizedBox()
              ],
            ))
      ]),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/lodging_model.dart';

import '../../../data/data.dart';
import '../../../models/pet_model.dart';
import '../../../models/store_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../theme/constant.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';
import 'lodging_detail.dart';

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
          AppScollview(
              children: List.generate(
                  lodgings.length, (index) => Item(lodgings[index], index)))
        ]));
  }
}

class Item extends StatelessWidget {
  final LodgingModel item;
  final int index;
  const Item(this.item, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        margin: EdgeInsets.only(
            left: padding_small.left,
            right: padding_small.right,
            top: index == 0 ? 0 : padding_small.top,
            bottom: index == lodgings.length - 1 ? padding_small.top : 0),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.vertical(top: radius_small),
              child: Image.network(
                'https://chocanh.vn/wp-content/uploads/thu-cung-1.jpg',
                width: Utils.width(context) - padding_small.left * 2,
              )),
          Padding(
              padding: padding_small,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppHeading2Text(
                          item.name,
                          color: color_secondary_1,
                          weight: FontWeight.w700,
                        ),
                        AppSubTitleText(
                          Utils.FormatCurrency(item.cost),
                          color: color_red,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Wrap(
                      children: List.generate(
                          item.items!.length,
                          (index) => Container(
                                margin: EdgeInsets.only(
                                    right: padding_tiny.right / 2,
                                    top: padding_tiny.top),
                                padding: EdgeInsets.symmetric(
                                    horizontal: padding_tiny.left,
                                    vertical: padding_tiny.top / 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.black26),
                                    borderRadius:
                                        const BorderRadius.all(radius_regular)),
                                child: AppLabelText(
                                  item.items![index],
                                  color: Colors.black87,
                                ),
                              )),
                    ),
                    Divider(
                      height: padding_regular.top,
                    ),
                    AppText(
                      item.description,
                      color: Colors.black87,
                      size: text_size_medium,
                    ),
                    Divider(
                      height: padding_regular.top,
                    ),
                    AppButton(
                      onPress: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LodgingDetail(item))),
                      type: ButtonType.TextButton,
                      text: 'Đặt ngay',
                      backgroundColor: color_primary,
                      height: 40,
                      radius: radius_tiny,
                    )
                  ]))
        ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/home/beauty_service.dart';
import 'package:pet_spa/src/pages/home/header.dart';
import 'package:pet_spa/src/pages/pet/pet_model.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/input.dart';
import 'package:pet_spa/src/widgets/listview.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../ultis/utils.dart';
import '../../widgets/checkbox.dart';
import '../data/data.dart';

const double component_height = 71;

class Beauty extends StatefulWidget {
  const Beauty({super.key});

  @override
  State<Beauty> createState() => _BeautyState();
}

class _BeautyState extends State<Beauty> {
  int _selectedPet = 0;
  void _setPet(item) {
    setState(() {
      _selectedPet = item;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          const Header("Dịch vụ Spa"),
          AppScollview(children: [
            Container(
              padding: padding_small,
              margin: EdgeInsets.symmetric(
                  horizontal: padding_small.left, vertical: padding_tiny.top),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                  borderRadius: const BorderRadius.all(radius_small)),
              child: Column(children: [
                const ContainerText('Chủ thú cưng'),
                const ContainerText(
                  'Số điện thoại',
                  type: InputType.PhoneInput,
                ),
                ChoosePanel(
                  'Thú cưng',
                  _selectedPet > 0,
                  _selectedPet > 0
                      ? pets
                          .firstWhere((element) => element.id == _selectedPet)
                          .name
                      : 'Chọn thú cưng',
                  PetPanel(pets, _selectedPet, onPress: _setPet),
                ),
                ChoosePanel(
                  'Gói dịch vụ',
                  false,
                  'Chọn gói dịch vụ',
                  ComboPanel(pets, _selectedPet, onPress: _setPet),
                ),
              ]),
            ),
          ]),
        ])));
  }
}

class ContainerText extends StatelessWidget {
  final String label;
  final InputType? type;
  const ContainerText(this.label, {super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: component_height,
      margin: EdgeInsets.only(bottom: padding_small.bottom),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              label,
              size: text_size_medium,
              weight: FontWeight.w500,
              color: Colors.black54,
            ),
            AppInput(
                type: type,
                textColor: color_primary,
                placeholder: "Vui lòng nhập ${label.toLowerCase()}",
                contentPadding:
                    EdgeInsets.symmetric(vertical: padding_tiny.left))
          ]),
    );
  }
}

class ChoosePanel extends StatelessWidget {
  final String label;
  final Widget widget;
  final String value;
  final bool isValue;
  final EdgeInsets margin;
  const ChoosePanel(this.label, this.isValue, this.value, this.widget,
      {super.key, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: component_height,
      margin: EdgeInsets.only(bottom: padding_small.bottom),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              label,
              size: text_size_medium,
              weight: FontWeight.w500,
              color: Colors.black54,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: radius_small),
                    ),
                    builder: (BuildContext context) {
                      return widget;
                    });
              },
              child: Container(
                width:
                    MediaQuery.of(context).size.width - padding_small.left * 2,
                padding: EdgeInsets.only(
                    top: padding_tiny.top,
                    bottom: padding_tiny.bottom,
                    right: padding_tiny.right),
                // margin: EdgeInsets.only(bottom: padding_small.bottom),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: Colors.black26))),
                child: AppText(
                  value,
                  color: isValue ? color_primary : Colors.black26,
                  weight: FontWeight.w500,
                  size: 16,
                ),
              ),
            )
          ]),
    );
  }
}

class PetPanel extends StatelessWidget {
  final List<PetModel> items;
  final int value;
  final Function onPress;
  const PetPanel(this.items, this.value, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    const double item_size = 80;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: item_size * items.length + 55 <=
                MediaQuery.of(context).size.height / 3
            ? item_size * items.length + 55
            : MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: padding_tiny.left),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black26))),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      null,
                      color: Colors.black54,
                      size: 25,
                    ),
                    const AppHeading1Text(
                      'Thú cưng của bạn',
                      color: Colors.black54,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.black54,
                          size: 25,
                        )),
                  ]),
            ),
            AppListView(
                data: items,
                height: item_size * items.length,
                child: (context, item, index) => GestureDetector(
                      onTap: () => onPress(item.id),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: padding_regular.left),
                          height: item_size,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: padding_tiny.right),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(radius_large),
                                  ),
                                  child: ClipRRect(
                                      borderRadius:
                                          const BorderRadius.all(radius_large),
                                      child: Image.asset('assets/avatar.png',
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover))),
                              Expanded(
                                  child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppHeading2Text(
                                                  item.name,
                                                  weight: FontWeight.bold,
                                                ),
                                                AppSubTitleText(
                                                  Utils.CalculateAge(
                                                      DateTime.parse(
                                                          item.birthday)),
                                                  weight: FontWeight.w500,
                                                )
                                              ]),
                                          Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          radius_regular),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: value == item.id
                                                          ? color_primary
                                                          : Colors.black26)),
                                              child: Container(
                                                  width: 5,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              radius_regular),
                                                      color: value == item.id
                                                          ? color_primary
                                                          : Colors.black26)))
                                        ],
                                      )))
                            ],
                          )),
                    ))
          ],
        ));
  }
}

class ComboPanel extends StatelessWidget {
  final List<PetModel> items;
  final int value;
  final Function onPress;
  const ComboPanel(this.items, this.value, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.only(
                left: padding_tiny.left,
                right: padding_tiny.right,
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black26))),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      null,
                      color: Colors.black54,
                      size: 25,
                    ),
                    const AppHeading1Text(
                      'Gói dịch vụ',
                      color: Colors.black54,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.black54,
                          size: 25,
                        )),
                  ]),
            ),
            BeautyService()
          ],
        ));
  }
}

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_spa/src/pages/home/pet_service_combo_model.dart';
import 'package:pet_spa/src/pages/home/pet_service_option_model.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/checkbox.dart';
import 'package:pet_spa/src/widgets/listview.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../data/data.dart';

class BeautyService extends StatefulWidget {
  const BeautyService({super.key});

  @override
  State<BeautyService> createState() => _BeautyServiceState();
}

class _BeautyServiceState extends State<BeautyService> {
  int state = 0;
  List<int> selected_options = List.empty(growable: true);
  CarouselController carouselController = CarouselController();

  void onPressTab(int _state) {
    setState(() {
      state = _state;
      selected_options.clear();
      carouselController.animateToPage(_state,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn);
    });
  }

  void setSelectedItem(int id) {
    setState(() {
      if (selected_options.contains(id)) {
        selected_options.remove(id);
      } else {
        selected_options.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    double _height = 47;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  combos.length,
                  (index) => Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: state == index ? 3 : 2,
                                  color: state == index
                                      ? color_primary
                                      : Colors.black12))),
                      child: AppButton(
                          type: ButtonType.TextButton,
                          size: text_size_sub,
                          text: combos[index].name,
                          backgroundColor: Colors.transparent,
                          textColor:
                              state == index ? color_primary : Colors.black54,
                          width: width,
                          height: _height,
                          onPress: () {
                            onPressTab(index);
                          })))),
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: Utils.height(context) -
                  _height -
                  60 -
                  3 -
                  120 -
                  status_bar_height -
                  padding_bottom,
              initialPage: 0,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                Timer(
                    const Duration(milliseconds: 500),
                    () => setState(() {
                          state = index;
                          selected_options.clear();
                        }));
              },
            ),
            items: combos
                .map((e) => Item(
                      e,
                      selected_options,
                      onSelectOption: setSelectedItem,
                    ))
                .toList(),
          ),
          const Bugdet(1200000)
        ]);
  }
}

class Item extends StatelessWidget {
  final PetServiceComboModel item;
  final List<int> selectedOptions;
  final Function onSelectOption;
  const Item(this.item, this.selectedOptions,
      {super.key, required this.onSelectOption});

  List<Widget> renderWidget(List<String> data) {
    List<Widget> widgets = List.empty(growable: true);
    for (var i = 0; i < data.length; i += 2) {
      List<Widget> children = [
        Expanded(
            child: Row(children: [
          const Icon(
            Icons.circle,
            color: color_primary,
            size: 6,
          ),
          Flexible(
              child: AppSubTitleText(
            data[i],
            margin: EdgeInsets.only(left: padding_tiny.left),
          ))
        ]))
      ];
      if (i + 1 < data.length) {
        children.add(Expanded(
            child: Row(children: [
          const Icon(
            Icons.circle,
            color: color_primary,
            size: 6,
          ),
          Flexible(
              child: AppSubTitleText(
            data[i + 1],
            margin: EdgeInsets.only(left: padding_tiny.left),
          ))
        ])));
      }
      widgets.add(Padding(
          padding: EdgeInsets.only(top: padding_tiny.top),
          child: Row(children: children)));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppScollview(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: padding_small,
                margin: EdgeInsets.only(
                    left: padding_small.left,
                    right: padding_small.left,
                    top: padding_small.top,
                    bottom: padding_tiny.bottom),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: const BorderRadius.all(radius_small)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppSubTitleText(
                      'Dịch vụ trong gói',
                      color: Colors.black54,
                    ),
                    ...renderWidget(item.items)
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: padding_small,
                margin: EdgeInsets.symmetric(
                    horizontal: padding_small.left, vertical: padding_tiny.top),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: const BorderRadius.all(radius_small)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppSubTitleText(
                      'Dịch vụ thêm',
                      color: Colors.black54,
                    ),
                    ...List.generate(
                        options.length,
                        (index) => Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width -
                                  padding_regular.left * 2,
                              height: 50,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppCheckbox(
                                      options[index].name,
                                      selectedOptions
                                          .contains(options[index].id),
                                      size: 20,
                                      textSize: text_size_sub,
                                      onPress: () =>
                                          onSelectOption(options[index].id),
                                    ),
                                    AppLabelMediumText(Utils.FormatCurrency(
                                        options[index].value))
                                  ]),
                            ))
                  ],
                ))
          ],
        ),
      ],
    );
  }
}

class Bugdet extends StatelessWidget {
  final double value;
  const Bugdet(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: padding_regular.left,
          right: padding_regular.right,
          bottom: padding_bottom),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: Colors.black12))),
      child: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppHeading2Text(
                  'Tổng tiền',
                  color: Colors.black54,
                ),
                AppHeading1Text(
                  Utils.FormatCurrency(value),
                  color: color_red,
                )
              ],
            )),
        AppButton(
          type: ButtonType.TextButton,
          width: Utils.width(context),
          height: 50,
          backgroundColor: color_primary,
          radius: radius_small,
          text: 'Sử dụng',
          onPress: () {},
        )
      ]),
    );
  }
}

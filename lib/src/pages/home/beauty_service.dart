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
  final Function onPress;
  const BeautyService({super.key, required this.onPress});

  @override
  State<BeautyService> createState() => _BeautyServiceState();
}

class _BeautyServiceState extends State<BeautyService> {
  int state = 0;
  bool disabledTab = false;
  List<int> selected_options = List.empty(growable: true);
  CarouselController carouselController = CarouselController();

  void onPressTab(int _state) {
    int time = 400;
    if (!disabledTab) {
      setState(() {
        state = _state;
        disabledTab = true;
        selected_options.clear();
        carouselController.animateToPage(_state,
            duration: Duration(milliseconds: time),
            curve: Curves.fastOutSlowIn);
        Timer(
            Duration(milliseconds: time),
            () => setState(() {
                  disabledTab = false;
                }));
      });
    }
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  combos.length,
                  (index) => tabItem(
                        combos[index],
                        state == index,
                        onPress: () => onPressTab(index),
                      ))),
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: Utils.height(context) -
                  50 -
                  150 -
                  status_bar_height -
                  padding_large.top,
              initialPage: 0,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                if (state - index == 0 || reason.name == "manual") {
                  Timer(
                      const Duration(milliseconds: 200),
                      () => setState(() {
                            state = index;
                            selected_options.clear();
                          }));
                }
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
          Bugdet(combos[state].cost, onSubmit: () {
            widget.onPress(combos[state].id, selected_options);
          })
        ]);
  }
}

class tabItem extends StatelessWidget {
  final PetServiceComboModel item;
  final bool active;
  final Function onPress;
  const tabItem(this.item, this.active, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    double height = 50;
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 3, color: active ? color_primary : Colors.white))),
        child: AppText(
          item.name,
          size: text_size_sub,
          color: active ? color_primary : Colors.black45,
        ),
      ),
    );
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
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(
            Icons.star,
            color: color_primary,
            size: 15,
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
            Icons.star,
            color: color_primary,
            size: 15,
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
                    color: Colors.white,
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
                margin: EdgeInsets.only(
                    left: padding_small.left,
                    right: padding_small.left,
                    top: padding_tiny.top,
                    bottom: padding_regular.bottom),
                decoration: BoxDecoration(
                    color: Colors.white,
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
  final Function onSubmit;
  const Bugdet(this.value, {super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: padding_regular.left),
        alignment: Alignment.centerLeft,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: padding_tiny.top),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    'Tổng cộng',
                    size: text_size_sub,
                    color: Colors.black54,
                  ),
                  AppText(
                    Utils.FormatCurrency(value),
                    size: text_size_heading_2,
                    color: color_red,
                  ),
                ],
              )),
          AppButton(
            type: ButtonType.TextButton,
            width: Utils.width(context),
            height: 40,
            size: text_size_medium,
            backgroundColor: color_primary,
            radius: radius_tiny,
            text: 'Sử dụng',
            onPress: () => onSubmit(),
          )
        ]));
  }
}

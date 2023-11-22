import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/models/store_model.dart';
import 'package:pet_spa/src/pages/stores/store_detail.dart';
import 'package:pet_spa/src/pages/widgets/header.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/input.dart';

import '../../theme/Color.dart';
import '../../ultis/utils.dart';
import '../../widgets/bottom.dart';
import '../../widgets/scrollview.dart';
import '../../widgets/text.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

double height = 90;

class _StoresState extends State<Stores> {
  String searchValue = "";

  void _onSearch(text) {
    setState(() {
      searchValue = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<StoreModel> recents = booked_stores
        .where((element) => element.name.contains(searchValue))
        .toList();
    return Scaffold(
        backgroundColor: background_color,
        body: SizedBox(
            width: Utils.width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: status_bar_height + padding_tiny.top,
                        left: padding_small.left,
                        right: padding_small.right,
                        bottom: padding_tiny.bottom),
                    child: AppInput(
                      width: 20,
                      height: 50,
                      border: 1.5,
                      borderColor: Colors.black26,
                      icon: const Icon(
                        Icons.search_rounded,
                        size: icon_medium,
                        color: Colors.black45,
                      ),
                      placeholder: 'Tìm kiếm',
                      placeholderColor: Colors.black45,
                      onChangeText: _onSearch,
                    )),
                AppScollview(children: [
                  const HeaderTitle('Cửa hàng gần đây'),
                  ...List.generate(
                      recents.length, (index) => Item(recents[index], index)),
                  const HeaderTitle('Các cửa hàng khác'),
                  ...List.generate(
                      stores.length, (index) => Item(stores[index], index)),
                  const Bottom()
                ])
              ],
            )));
  }
}

class Item extends StatelessWidget {
  final StoreModel store;
  final int index;
  const Item(this.store, this.index, {super.key});

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
              return StoreDetail(store);
            }),
        child: Container(
          width: Utils.width(context) - padding_small.left * 2,
          height: height,
          padding: padding_tiny,
          margin: EdgeInsets.only(
              left: padding_small.left,
              right: padding_small.right,
              bottom: index == stores.length - 1 ? 0 : padding_tiny.bottom / 2,
              top: index == 0 ? 0 : padding_tiny.top / 2),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: const BorderRadius.all(radius_small)),
          child: Row(
            children: [
              Container(
                width: height - padding_tiny.top * 2,
                height: height - padding_tiny.top * 2,
                margin: EdgeInsets.only(right: padding_small.right),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(radius_small),
                  child: Image.asset(
                    'assets/location_test.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSubTitleText(store.name),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLabelText(store.address,
                          color: Colors.black87, line: 2),
                      AppLabelText(
                        'cách đây ${store.distance} ${store.unitdistance} - ${store.time} ${store.unittime}',
                        color: Colors.black54,
                      )
                    ],
                  ))
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/data/data.dart';
import 'package:pet_spa/src/models/store_model.dart';
import 'package:pet_spa/src/pages/widgets/header.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/input.dart';

import '../../theme/Color.dart';
import '../../ultis/utils.dart';
import '../../widgets/scrollview.dart';
import '../../widgets/text.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

double height = 90;

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(
          children: [
            const Header("Hệ thống cửa hàng"),
            Container(
                color: Colors.white,
                padding: padding_tiny,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: Utils.width(context) - padding_tiny.left * 2,
                        height: 50,
                        padding: padding_tiny,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(radius_tiny),
                            border:
                                Border.all(width: 1, color: Colors.black26)),
                        child: Row(children: [
                          const Icon(
                            Icons.search_rounded,
                            size: icon_medium,
                            color: Colors.black45,
                          ),
                          AppSubTitleText(
                            'Tìm kiếm',
                            margin: EdgeInsets.only(left: padding_tiny.left),
                            weight: FontWeight.w500,
                            color: Colors.black45,
                          )
                        ]),
                      ),
                    )
                  ],
                )),
            AppScollview(children: [
              const HeaderTitle('Cửa hàng đặt gần đây'),
              ...List.generate(book_locations.length,
                  (index) => LocationItem(book_locations[index], index)),
              const HeaderTitle('Các Cửa hàng khác'),
              ...List.generate(
                  stores.length, (index) => LocationItem(stores[index], index))
            ])
          ],
        ));
  }
}

class LocationItem extends StatelessWidget {
  final StoreModel location;
  final int index;
  const LocationItem(this.location, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: radius_small),
            ),
            builder: (BuildContext context) {
              return LocationInfo(location);
            }),
        child: Container(
          width: Utils.width(context) - padding_regular.left * 2,
          height: height,
          padding: padding_tiny,
          margin: EdgeInsets.only(
              left: padding_regular.left,
              right: padding_regular.right,
              bottom: index == stores.length - 1
                  ? padding_regular.bottom
                  : padding_tiny.bottom / 2,
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
                  AppSubTitleText(location.name),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLabelText(location.address,
                          color: Colors.black87, line: 2),
                      AppLabelText(
                        'cách đây ${location.distance} ${location.unitdistance} - ${location.time} ${location.unittime}',
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

class LocationInfo extends StatelessWidget {
  final StoreModel location;
  const LocationInfo(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.width(context),
      height: Utils.height(context) - padding_large.top * 2,
      child: Column(children: [
        CarouselSlider(
          options: CarouselOptions(
            height: Utils.height(context) / 3,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
          ),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: padding_tiny,
                    decoration: const BoxDecoration(
                        color: color_secondary_2,
                        borderRadius: BorderRadius.all(radius_small)),
                    child: Image.network(
                        'https://images7.alphacoders.com/105/1051642.jpg',
                        fit: BoxFit.fill));
              },
            );
          }).toList(),
        ),
        Container(
          color: Colors.amber,
          child: Padding(
            padding: padding_regular,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppSubTitleText(location.name),
            ]),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';

class SlideBanner extends StatelessWidget {
  const SlideBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: padding_regular.top),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 180,
            initialPage: 0,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
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
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(radius_small),
                        child: Image.asset('assets/banner.png',
                            fit: BoxFit.fill)));
              },
            );
          }).toList(),
        ));
  }
}

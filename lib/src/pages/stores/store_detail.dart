import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/store_model.dart';
import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../ultis/utils.dart';
import '../../widgets/text.dart';

class StoreDetail extends StatelessWidget {
  final StoreModel store;
  const StoreDetail(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = 320;
    return Container(
      width: Utils.width(context),
      height: Utils.height(context) - padding_large.top * 2,
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(radius_medium)),
      child: Column(children: [
        Container(
          width: Utils.width(context),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: padding_regular.left, vertical: padding_small.top),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSubTitleText(
                          store.name,
                          color: Colors.black54,
                        ),
                        AppHeading2Text(
                          store.address,
                          color: Colors.black87,
                        ),
                        const AppLabelText(
                          'Giờ mở cửa: 7:00 - 21:30',
                          color: Colors.black54,
                        ),
                      ]),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      size: icon_large,
                      color: Colors.black54,
                    ),
                  )
                ]),
          ),
        ),
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: Container(
                  width: icon_large * 1.25,
                  height: icon_large * 1.25,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(radius_tiny)),
                  child: const Icon(
                    Icons.location_on_outlined,
                    size: icon_medium,
                    color: Colors.black87,
                  )),
            ),
            Container(
                height: 80,
                width: Utils.width(context) - 80 - padding_regular.right,
                padding: const EdgeInsets.symmetric(
                    vertical: (80 - icon_large * 1.45) / 2),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(
                      '${store.address}, ${store.ward}, ${store.district}',
                      size: text_size_label,
                      color: Colors.black87,
                    ),
                    AppText(
                      '${store.city}, ${store.country}',
                      size: text_size_label,
                      color: Colors.black87,
                    )
                  ],
                )),
          ],
        ),
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: Container(
                  width: icon_large * 1.25,
                  height: icon_large * 1.25,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(radius_tiny)),
                  child: const Icon(
                    Icons.phone,
                    size: icon_medium,
                    color: Colors.black87,
                  )),
            ),
            Container(
                height: 80,
                alignment: Alignment.centerLeft,
                width: Utils.width(context) - 80 - padding_regular.right,
                padding: const EdgeInsets.symmetric(
                    vertical: (80 - icon_large * 1.45) / 2),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: AppText(
                  'Liên hệ tại ${store.phone}',
                  size: text_size_label,
                  color: Colors.black87,
                )),
          ],
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/store_model.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../widgets/text.dart';

class StoreContainer extends StatefulWidget {
  final StoreModel model;
  final Function onPress;
  const StoreContainer(this.model, {super.key, required this.onPress});

  @override
  State<StoreContainer> createState() => _StoreContainerState();
}

class _StoreContainerState extends State<StoreContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppText(
            'Cửa hàng',
            size: text_size_medium,
            weight: FontWeight.w500,
            color: Colors.black54,
          ),
          GestureDetector(
            onTap: () => showModalBottomSheet(
                context: context,
                useSafeArea: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: radius_small),
                ),
                builder: (BuildContext context) {
                  return Container(
                      decoration: const BoxDecoration(
                          color: background_color,
                          borderRadius:
                              BorderRadius.vertical(top: radius_medium)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          status_bar_height -
                          padding_large.top,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: padding_tiny.left),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.vertical(top: radius_medium)),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    null,
                                    color: Colors.black54,
                                    size: 25,
                                  ),
                                  const AppHeading1Text(
                                    'Cửa hàng',
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
                        ],
                      ));
                }),
            child: AppText(
              widget.model.name,
              color: color_primary,
              weight: FontWeight.w500,
              size: text_size_medium,
            ),
          ),
        ]);
  }
}

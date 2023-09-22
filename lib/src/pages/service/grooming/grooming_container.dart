import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/grooming_combo_model.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/pages/service/grooming/grooming_combo.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/text.dart';

class GroomingContainer extends StatefulWidget {
  final GroomingComboModel model;
  final Function onPress;
  const GroomingContainer(this.model, {super.key, required this.onPress});

  @override
  State<GroomingContainer> createState() => _GroomingContainerState();
}

class _GroomingContainerState extends State<GroomingContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppText(
            'Gói dịch vụ',
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
                          // GroomingCombo(onPress: widget.onPress)
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

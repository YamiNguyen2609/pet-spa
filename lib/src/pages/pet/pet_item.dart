import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/pet/pet_detail.dart';
import 'package:pet_spa/src/pages/pet/pet_model.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/text.dart';

class PetItem extends StatelessWidget {
  final PetModel item;
  final int index;
  final Function onPress;
  const PetItem(this.item, this.index, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    return GestureDetector(
        onTap: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => PetDetail(item))),
        child: Container(
          padding: padding_tiny,
          margin: EdgeInsets.symmetric(
              horizontal: padding_small.left, vertical: padding_tiny.top),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: color_secondary_2),
              borderRadius: const BorderRadius.all(radius_tiny)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(right: padding_small.right),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(radius_tiny),
                    ),
                    child: Image.asset(
                      'assets/launcher.png',
                      width: 160,
                      height: 100,
                    )),
                Expanded(
                    child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppSubTitleText(item.name),
                      Row(
                        children: [
                          const SizedBox(
                            height: 70,
                            width: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AppLabelText(
                                  "Age",
                                  color: background_color,
                                ),
                                AppLabelText("Gender", color: background_color),
                                AppLabelText("Color", color: background_color),
                                AppLabelText("Breed", color: background_color),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AppLabelText(Utils.CalculateAge(
                                      DateTime.parse(item.birthday))),
                                  AppLabelText(item.gender ? 'Female' : 'Male'),
                                  AppLabelText(item.color),
                                  AppLabelText(item.breed),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                )),
                GestureDetector(
                  onTap: () => onPress(item.id),
                  child: Container(
                      child: item.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: color_red,
                            )
                          : const Icon(
                              Icons.favorite_border_rounded,
                              color: color_secondary_2,
                            )),
                )
              ]),
        ));
  }
}

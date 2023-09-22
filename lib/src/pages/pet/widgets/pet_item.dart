import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/pet/pet_detail.dart';
import 'package:pet_spa/src/models/pet_model.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/text.dart';

class PetItem extends StatelessWidget {
  final PetModel item;
  final int index;
  final int length;
  const PetItem(this.item, this.index, this.length, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => PetDetail(item))),
        child: Container(
          width: 200,
          margin: EdgeInsets.only(
            left: index == 0 ? padding_regular.left : padding_tiny.left,
            right:
                index == length - 1 ? padding_regular.left : padding_tiny.left,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(radius_small)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: radius_small),
                child: Image.asset('assets/avatar.png'),
              ),
              Padding(
                  padding: padding_tiny,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          item.name,
                          size: text_size_sub,
                          color: Colors.black87,
                        ),
                        item.gender
                            ? const Icon(
                                Icons.female_rounded,
                                color: color_pink,
                                size: icon_regular,
                              )
                            : const Icon(
                                Icons.male_rounded,
                                color: color_primary,
                                size: icon_regular,
                              )
                      ])),
            ],
          ),
        ));
  }
}

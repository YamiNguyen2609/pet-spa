import 'package:flutter/material.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/models/pet_model.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class PetContainer extends StatefulWidget {
  final PetModel model;
  final Function onPress;
  const PetContainer(this.model, {super.key, required this.onPress});

  @override
  State<PetContainer> createState() => _PetContainerState();
}

class _PetContainerState extends State<PetContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppText(
          'Thú cưng',
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
                  return ContainerPanel(widget.model, onPress: widget.onPress);
                }),
            child: AppText(
              widget.model.name,
              color: color_primary,
              weight: FontWeight.w500,
              size: text_size_medium,
            ))
      ],
    );
  }
}

double height_item = 60;

class ContainerPanel extends StatelessWidget {
  final PetModel? model;
  final Function onPress;
  const ContainerPanel(this.model, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    var cats = pets;
    var dogs = pets;
    return Container(
      width: Utils.width(context),
      height: Utils.height(context) * 2 / 3,
      decoration: const BoxDecoration(
          color: background_color,
          borderRadius: BorderRadius.vertical(top: radius_small)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: Utils.width(context),
          padding: EdgeInsets.symmetric(
              vertical: padding_small.top, horizontal: padding_small.left),
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppHeading2Text(
                'Thú cưng của bạn',
                weight: FontWeight.w500,
                color: Colors.black87,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.black87,
                    size: icon_medium,
                  )),
            ],
          ),
        ),
        AppScollview(children: [
          const HeaderTitle('Mèo của bạn'),
          Container(
              width: Utils.width(context) - padding_large.left * 2,
              height: height_item * cats.length,
              margin: EdgeInsets.symmetric(horizontal: padding_large.left),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(radius_small)),
              child: ListView.separated(
                  itemCount: cats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Item(cats[index], index, cats.length,
                        cats[index].id == (model == null ? -1 : model!.id),
                        onPress: () => onPress(cats[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider())),
          const HeaderTitle('Chó của bạn'),
          Container(
              width: Utils.width(context) - padding_large.left * 2,
              height: height_item * dogs.length,
              margin: EdgeInsets.symmetric(horizontal: padding_large.left),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(radius_small)),
              child: ListView.builder(
                  itemCount: dogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Item(
                      dogs[index],
                      index,
                      dogs.length,
                      dogs[index].id == (model == null ? -1 : model!.id),
                      onPress: () => onPress(dogs[index]),
                    );
                  })),
        ])
      ]),
    );
  }
}

class Item extends StatelessWidget {
  final PetModel item;
  final int index;
  final int length;
  final bool selected;
  final Function onPress;
  const Item(this.item, this.index, this.length, this.selected,
      {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPress(),
        child: Container(
          height: height_item,
          decoration: BoxDecoration(
              color: selected ? color_secondary_2 : Colors.transparent,
              borderRadius: BorderRadius.vertical(
                  top: index == 0 ? radius_small : Radius.zero,
                  bottom: index == length - 1 ? radius_small : Radius.zero)),
          padding: EdgeInsets.symmetric(horizontal: padding_small.left),
          child: Row(children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(radius_large),
                child: Image.asset(
                  'assets/avatar.png',
                ),
              ),
            ),
            AppLabelMediumText(
              item.name,
              weight: FontWeight.w500,
              color: Colors.black87,
              margin: EdgeInsets.only(left: padding_tiny.left),
            )
          ]),
        ));
  }
}

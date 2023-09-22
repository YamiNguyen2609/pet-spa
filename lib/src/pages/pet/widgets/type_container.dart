import 'package:flutter/material.dart';
import 'package:pet_spa/src/widgets/input.dart';
import '../../../models/type_pet_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/title.dart';

class TypeContainer extends StatefulWidget {
  final TypePetModel? item;
  const TypeContainer(this.item, {super.key});

  @override
  State<TypeContainer> createState() => _TypeContainerState();
}

class _TypeContainerState extends State<TypeContainer> {
  bool isFilter = false;
  void _collapseFilter() {
    setState(() {
      isFilter = !isFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Utils.width(context),
        height: Utils.height(context),
        decoration: const BoxDecoration(
            color: background_color,
            borderRadius: BorderRadius.vertical(top: radius_small)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: Utils.width(context),
            padding: EdgeInsets.symmetric(
                vertical: padding_small.top, horizontal: padding_small.left),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppHeading2Text(
                  'Chủng loại thú cưng',
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
          Container(
              padding: EdgeInsets.only(
                  left: padding_tiny.left,
                  right: padding_tiny.right,
                  top: padding_tiny.top),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppInput(
                    type: InputType.TextInput,
                    placeholder: 'mèo ba tư, husky, ...',
                    border: 1,
                    width: Utils.width(context) - padding_tiny.left * 2 - 40,
                    backgroundColor: Colors.white,
                    contentPadding: padding_tiny,
                  ),
                  GestureDetector(
                    onTap: _collapseFilter,
                    child: const Icon(
                      Icons.filter_alt_rounded,
                      color: color_primary,
                      size: icon_large,
                    ),
                  )
                ],
              )),
          AnimatedContainer(
              width: Utils.width(context),
              height: isFilter ? 40 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: padding_tiny.top),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding_tiny.left),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding_tiny.left,
                                vertical: padding_tiny.top / 2),
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.all(radius_large)),
                            child: const AppText(
                              'Tất cả',
                              size: text_size_medium,
                              color: Colors.black87,
                            )),
                      )
                    ],
                  ))),
          AppScollview(children: [
            const HeaderTitle('Chủng loại mèo'),
          ])
        ]));
  }
}

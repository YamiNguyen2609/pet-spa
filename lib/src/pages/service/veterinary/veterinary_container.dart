import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/veterinary_model.dart';
import 'package:pet_spa/src/data/data.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/widgets/card.dart';

import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/checkbox.dart';
import '../../../widgets/text.dart';

class VeterinaryContainer extends StatelessWidget {
  final List<VeterinaryModel> values;
  final Function onPress;
  const VeterinaryContainer(this.values, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: padding_regular.left),
      children: List.generate(
          veterinaries.length,
          (index) => Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width -
                    padding_regular.left * 2,
                padding: EdgeInsets.only(
                    top: index == 0
                        ? padding_regular.top
                        : padding_regular.top / 2,
                    bottom: index == options.length - 1
                        ? padding_regular.top
                        : padding_regular.top / 2),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppCheckbox(
                        veterinaries[index].name,
                        values.indexWhere((element) =>
                                element.id == veterinaries[index].id) >
                            -1,
                        size: 20,
                        radius: radius_large,
                        textSize: text_size_medium,
                        onPress: () => onPress(veterinaries[index]),
                      ),
                      AppLabelMediumText(
                        Utils.FormatCurrency(veterinaries[index].value),
                        color: color_red,
                      )
                    ]),
              )),
    );
  }
}

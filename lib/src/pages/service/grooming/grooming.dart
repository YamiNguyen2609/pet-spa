import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/service/grooming/grooming_detail.dart';
import 'package:pet_spa/src/widgets/card.dart';
import '../../../data/data.dart';
import '../../../models/grooming_combo_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../theme/constant.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';

class Grooming extends StatefulWidget {
  const Grooming({super.key});

  @override
  State<Grooming> createState() => _GroomingState();
}

class _GroomingState extends State<Grooming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Dịch vụ làm đẹp"),
          AppScollview(
              children: List.generate(grooming_combos.length,
                  (index) => Item(grooming_combos[index], index)))
        ]));
  }
}

class Item extends StatelessWidget {
  final GroomingComboModel item;
  final int index;
  const Item(this.item, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> renderWidget(List<String> data) {
      List<Widget> widgets = List.empty(growable: true);
      for (var i = 0; i < data.length; i += 2) {
        List<Widget> children = [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(
                      top: i == 0 ? padding_tiny.top : padding_tiny.top / 2,
                      bottom: i == data.length - 2 ? 0 : padding_tiny.top / 2),
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    data[i],
                    size: text_size_medium,
                    color: Colors.black87,
                    weight: FontWeight.w500,
                  )))
        ];
        if (i + 1 < data.length) {
          children.add(Expanded(
              child: Container(
                  padding: EdgeInsets.only(
                      top: i == 0 ? padding_tiny.top : padding_tiny.top / 2,
                      bottom: i == data.length - 2 ? 0 : padding_tiny.top / 2),
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    data[i + 1],
                    size: text_size_medium,
                    color: Colors.black87,
                    weight: FontWeight.w500,
                  ))));
        }
        widgets.add(Row(children: children));
      }
      return widgets;
    }

    return CardContainer(
        margin: EdgeInsets.only(
            left: padding_small.left,
            right: padding_small.right,
            top: index == 0 ? 0 : padding_small.top,
            bottom:
                index == grooming_combos.length - 1 ? padding_small.top : 0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppHeading2Text(
                item.name,
                color: color_secondary_1,
                weight: FontWeight.w700,
              ),
              AppSubTitleText(
                Utils.FormatCurrency(item.cost),
                color: color_red,
                weight: FontWeight.w700,
              ),
            ],
          ),
          Divider(
            height: padding_regular.top,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: renderWidget(item.items!),
          ),
          Divider(
            height: padding_regular.top,
          ),
          AppButton(
            onPress: () => Navigator.push(context,
                CupertinoPageRoute(builder: (context) => GroomingDetail(item))),
            type: ButtonType.TextButton,
            text: 'Đặt ngay',
            backgroundColor: color_primary,
            height: 40,
            radius: radius_tiny,
          )
        ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/grooming_option_in_combo_model.dart';
import 'package:pet_spa/src/pages/service/payment/payment.dart';
import 'package:pet_spa/src/widgets/checkbox.dart';
import '../../../models/grooming_combo_model.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../theme/constant.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';
import '../../widgets/title.dart';

class GroomingDetail extends StatefulWidget {
  final GroomingComboModel grooming;
  const GroomingDetail(this.grooming, {super.key});

  @override
  State<GroomingDetail> createState() => _GroomingDetailState();
}

class _GroomingDetailState extends State<GroomingDetail> {
  List<int> option_selected = List.empty(growable: true);

  void _onSelectOption(int id) {
    if (!option_selected.contains(id)) {
      setState(() {
        option_selected.add(id);
      });
    } else {
      setState(() {
        option_selected.remove(id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double option_total = option_selected.isNotEmpty
        ? widget.grooming.options!
            .where((element) => option_selected.contains(element.id))
            .map((e) => e.value)
            .reduce((value, element) => value + element)
        : 0;
    List<GroomingOptionInComboModel> options = (option_selected.isNotEmpty
        ? widget.grooming.options!
            .where((element) => option_selected.contains(element.id))
            .toList()
        : List<GroomingOptionInComboModel>.empty());
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(widget.grooming.name),
          AppScollview(children: [
            const HeaderTitle("Dịch vụ trong gói"),
            CardContainer(
              margin: EdgeInsets.symmetric(horizontal: padding_small.left),
              children: List.generate(
                  widget.grooming.items!.length,
                  (index) => AppText(
                        widget.grooming.items![index],
                        margin: EdgeInsets.only(
                          top: index == 0 ? 0 : padding_tiny.top / 2,
                          bottom: index == widget.grooming.items!.length - 1
                              ? 0
                              : padding_tiny.top,
                        ),
                        size: text_size_medium,
                        color: Colors.black87,
                        weight: FontWeight.w500,
                      )),
            ),
            const HeaderTitle("Dịch vụ thêm"),
            CardContainer(
              margin: EdgeInsets.symmetric(horizontal: padding_small.left),
              children: List.generate(
                  widget.grooming.options!.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 0 : padding_tiny.top / 2,
                          bottom: index == widget.grooming.options!.length - 1
                              ? 0
                              : padding_tiny.top,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppCheckbox(
                                widget.grooming.options![index].name,
                                option_selected.contains(
                                    widget.grooming.options![index].id),
                                textSize: text_size_medium,
                                radius: radius_large,
                                onPress: () => _onSelectOption(
                                    widget.grooming.options![index].id),
                              ),
                              AppLabelMediumText(
                                Utils.FormatCurrency(
                                    widget.grooming.options![index].value),
                                color: color_red,
                                weight: FontWeight.w700,
                              )
                            ]),
                      )),
            ),
            SizedBox(
              height: padding_regular.top,
            )
          ]),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: padding_small.left, vertical: padding_tiny.top),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    'Gói combo',
                    size: text_size_sub,
                  ),
                  AppSubTitleText(
                    Utils.FormatCurrency(widget.grooming.cost),
                    color: color_red,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              Divider(height: padding_small.top),
              option_selected.isNotEmpty
                  ? Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            'Dịch vụ thêm',
                            size: text_size_sub,
                          ),
                          AppSubTitleText(
                            Utils.FormatCurrency(option_total),
                            color: color_red,
                            weight: FontWeight.w700,
                          )
                        ],
                      ),
                      Divider(height: padding_small.top),
                    ])
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText(
                    'Tổng cộng',
                    size: text_size_sub,
                  ),
                  AppSubTitleText(
                    Utils.FormatCurrency(widget.grooming.cost + option_total),
                    color: color_red,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              AppButton(
                onPress: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => Payment(
                            1, widget.grooming.cost + option_total,
                            grooming: GroomingComboModel(widget.grooming.id,
                                name: widget.grooming.name,
                                cost: widget.grooming.cost,
                                items: widget.grooming.items,
                                options: options)))),
                type: ButtonType.TextButton,
                text: 'Thanh toán',
                backgroundColor: color_primary,
                height: 40,
                margin: EdgeInsets.only(top: padding_small.top),
                radius: radius_tiny,
              )
            ]),
          )
        ]));
  }
}

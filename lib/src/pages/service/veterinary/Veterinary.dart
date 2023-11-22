import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../theme/constant.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/checkbox.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../../data/data.dart';
import '../../widgets/header.dart';
import '../../widgets/title.dart';

class Veterinary extends StatefulWidget {
  const Veterinary({super.key});

  @override
  State<Veterinary> createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  List<int> vaccination_selected = List.empty(growable: true);
  List<int> treatment_selected = List.empty(growable: true);

  void _onSelectVaccination(int id) {
    if (!vaccination_selected.contains(id)) {
      setState(() {
        vaccination_selected.add(id);
      });
    } else {
      setState(() {
        vaccination_selected.remove(id);
      });
    }
  }

  void _onSelectTreatment(int id) {
    if (!treatment_selected.contains(id)) {
      setState(() {
        treatment_selected.add(id);
      });
    } else {
      setState(() {
        treatment_selected.remove(id);
      });
    }
  }

  void _onSubmit() {
    if (vaccination_selected.isEmpty && treatment_selected.isEmpty) return;
  }

  @override
  Widget build(BuildContext context) {
    double vaccination_total = vaccination_selected.isNotEmpty
        ? veterinaries
            .where((element) => vaccination_selected.contains(element.id))
            .map((e) => e.value)
            .reduce((value, element) => value + element)
        : 0;
    double treatment_total = treatment_selected.isNotEmpty
        ? veterinaries
            .where((element) => treatment_selected.contains(element.id))
            .map((e) => e.value)
            .reduce((value, element) => value + element)
        : 0;
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Dịch vụ chăm sóc"),
          AppScollview(children: [
            const HeaderTitle("Tiêm chủng"),
            CardContainer(
                margin: EdgeInsets.symmetric(horizontal: padding_small.left),
                children: List.generate(
                    veterinaries.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0 : padding_tiny.top / 2,
                            bottom: index == veterinaries.length - 1
                                ? 0
                                : padding_tiny.top,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppCheckbox(
                                  veterinaries[index].name,
                                  vaccination_selected
                                      .contains(veterinaries[index].id),
                                  textSize: text_size_medium,
                                  radius: radius_large,
                                  onPress: () => _onSelectVaccination(
                                      veterinaries![index].id),
                                ),
                                AppLabelMediumText(
                                  Utils.FormatCurrency(
                                      veterinaries[index].value),
                                  color: color_red,
                                  weight: FontWeight.w700,
                                )
                              ]),
                        ))),
            const HeaderTitle("Vệ sinh - Điều trị"),
            CardContainer(
                margin: EdgeInsets.symmetric(horizontal: padding_small.left),
                children: List.generate(
                    veterinaries.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0 : padding_tiny.top / 2,
                            bottom: index == veterinaries.length - 1
                                ? 0
                                : padding_tiny.top,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppCheckbox(
                                  veterinaries[index].name,
                                  treatment_selected
                                      .contains(veterinaries[index].id),
                                  textSize: text_size_medium,
                                  radius: radius_large,
                                  onPress: () => _onSelectTreatment(
                                      veterinaries[index].id),
                                ),
                                AppLabelMediumText(
                                  Utils.FormatCurrency(
                                      veterinaries[index].value),
                                  color: color_red,
                                  weight: FontWeight.w700,
                                )
                              ]),
                        ))),
            SizedBox(
              height: padding_regular.top,
            )
          ]),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: padding_small.left, vertical: padding_tiny.top),
            child: Column(children: [
              vaccination_selected.isNotEmpty
                  ? Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            'Tiêm chủng',
                            size: text_size_sub,
                          ),
                          AppSubTitleText(
                            Utils.FormatCurrency(vaccination_total),
                            color: color_red,
                            weight: FontWeight.w700,
                          )
                        ],
                      ),
                      Divider(height: padding_small.top),
                    ])
                  : SizedBox(),
              treatment_selected.isNotEmpty
                  ? Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            'Vệ sinh - Điều trị',
                            size: text_size_sub,
                          ),
                          AppSubTitleText(
                            Utils.FormatCurrency(treatment_total),
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
                    Utils.FormatCurrency(vaccination_total + treatment_total),
                    color: color_red,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              AppButton(
                onPress: () => {},
                type: ButtonType.TextButton,
                text: 'Thanh toán',
                backgroundColor: vaccination_total + treatment_total > 0
                    ? color_primary
                    : Colors.black26,
                height: 40,
                margin: EdgeInsets.only(top: padding_small.top),
                radius: radius_tiny,
              )
            ]),
          )
        ]));
  }
}

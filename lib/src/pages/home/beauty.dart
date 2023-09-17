import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/combo_service_model.dart';
import 'package:pet_spa/src/models/option_service_model.dart';
import 'package:pet_spa/src/pages/widgets/header.dart';
import 'package:pet_spa/src/pages/home/widgets/pet_container.dart';
import 'package:pet_spa/src/pages/home/widgets/pickup_container.dart';
import 'package:pet_spa/src/pages/home/widgets/service_container.dart';
import 'package:pet_spa/src/pages/home/widgets/store_container.dart';
import 'package:pet_spa/src/pages/home/widgets/time_service.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/pages/pet/pet_model.dart';
import 'package:pet_spa/src/pages/widgets/verify_confirm.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/listview.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';

import '../../models/store_model.dart';
import '../../ultis/utils.dart';
import '../../widgets/card.dart';
import '../../widgets/text.dart';
import '../data/data.dart';

const double component_height = 71;

class Beauty extends StatefulWidget {
  const Beauty({super.key});

  @override
  State<Beauty> createState() => _BeautyState();
}

class _BeautyState extends State<Beauty> {
  PetModel _selectedPet = pets[0];
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  List<OptionServiceModel> _selectedOptions = List.empty(growable: true);
  double total_options_cost = 0;
  ComboServiceModel _selectedCombo = combos[0];
  StoreModel _selectedLocation = stores[0];
  bool isPickupAtHome = true;
  void _setPet(item) {
    setState(() {
      _selectedPet = item;
      Navigator.pop(context);
    });
  }

  void _setCombo(ComboServiceModel item, List<int> options) {
    setState(() {
      _selectedCombo = item;
      _selectedOptions = item.options
          .where((element) => options.contains(element.id))
          .toList();
      total_options_cost = 0;
      if (_selectedOptions.isNotEmpty)
        total_options_cost = _selectedOptions
            .map((e) => e.value)
            .reduce((value, element) => value + element);

      Navigator.pop(context);
    });
  }

  void _setDateTime(date, time) {
    String x = "";
    setState(() {
      _date = date;
      _time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Dịch vụ Spa"),
          AppScollview(children: [
            const HeaderTitle('Thông tin'),
            CardContainer(children: [
              PetContainer(_selectedPet, onPress: _setPet),
            ]),
            const HeaderTitle('Hệ thống cửa hàng'),
            CardContainer(
              children: [
                StoreContainer(_selectedLocation, onPress: () {}),
                Divider(
                  height: padding_large.top,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        'Tự đến cửa hàng',
                        size: text_size_medium,
                        weight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      SizedBox(
                          width: 45,
                          height: 30,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: CupertinoSwitch(
                                  value: isPickupAtHome,
                                  activeColor: color_primary,
                                  onChanged: (bool value) => setState(() {
                                        isPickupAtHome = value;
                                      }))))
                    ]),
                AnimatedContainer(
                    width: Utils.width(context) - padding_small.left * 4,
                    height: isPickupAtHome ? 0 : 44 + padding_tiny.top,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: padding_tiny.top),
                    child: PickupContainer(_selectedLocation, onPress: () {})),
                Divider(
                  height: padding_large.top,
                ),
                TimeService(_date, _time, onChange: _setDateTime),
              ],
            ),
            const HeaderTitle('Dịch vụ'),
            CardContainer(children: [
              ServiceContainer(
                _selectedCombo,
                onPress: _setCombo,
              ),
            ]),
            _selectedOptions.isNotEmpty
                ? Column(children: [
                    SizedBox(
                      height: padding_regular.top,
                    ),
                    CardContainer(
                      children: List.generate(
                          _selectedOptions.length,
                          (index) => Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width -
                                    padding_regular.left * 2,
                                padding: EdgeInsets.only(
                                    top: padding_regular.top / 2,
                                    bottom: padding_regular.top / 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppLabelMediumText(
                                        _selectedOptions[index].name,
                                        color: Colors.black54,
                                        weight: FontWeight.w500),
                                    AppLabelMediumText(
                                      Utils.FormatCurrency(
                                          options[index].value),
                                      color: color_red,
                                    )
                                  ],
                                ),
                              )),
                    )
                  ])
                : const SizedBox(),
            const HeaderTitle('Thanh toán'),
            CardContainer(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Gói dịch vụ',
                    color: Colors.black54, weight: FontWeight.w500),
                AppLabelMediumText(
                  Utils.FormatCurrency(_selectedCombo.cost),
                  color: color_red,
                )
              ]),
              Divider(
                height: padding_large.top,
              ),
              _selectedOptions.isNotEmpty
                  ? Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppLabelMediumText('Dịch vụ tùy chọn',
                                color: Colors.black54, weight: FontWeight.w500),
                            AppLabelMediumText(
                              Utils.FormatCurrency(total_options_cost),
                              color: color_red,
                            )
                          ]),
                      Divider(
                        height: padding_large.top,
                      )
                    ])
                  : SizedBox(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Tổng cộng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppLabelMediumText(
                  Utils.FormatCurrency(
                      _selectedCombo.cost + total_options_cost),
                  color: color_red,
                )
              ]),
            ]),
          ]),
          AppButton(
              type: ButtonType.TextButton,
              text: 'Tiếp tục',
              backgroundColor: color_primary,
              margin: padding_regular,
              height: 50,
              radius: radius_large,
              onPress: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const VerifyConfirm())))
        ]));
  }
}

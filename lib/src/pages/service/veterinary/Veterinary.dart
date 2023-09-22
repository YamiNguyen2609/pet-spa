import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/models/veterinary_model.dart';
import 'package:pet_spa/src/pages/service/veterinary/veterinary_container.dart';

import '../../../models/store_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../../data/data.dart';
import '../../../models/pet_model.dart';
import '../../widgets/header.dart';
import '../../widgets/pet_container.dart';
import '../../widgets/pickup_container.dart';
import '../grooming/grooming_container.dart';
import '../../widgets/store_container.dart';
import '../../widgets/time_container.dart';
import '../../widgets/title.dart';
import '../../widgets/verify_confirm.dart';

class Veterinary extends StatefulWidget {
  const Veterinary({super.key});

  @override
  State<Veterinary> createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  PetModel _selectedPet = pets[0];
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  StoreModel _selectedLocation = stores[0];
  List<VeterinaryModel> _selectedVeterinaries = List.empty(growable: true);
  bool isPickupAtHome = true;
  void _setPet(item) {
    setState(() {
      _selectedPet = item;
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

  void _setVeterinaries(VeterinaryModel item) {
    setState(() {
      var index =
          _selectedVeterinaries.indexWhere((element) => element.id == item.id);
      if (index == -1) {
        _selectedVeterinaries.add(item);
      } else {
        _selectedVeterinaries.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Dịch vụ chăm sóc"),
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
                TimeContainer(_date, _time, onChange: _setDateTime),
              ],
            ),
            const HeaderTitle('Dịch vụ'),
            VeterinaryContainer(_selectedVeterinaries,
                onPress: _setVeterinaries),
            const HeaderTitle('Thanh toán'),
            CardContainer(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Tổng cộng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppLabelMediumText(
                  Utils.FormatCurrency(_selectedVeterinaries.isNotEmpty
                      ? _selectedVeterinaries
                          .map((e) => e.value)
                          .reduce((value, element) => value + element)
                      : 0),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart';
import '../../../models/grooming_combo_model.dart';
import '../../../models/pet_model.dart';
import '../../../models/store_model.dart';
import '../../../models/veterinary_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';
import '../../widgets/pet_container.dart';
import '../../widgets/pickup_container.dart';
import '../../widgets/store_container.dart';
import '../../widgets/time_container.dart';
import '../../widgets/title.dart';

class Payment extends StatefulWidget {
  final int state;
  final GroomingComboModel? grooming;
  final VeterinaryModel? veterinary;
  const Payment(this.state, {super.key, this.grooming, this.veterinary});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  PetModel _selectedPet = pets[0];
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  double total_options_cost = 0;
  StoreModel _selectedStore = stores[0];
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

  @override
  Widget build(BuildContext context) {
    String serviceName = widget.state == 0
        ? 'Lưu trú'
        : (widget.state == 1 ? 'Làm đẹp' : 'Khám bệnh');
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Thanh toán"),
          AppScollview(children: [
            CardContainer(children: [
              ItemContainer('Khách hàng', value: user.name),
              Divider(
                height: padding_regular.top,
              ),
              ItemContainer('Điện thoại', value: user.phone),
              Divider(
                height: padding_regular.top,
              ),
              PetContainer(_selectedPet, onPress: _setPet),
              Divider(
                height: padding_regular.top,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      'Đón tại nhà',
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
                  height: isPickupAtHome ? 44 + padding_tiny.top : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: padding_tiny.top),
                  child: PickupContainer(_selectedStore, onPress: () {})),
            ]),
            SizedBox(
              height: padding_regular.top,
            ),
            CardContainer(children: [
              StoreContainer(_selectedStore, onPress: () {}),
              Divider(
                height: padding_regular.top,
              ),
              ItemContainer('Dịch vụ', value: serviceName),
              Divider(
                height: padding_regular.top,
              ),
              ItemContainer('Gói dịch vụ', value: widget.grooming!.name),
              Divider(
                height: padding_regular.top,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppText(
                      'Dịch vụ thêm',
                      size: text_size_medium,
                      weight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                    ...List.generate(
                        widget.grooming!.options!.length,
                        (index) => Row(
                              children: [
                                const Icon(Icons.add,
                                    size: icon_small, color: Colors.black87),
                                AppText(
                                  widget.grooming!.options![index].name,
                                  size: text_size_medium,
                                  weight: FontWeight.w500,
                                  color: Colors.black87,
                                  margin: EdgeInsets.only(
                                      left: padding_tiny.left / 2),
                                )
                              ],
                            )),
                  ]),
              Divider(
                height: padding_regular.top,
              ),
              TimeContainer(_date, _time, onChange: _setDateTime)
            ]),
            SizedBox(
              height: padding_regular.top,
            ),
            CardContainer(children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLabelMediumText('Mã khuyến mãi',
                        color: Colors.black54, weight: FontWeight.w500),
                    AppText('1234567', size: text_size_medium)
                  ]),
              Divider(
                height: padding_regular.top,
              ),
            ])
          ])
        ]));
  }
}

class ItemContainer extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? child;
  const ItemContainer(this.title, {super.key, this.value, this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: AppText(
            title,
            size: text_size_medium,
            weight: FontWeight.w500,
            color: Colors.black54,
          )),
          Flexible(
              child: child ??
                  AppText(
                    value,
                    size: text_size_medium,
                    weight: FontWeight.w500,
                    color: Colors.black87,
                  ))
        ]);
  }
}

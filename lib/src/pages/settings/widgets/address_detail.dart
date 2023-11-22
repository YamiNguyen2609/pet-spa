import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/text.dart';
import '../../../theme/constant.dart';
import '../../../widgets/input.dart';
import '../../../widgets/card.dart';
import '../../widgets/title.dart';
import '../../../models/address_model.dart';

import '../../../theme/Color.dart';
import '../../../widgets/scrollview.dart';
import '../../widgets/header.dart';

class AddressDetail extends StatefulWidget {
  final AddressModel item;
  const AddressDetail(this.item, {super.key});

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  @override
  Widget build(BuildContext context) {
    double width = (Utils.width(context) -
            padding_regular.left * 4 -
            padding_small.left * 2) /
        4;
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(widget.item.id == 0 ? 'Thêm địa chỉ' : 'Chỉnh sửa địa chỉ'),
          AppScollview(children: [
            const HeaderTitle('Liên hệ'),
            CardContainer(children: [
              AppInput(
                placeholder: 'Họ và tên',
                height: 35,
                borderColor: Colors.transparent,
                contentPadding: EdgeInsets.only(bottom: padding_tiny.top),
                onChangeText: () => {},
              ),
              Divider(height: padding_tiny.top / 5),
              AppInput(
                type: InputType.PhoneInput,
                placeholder: 'Số điện thoại',
                height: 35,
                borderColor: Colors.transparent,
                contentPadding: EdgeInsets.only(top: padding_tiny.top),
                onChangeText: () => {},
              )
            ]),
            const HeaderTitle('Địa chỉ'),
            CardContainer(children: [
              AppInput(
                placeholder: 'Tên đường, Tòa nhà, Số nhà',
                height: 35,
                borderColor: Colors.transparent,
                contentPadding: EdgeInsets.only(bottom: padding_tiny.top),
                onChangeText: () => {},
              ),
              Divider(height: padding_tiny.top / 5),
              GestureDetector(
                  child: Container(
                padding: EdgeInsets.only(top: padding_tiny.top),
                child: const AppText(
                  'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã',
                  size: text_size_medium,
                  color: Colors.black26,
                ),
              ))
            ]),
            const HeaderTitle('Cài đặt'),
            CardContainer(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      'Đặt làm địa chỉ mặc định',
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
                                value: true,
                                activeColor: color_primary,
                                onChanged: (bool value) => setState(() {
                                      // isPickupAtHome = value;
                                    }))))
                  ])
            ])
          ])
        ]));
  }
}

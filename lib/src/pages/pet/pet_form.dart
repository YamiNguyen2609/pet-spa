import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_spa/src/models/type_pet_model.dart';
import 'package:pet_spa/src/pages/pet/widgets/gender_container.dart';
import 'package:pet_spa/src/pages/pet/widgets/type_container.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/Calendar.dart';
import '../../models/pet_model.dart';
import '../../widgets/Switch.dart';
import '../../widgets/text.dart';
import '../widgets/header.dart';
import '../../widgets/input.dart';
import '../../widgets/scrollview.dart';

import '../../theme/Color.dart';

class PetForm extends StatefulWidget {
  final PetModel? item;
  const PetForm(this.item, {super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  bool gender = false;
  DateTime _date = DateTime.now();
  bool sterilize = false;
  TypePetModel? type;
  void _setDate(value) {
    setState(() {
      _date = value[0];
      Navigator.pop(context);
    });
  }

  void _setGender(value) {
    setState(() {
      gender = value;
    });
  }

  void _setSterilize(value) {
    setState(() {
      gender = value;
    });
  }

  Future<void> _showCalendar(containerContext) {
    return showDialog<void>(
        context: containerContext,
        builder: (BuildContext context) {
          return AlertDialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: padding_small.left),
              backgroundColor: Colors.white,
              elevation: 0,
              content: Calendar(
                _date,
                callback: _setDate,
              ));
        });
  }

  Future<void> _showTypePet(containerContext) {
    return showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: radius_medium),
        ),
        builder: (BuildContext context) {
          return TypeContainer(type);
        });
  }

  @override
  Widget build(BuildContext context) {
    double height_input = 44;
    double width_input = (Utils.width(context) - padding_small.left * 3) / 2;
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(widget.item == null ? 'Thêm thú cưng' : 'Chỉnh sửa thú cưng'),
          AppScollview(children: [
            FormCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppInput(
                    label: 'Tên thú cưng',
                    border: 1,
                    width: Utils.width(context) - padding_small.left * 2 - 100,
                    backgroundColor: Colors.white,
                    contentPadding: padding_tiny,
                  ),
                  SizedBox(
                      height: height_default,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              'Giới tính',
                              size: text_size_medium,
                              weight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                            Container(
                                height: height_input,
                                alignment: Alignment.centerLeft,
                                child: AppSwitch(
                                  gender,
                                  height: 36,
                                  witth: 80,
                                  onChange: _setGender,
                                  inActiveColor: color_pink,
                                  activeChild: const Icon(
                                    Icons.male,
                                    size: icon_regular,
                                    color: Colors.white,
                                  ),
                                  inActiveChild: const Icon(
                                    Icons.female,
                                    size: icon_regular,
                                    color: Colors.white,
                                  ),
                                )),
                          ]))
                ],
              ),
            ),
            FormCard(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormItem(
                  width: Utils.width(context) - padding_small.left * 2 - 100,
                  height: height_input,
                  label: 'Ngày sinh',
                  value: DateFormat('dd-MM-yyyy').format(_date),
                  onTap: () => _showCalendar(context),
                ),
                SizedBox(
                    height: height_default,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            'Triệt sản',
                            size: text_size_medium,
                            weight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                          Container(
                              height: height_input,
                              alignment: Alignment.centerLeft,
                              child: AppSwitch(gender,
                                  height: 36,
                                  witth: 80,
                                  onChange: _setSterilize))
                        ]))
              ],
            )),
            FormCard(
                child: FormItem(
              width: width_input * 3,
              height: height_input,
              label: 'Chủng loại',
              onTap: () => _showTypePet(context),
            )),
            const FormCard(
              child: AppInput(
                label: 'Màu lông',
                border: 1,
                placeholder: 'xám, xám đen,...',
                backgroundColor: Colors.white,
                contentPadding: padding_tiny,
              ),
            ),
            FormCard(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppInput(
                  label: 'Cân nặng',
                  border: 1,
                  width: width_input,
                  placeholder: '0.0',
                  backgroundColor: Colors.white,
                  contentPadding: padding_tiny,
                  type: InputType.NumberInput,
                ),
                FormItem(
                  label: 'Nhóm máu',
                  width: width_input,
                  height: height_input,
                  onTap: () {},
                ),
              ],
            )),
            const FormCard(
              child: AppInput(
                label: 'Tiền sử bệnh',
                border: 1,
                minLine: 10,
                placeholder: 'Không có',
                backgroundColor: Colors.white,
                contentPadding: padding_tiny,
                type: InputType.MultilineInput,
              ),
            )
          ])
        ]));
  }
}

class FormCard extends StatelessWidget {
  final Widget child;
  const FormCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: padding_small.left,
          right: padding_small.right,
          bottom: padding_small.bottom),
      child: child,
    );
  }
}

class FormItem extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final String value;
  final onTap;
  const FormItem(
      {super.key,
      this.width = 0,
      this.height = 0,
      this.label = '',
      this.value = '',
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height_default,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                label,
                size: text_size_medium,
                weight: FontWeight.w500,
                color: Colors.black54,
                margin: EdgeInsets.only(bottom: padding_tiny.bottom / 2),
              ),
              GestureDetector(
                  onTap: () => onTap(),
                  child: Container(
                    width: width,
                    height: height,
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_small.left),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(radius_tiny),
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: AppText(
                      value == '' ? 'Chọn' : value,
                      color: value == '' ? Colors.black26 : Colors.black54,
                      size: text_size_medium,
                    ),
                  ))
            ]));
  }
}

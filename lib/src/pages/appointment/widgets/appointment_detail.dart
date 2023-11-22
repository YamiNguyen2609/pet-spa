import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/constant.dart';
import 'package:pet_spa/src/widgets/button.dart';

import '../../../data/data.dart';
import '../../../models/appoinment_model.dart';
import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/title.dart';

class AppointmentDetail extends StatelessWidget {
  final AppointmentModel item;
  const AppointmentDetail(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.height(context) - padding_large.top * 2,
      decoration: const BoxDecoration(
          color: background_color,
          borderRadius: BorderRadius.all(radius_medium)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: padding_small.top,
                left: padding_small.left,
                right: padding_small.right),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(
                            'assets/avatar.png',
                            width: 85,
                            height: 85,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: padding_tiny.left),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppSubTitleText(
                                  item.pet.name,
                                  color: Colors.black87,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.account_balance_wallet_rounded,
                                      color: color_secondary_1,
                                      size: icon_regular,
                                    ),
                                    AppLabelText(
                                      '#${item.code}',
                                      color: Colors.black87,
                                      margin: EdgeInsets.only(
                                          left: padding_tiny.left / 2),
                                    ),
                                  ],
                                ),
                                AppText(
                                  item.state == 0
                                      ? 'Chờ xác nhận'
                                      : (item.state == 1
                                          ? 'Đang xử lý'
                                          : (!item.isCancel
                                              ? 'Hoàn thành'
                                              : 'Đã Hủy')),
                                  color: item.state == 0
                                      ? color_secondary_1
                                      : (item.state == 1
                                          ? color_yellow
                                          : (!item.isCancel
                                              ? color_green
                                              : color_red)),
                                  size: text_size_medium,
                                  italic: true,
                                ),
                              ]),
                        )
                      ]),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      size: icon_large,
                      color: Colors.black54,
                    ),
                  )
                ]),
          ),
          AppScollview(
            children: [
              const HeaderTitle(
                'Thông tin khách hàng',
                size: text_size_sub,
              ),
              CardContainer(
                  margin: EdgeInsets.symmetric(horizontal: padding_small.left),
                  children: [
                    ItemContainer('Khách hàng', value: user.name),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Điện thoại', value: user.phone),
                  ]),
              const HeaderTitle('Thông tin dịch vụ', size: text_size_sub),
              CardContainer(
                  margin: EdgeInsets.symmetric(horizontal: padding_small.left),
                  children: [
                    ItemContainer('Gói dịch vụ', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Chi nhánh', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Thời gian đăng kí', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Người thực hiện', value: ''),
                  ]),
              const HeaderTitle('Thông tin Thanh toán', size: text_size_sub),
              CardContainer(
                  margin: EdgeInsets.symmetric(horizontal: padding_small.left),
                  children: [
                    ItemContainer('Thanh toán', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Tổng tiền', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Giảm giá', value: ''),
                    Divider(
                      height: padding_regular.top,
                    ),
                    ItemContainer('Tổng thanh toán', value: ''),
                  ]),
              item.state == 0
                  ? AppButton(
                      onPress: () => {},
                      type: ButtonType.TextButton,
                      text: 'Hủy cuộc hẹn',
                      backgroundColor: color_red,
                      margin: padding_small,
                      height: 50,
                      radius: radius_regular,
                    )
                  : SizedBox()
            ],
          )
        ],
      ),
    );
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

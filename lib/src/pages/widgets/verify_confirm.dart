import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/data/data.dart';
import 'package:pet_spa/src/pages/widgets/header.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/widgets/card.dart';
import 'package:pet_spa/src/widgets/checkbox.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../ultis/utils.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';

class VerifyConfirm extends StatefulWidget {
  const VerifyConfirm({super.key});

  @override
  State<VerifyConfirm> createState() => _VerifyConfirmState();
}

class _VerifyConfirmState extends State<VerifyConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header('Xác nhận'),
          AppScollview(children: [
            const HeaderTitle('Thông tin'),
            CardContainer(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Khách hàng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(user.name,
                    size: text_size_medium, color: Colors.black87)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Điện thoại',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(user.phone,
                    size: text_size_medium, color: Colors.black87)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Thú cưng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(pets[0].name,
                    size: text_size_medium, color: Colors.black87)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Cửa hàng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(stores[0].name,
                    size: text_size_medium, color: Colors.black87)
              ]),
              Divider(
                height: padding_large.top,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLabelMediumText('Địa chỉ đón',
                        color: Colors.black54, weight: FontWeight.w500),
                    AppText('Nhận tại cửa hàng',
                        size: text_size_medium, color: Colors.black87)
                  ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Gói dịch vụ',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(combos[0].name,
                    size: text_size_medium, color: Colors.black87)
              ]),
            ]),
            const HeaderTitle('Thanh toán'),
            CardContainer(children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLabelMediumText('Mã khuyến mãi',
                        color: Colors.black54, weight: FontWeight.w500),
                    AppText('1234567', size: text_size_medium)
                  ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Phương thức thanh toán',
                    color: Colors.black54, weight: FontWeight.w500),
                GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: radius_small),
                        ),
                        builder: (BuildContext context) {
                          return const PaymentPanel();
                        }),
                    child: const AppText('ATM', size: text_size_medium))
              ]),
            ]),
            SizedBox(
              height: padding_regular.top,
            ),
            CardContainer(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Gói dịch vụ',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(Utils.FormatCurrency(combos[0].cost),
                    size: text_size_medium, color: color_red)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Dịch vụ tùy chọn',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(Utils.FormatCurrency(combos[0].cost),
                    size: text_size_medium, color: color_red)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Mã khuyến mãi',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(Utils.FormatCurrency(20000),
                    size: text_size_medium, color: color_red)
              ]),
              Divider(
                height: padding_large.top,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const AppLabelMediumText('Tổng cộng',
                    color: Colors.black54, weight: FontWeight.w500),
                AppText(Utils.FormatCurrency(20000),
                    size: text_size_medium, color: color_red)
              ]),
            ]),
          ]),
          AppButton(
              type: ButtonType.TextButton,
              text: 'Thanh toán',
              backgroundColor: color_primary,
              margin: padding_regular,
              height: 40,
              radius: radius_large,
              onPress: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const VerifyConfirm())))
        ]));
  }
}

class PaymentPanel extends StatelessWidget {
  const PaymentPanel({super.key});

  @override
  Widget build(BuildContext context) {
    double height_item = 60;
    EdgeInsets padding = EdgeInsets.symmetric(vertical: 2, horizontal: 5);
    return Container(
        width: Utils.width(context),
        height: Utils.height(context) * 2 / 3,
        decoration: const BoxDecoration(
            color: background_color,
            borderRadius: BorderRadius.vertical(top: radius_small)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: Utils.width(context),
            padding: EdgeInsets.symmetric(
                vertical: padding_small.top, horizontal: padding_small.left),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppHeading2Text(
                  'Phương thức thanh toán',
                  weight: FontWeight.w500,
                  color: Colors.black87,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.black87,
                      size: icon_medium,
                    )),
              ],
            ),
          ),
          AppScollview(children: [
            const HeaderTitle('Tài khoản ngân hàng'),
            CardContainer(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(horizontal: padding_large.left),
                children: [
                  Container(
                    height: height_item,
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_small.left),
                    decoration: const BoxDecoration(
                        color: color_secondary_2,
                        borderRadius:
                            BorderRadius.vertical(top: radius_regular)),
                    child: Row(children: [
                      Container(
                          padding: padding,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(radius_tiny),
                              border:
                                  Border.all(width: 1, color: Colors.black12)),
                          child: Image.asset(
                            'assets/acb_logo.png',
                            width: icon_large,
                            height: icon_large,
                          )),
                      AppText(
                        '4532 3100 **** ****',
                        size: text_size_medium,
                        color: Colors.black87,
                        margin: EdgeInsets.symmetric(
                            horizontal: padding_small.left),
                      )
                    ]),
                  ),
                  Container(
                    height: height_item,
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_small.left),
                    child: Row(children: [
                      Container(
                          padding: padding,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(radius_tiny),
                              border:
                                  Border.all(width: 1, color: Colors.black12)),
                          child: Image.asset(
                            'assets/acb_logo.png',
                            width: icon_large,
                            height: icon_large,
                          )),
                      AppText(
                        '4532 3100 **** ****',
                        size: text_size_medium,
                        color: Colors.black87,
                        margin: EdgeInsets.symmetric(
                            horizontal: padding_small.left),
                      )
                    ]),
                  ),
                ]),
            const HeaderTitle('Khác'),
            CardContainer(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(horizontal: padding_large.left),
                children: [
                  Container(
                    height: height_item,
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_small.left),
                    child: Row(children: [
                      Image.asset(
                        'assets/momo_logo.png',
                        width: icon_large,
                        height: icon_large,
                      ),
                      AppText(
                        'MoMo',
                        size: text_size_medium,
                        color: Colors.black87,
                        margin: EdgeInsets.symmetric(
                            horizontal: padding_small.left),
                      )
                    ]),
                  ),
                  Container(
                    height: height_item,
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_small.left),
                    child: Row(children: [
                      Image.asset(
                        'assets/zalopay_logo.png',
                        width: icon_large,
                        height: icon_large,
                      ),
                      AppText(
                        'Zalopay',
                        size: text_size_medium,
                        color: Colors.black87,
                        margin: EdgeInsets.symmetric(
                            horizontal: padding_small.left),
                      )
                    ]),
                  ),
                ]),
          ])
        ]));
  }
}

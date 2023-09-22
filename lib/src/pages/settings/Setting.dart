import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_spa/src/pages/pet/pets.dart';
import 'package:pet_spa/src/pages/settings/widgets/address.dart';
import 'package:pet_spa/src/pages/settings/widgets/complain.dart';
import 'package:pet_spa/src/pages/settings/widgets/member_card.dart';
import 'package:pet_spa/src/pages/settings/widgets/password.dart';
import 'package:pet_spa/src/widgets/bottom.dart';
import 'package:pet_spa/src/widgets/card.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';

enum SettingItem { MY_PETS, COMPLAIN, PASSWORD, HELP, SETTING, ADDRESS }

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void _onPressItem(SettingItem key) {
    switch (key) {
      case SettingItem.MY_PETS:
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => const Pets()));
      case SettingItem.COMPLAIN:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const Complain()));
        return;
      case SettingItem.PASSWORD:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const Password()));
        return;
      case SettingItem.ADDRESS:
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => const Address()));
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: background_color,
        child: Container(
          padding: EdgeInsets.only(top: status_bar_height),
          // margin: EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppScollview(children: [
                const MemberCard(),
                AppSubTitleText(
                  'Hỗ trợ',
                  color: Colors.black87,
                  margin: EdgeInsets.symmetric(
                      horizontal: padding_regular.left,
                      vertical: padding_small.top),
                ),
                CardContainer(children: [
                  Item(
                    'Cài đặt',
                    Icons.settings,
                    onPress: () {},
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    'Liên hệ và góp ý',
                    Icons.messenger_outline_rounded,
                    onPress: () => _onPressItem(SettingItem.COMPLAIN),
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    "Về Lin's House",
                    Icons.info_outline_rounded,
                    onPress: () {},
                  ),
                ]),
                AppSubTitleText(
                  'Tài khoản',
                  color: Colors.black87,
                  margin: EdgeInsets.symmetric(
                      horizontal: padding_regular.left,
                      vertical: padding_small.top),
                ),
                CardContainer(children: [
                  Item(
                    'Hồ sơ cá nhân',
                    Icons.person,
                    onPress: () {},
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    'Đổi mật khẩu',
                    Icons.key_rounded,
                    onPress: () => _onPressItem(SettingItem.PASSWORD),
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    "Hồ sơ thú cưng",
                    Icons.pets_rounded,
                    onPress: () => _onPressItem(SettingItem.MY_PETS),
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    "Địa chỉ đã lưu",
                    Icons.bookmark_border_rounded,
                    onPress: () => _onPressItem(SettingItem.ADDRESS),
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    "Tài khoản thanh toán",
                    Icons.payment_rounded,
                    onPress: () {},
                  ),
                  Divider(height: padding_regular.top),
                  Item(
                    "Đăng xuất",
                    Icons.logout_rounded,
                    onPress: () {},
                  ),
                ]),
                const Bottom()
              ]),
            ],
          ),
        ));
  }
}

class Item extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;
  Item(this.title, this.icon, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPress(),
        child: SizedBox(
          height: 30,
          child: Row(children: [
            Icon(icon, size: icon_medium, color: color_primary),
            AppText(
              title,
              size: text_size_sub,
              margin: EdgeInsets.symmetric(horizontal: padding_small.left),
              color: Colors.black87,
            )
          ]),
        ));
  }
}

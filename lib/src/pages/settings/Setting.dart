import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/login.dart';
import 'package:pet_spa/src/pages/pet/pets.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../settings/header.dart';

enum SettingItem { MY_PETS, MY_FAVORITE, HELP, SETTING }

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
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Header(),
          Expanded(
              child: Container(
                  padding: padding_small,
                  height: MediaQuery.of(context).size.height * 2 / 3 -
                      padding_small.bottom * 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                            widgets.length,
                            (index) => GestureDetector(
                                onTap: () => _onPressItem(widgets[index].key),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(60)),
                                              child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: color_secondary_3,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                60)),
                                                  ),
                                                  child: Padding(
                                                      padding: padding_tiny / 2,
                                                      child: widgets[index]
                                                          .icon))),
                                          AppSubTitleText(
                                            widgets[index].title,
                                            margin: EdgeInsets.only(
                                                left: padding_tiny.left),
                                            weight: FontWeight.normal,
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black26,
                                      )
                                    ])))
                      ])))
        ],
      ),
    );
  }
}

class SettingWidget {
  final SettingItem key;
  final String title;
  final Icon icon;
  SettingWidget(this.key, this.title, this.icon);
}

List<SettingWidget> widgets = [
  SettingWidget(
      SettingItem.MY_PETS,
      "Danh sách thú cưng",
      const Icon(
        Icons.pets,
        size: icon_medium,
        color: color_primary,
      )),
  SettingWidget(
      SettingItem.MY_FAVORITE,
      "Danh sách yêu thích",
      const Icon(
        Icons.favorite_border_rounded,
        size: icon_medium,
        color: color_primary,
      )),
  SettingWidget(
      SettingItem.HELP,
      "Hỗ trợ",
      const Icon(
        Icons.question_mark_rounded,
        size: icon_medium,
        color: color_primary,
      )),
  SettingWidget(
      SettingItem.SETTING,
      "Cài đặt",
      const Icon(
        Icons.settings,
        size: icon_medium,
        color: color_primary,
      )),
];

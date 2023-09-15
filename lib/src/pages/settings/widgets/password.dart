import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/input.dart';

import '../../../theme/Color.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../widgets/header.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header('Đổi mật khẩu'),
          CardContainer(children: [
            AppInput(
              type: InputType.PasswordInput,
              label: 'Mật khẩu cũ',
              margin: EdgeInsets.only(bottom: padding_regular.bottom),
              contentPadding: EdgeInsets.symmetric(vertical: padding_tiny.top),
            ),
            AppInput(
              type: InputType.PasswordInput,
              label: 'Mật khẩu mới',
              margin: EdgeInsets.only(bottom: padding_regular.bottom),
              contentPadding: EdgeInsets.symmetric(vertical: padding_tiny.top),
            ),
            AppInput(
              type: InputType.PasswordInput,
              label: 'Xác nhận mật khẩu mới',
              contentPadding: EdgeInsets.symmetric(vertical: padding_tiny.top),
            )
          ]),
          AppButton(
              type: ButtonType.TextButton,
              text: 'Cập nhật',
              backgroundColor: color_primary,
              margin: padding_regular,
              height: 40,
              radius: radius_large,
              onPress: () => {})
        ]));
  }
}

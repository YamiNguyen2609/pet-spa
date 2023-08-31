import 'package:flutter/material.dart';
import 'package:pet_spa/src/widgets/button.dart';
import 'package:pet_spa/src/widgets/input.dart';

import '../theme/Color.dart';
import '../theme/Metrics.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_secondary_2,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: padding_regular,
                child: Image.asset('assets/logo.png')),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AppInput(
                    placeholder: "User Name",
                    icon: Icon(Icons.person),
                    iconColor: color_secondary_1,
                    placeholderColor: color_secondary_1,
                    textColor: color_secondary_1,
                    radius: radius_tiny,
                  ),
                  const AppInput(
                    placeholder: "Password",
                    icon: Icon(Icons.lock),
                    iconColor: color_secondary_1,
                    placeholderColor: color_secondary_1,
                    textColor: color_secondary_1,
                    radius: radius_tiny,
                  ),
                  AppButton(
                    height: 55,
                    text: "Login",
                    backgroundColor: color_secondary_1,
                    marginHorizontal: padding_small,
                    marginVertical: padding_small,
                    radius: radius_tiny,
                    onPress: () => {},
                  )
                ]),
          ]),
    );
  }
}

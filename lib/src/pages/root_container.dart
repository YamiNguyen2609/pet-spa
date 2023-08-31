import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/home/beauty.dart';
import 'package:pet_spa/src/pages/launcher.dart';
import 'package:pet_spa/src/pages/login.dart';
import 'package:pet_spa/src/pages/main.dart';

class RootContainer extends StatefulWidget {
  const RootContainer({super.key});

  @override
  State<StatefulWidget> createState() => _RootContainerState();
}

class _RootContainerState extends State<RootContainer> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(milliseconds: 5500),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Beauty());
  }
}

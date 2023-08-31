import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/home/header_main.dart';
import 'package:pet_spa/src/pages/home/service.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';

import 'banner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double imageSize = 35;
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        backgroundColor: Colors.white,
        child: SafeArea(
            child: Column(children: [
          HeaderMain(),
          AppScollview(children: [SlideBanner(), Service()])
        ])));
  }
}

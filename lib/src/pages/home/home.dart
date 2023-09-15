import 'package:flutter/cupertino.dart';
import 'package:pet_spa/src/pages/home/widgets/header_main.dart';
import 'package:pet_spa/src/pages/home/widgets/recent_store.dart';
import 'package:pet_spa/src/pages/home/widgets/service.dart';
import 'package:pet_spa/src/widgets/bottom.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import '../../theme/Color.dart';
import 'widgets/banner.dart';

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
        backgroundColor: background_color,
        child: Column(children: [
          HeaderMain(),
          AppScollview(
              children: [SlideBanner(), Service(), RecentStore(), Bottom()])
        ]));
  }
}

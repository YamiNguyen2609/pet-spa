import 'package:flutter/cupertino.dart';
import '../../theme/Color.dart';
import '../../widgets/bottom.dart';
import '../../widgets/scrollview.dart';
import 'widgets/banner.dart';
import 'widgets/header_main.dart';
import 'widgets/recent_store.dart';
import 'widgets/service.dart';

class Home extends StatefulWidget {
  final Function onMoveTab;
  const Home({super.key, required this.onMoveTab});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double imageSize = 35;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: background_color,
        child: Column(children: [
          const HeaderMain(),
          AppScollview(children: [
            const SlideBanner(),
            const Service(),
            RecentStore(onMoveStore: () => widget.onMoveTab(2)),
            const Bottom()
          ])
        ]));
  }
}

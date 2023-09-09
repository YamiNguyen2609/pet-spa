import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/appointment/appointment.dart';
import 'package:pet_spa/src/pages/home/beauty.dart';
import 'package:pet_spa/src/pages/home/home.dart';
import 'package:pet_spa/src/pages/settings/Setting.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/ultis/utils.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  static const List<Widget> widgets = <Widget>[
    Home(),
    Beauty(),
    Home(),
    Home(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [widgets[_selectedIndex]],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          child: Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(top: padding_small.top),
            decoration: const BoxDecoration(
                color: background_color_secondary,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: const Icon(
              Icons.qr_code_2_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        bottomNavigationBar: Navigation(
          _selectedIndex,
          onPress: _onItemTapped,
        ));
  }
}

class Navigation extends StatelessWidget {
  final int index;
  final Function onPress;
  const Navigation(this.index, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double size = 40;
    Radius radius = Radius.circular(size);
    double width = 140;
    double height = 70;
    return Container(
      height: height,
      color: background_color,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Container(
              height: height,
              color: background_color_secondary,
              padding: EdgeInsets.only(left: padding_regular.left),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationItem(
                      Icons.home,
                      index == 0,
                      onPress: () => onPress(0),
                    ),
                    NavigationItem(
                      Icons.access_time,
                      index == 1,
                      onPress: () => onPress(1),
                    ),
                  ]),
            )),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                    width: width,
                    height: height / 2 + padding_small.bottom,
                    child: ColoredBox(color: background_color_secondary)),
                Positioned(
                  bottom: padding_regular.bottom + 3,
                  child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(radius),
                          child: const SizedBox(
                            width: 68,
                            height: 68,
                            child: ColoredBox(color: background_color),
                          ))),
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.horizontal(right: radius),
                          child: SizedBox(
                            width: size,
                            height: height,
                            child:
                                ColoredBox(color: background_color_secondary),
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.horizontal(left: radius),
                          child: SizedBox(
                            width: size,
                            height: height,
                            child:
                                ColoredBox(color: background_color_secondary),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
                child: Container(
              height: height,
              color: background_color_secondary,
              padding: EdgeInsets.only(right: padding_regular.left),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationItem(
                      Icons.message_rounded,
                      index == 3,
                      onPress: () => onPress(0),
                    ),
                    NavigationItem(
                      Icons.person,
                      index == 4,
                      onPress: () => onPress(1),
                    ),
                  ]),
            )),
          ]),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final bool state;
  final Function onPress;
  const NavigationItem(this.icon, this.state,
      {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: SizedBox(
        height: 35,
        width: 35,
        child: Icon(
          icon,
          size: 35,
          color: state ? Colors.white : Colors.white38,
        ),
      ),
    );
  }
}

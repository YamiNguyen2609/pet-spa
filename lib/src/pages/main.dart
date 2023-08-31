import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/appointment/appointment.dart';
import 'package:pet_spa/src/pages/home/home.dart';
import 'package:pet_spa/src/pages/settings/Setting.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/button.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  static const List<Widget> widgets = <Widget>[
    Home(),
    Appointment(),
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
        backgroundColor: Colors.white,
        body: Stack(
          children: [SafeArea(child: widgets[_selectedIndex])],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onItemTapped(2),
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: Container(
            padding: padding_tiny,
            decoration: const BoxDecoration(
              color: color_primary,
              borderRadius: BorderRadius.all(radius_large),
            ),
            child: Icon(
              Icons.qr_code_2_rounded,
              size: 30,
              color: _selectedIndex == 2 ? Colors.white : Colors.white38,
            ),
          ),
        ),
        bottomNavigationBar: Container(
            padding: padding_tiny,
            decoration: const BoxDecoration(
              color: color_primary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationItem(
                  Icons.home,
                  _selectedIndex == 0,
                  onPress: () => _onItemTapped(0),
                ),
                NavigationItem(
                  Icons.access_time,
                  _selectedIndex == 1,
                  onPress: () => _onItemTapped(1),
                ),
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                NavigationItem(
                  Icons.shop,
                  _selectedIndex == 3,
                  onPress: () => _onItemTapped(3),
                ),
                NavigationItem(
                  Icons.person,
                  _selectedIndex == 4,
                  onPress: () => _onItemTapped(4),
                ),
              ],
            )));
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
        height: 30,
        width: 30,
        child: Icon(
          icon,
          size: 30,
          color: state ? Colors.white : Colors.white38,
        ),
      ),
    );
  }
}

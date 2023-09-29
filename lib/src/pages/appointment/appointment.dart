import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';

import '../../widgets/scrollview.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int currentState = 0;
  void onPressTab(int state) {
    setState(() {
      currentState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        backgroundColor: background_color,
        child: Column(children: [AppScollview(children: [])]));
  }
}

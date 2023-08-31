import 'package:flutter/material.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: padding_tiny,
              margin: EdgeInsets.symmetric(
                  horizontal: padding_small.left, vertical: padding_tiny.top),
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: color_secondary_2),
                  borderRadius: const BorderRadius.all(radius_tiny)));
        });
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/Calendar.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class TimeContainer extends StatefulWidget {
  final DateTime date;
  final DateTime time;
  final double height;
  final EdgeInsets margin;
  final Function onChange;
  const TimeContainer(this.date, this.time,
      {super.key,
      this.height = 0,
      this.margin = EdgeInsets.zero,
      required this.onChange});

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  bool expand = false;
  int state = -1;
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();

  void _tooglePanel(_state) {
    setState(() {
      if (!expand || _state == state) expand = !expand;
      state = -1;
      Timer(
          const Duration(milliseconds: 150),
          () => setState(() {
                state = _state;
              }));
    });
  }

  void _setDate(_date) {
    setState(() {
      date = _date[0];
      widget.onChange(date, time);
    });
  }

  void _setTime(_time) {
    setState(() {
      time = _time;
      widget.onChange(date, time);
    });
  }

  @override
  Widget build(BuildContext context) {
    date = widget.date;
    time = widget.time;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                  'Thời gian nhận',
                  size: text_size_medium,
                  weight: FontWeight.w500,
                  color: Colors.black54,
                ),
                Row(children: [
                  GestureDetector(
                      onTap: () => _tooglePanel(0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: expand && state == 0
                                ? color_primary
                                : color_secondary_1,
                            borderRadius: const BorderRadius.all(radius_tiny)),
                        margin: EdgeInsets.only(right: padding_tiny.bottom),
                        child: AppText(
                          DateFormat('dd-MM-yyyy').format(date),
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: text_size_medium,
                        ),
                      )),
                  GestureDetector(
                      onTap: () => _tooglePanel(1),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: expand && state == 1
                                ? color_primary
                                : color_secondary_1,
                            borderRadius: const BorderRadius.all(radius_tiny)),
                        child: AppText(
                          DateFormat('HH:mm').format(time),
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: text_size_medium,
                        ),
                      ))
                ]),
              ]),
          AnimatedContainer(
            width: Utils.width(context) - padding_small.left * 4,
            height: expand
                ? state == 0
                    ? 300
                    : 200
                : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: expand
                ? (state == 0
                    ? Calendar(widget.date, callback: _setDate)
                    : (state == 1
                        ? CupertinoDatePicker(
                            initialDateTime: widget.time,
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: true,
                            showDayOfWeek: true,
                            onDateTimeChanged: _setTime,
                          )
                        : const SizedBox()))
                : const SizedBox(),
          )
        ]);
  }
}

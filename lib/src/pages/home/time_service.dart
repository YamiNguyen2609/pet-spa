import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_spa/src/ultis/utils.dart';
import 'package:pet_spa/src/widgets/Calendar.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class TimeService extends StatefulWidget {
  final DateTime value;
  final double height;
  final EdgeInsets margin;
  const TimeService(
    this.value, {
    super.key,
    this.height = 0,
    this.margin = EdgeInsets.zero,
  });

  @override
  State<TimeService> createState() => _TimeServiceState();
}

class _TimeServiceState extends State<TimeService> {
  bool expand = false;
  int state = 0;

  void _tooglePanel(_state) {
    setState(() {
      expand = !expand;
      Timer(
          const Duration(milliseconds: 1000),
          () => setState(() {
                state = _state;
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.symmetric(vertical: padding_tiny.top),
                    margin: EdgeInsets.only(right: padding_small.bottom),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: Colors.black26))),
                    child: AppText(
                      DateFormat('dd/MM/yyyy').format(widget.value),
                      color: color_primary,
                      weight: FontWeight.w500,
                      size: 16,
                    ),
                  )),
              GestureDetector(
                  onTap: () => _tooglePanel(1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: padding_tiny.top),
                    margin: EdgeInsets.only(right: padding_small.bottom),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: Colors.black26))),
                    child: AppText(
                      DateFormat('HH:mm').format(widget.value),
                      color: color_primary,
                      weight: FontWeight.w500,
                      size: 16,
                    ),
                  ))
            ]),
            AnimatedContainer(
              width: Utils.width(context) - padding_small.left * 4,
              height: expand ? 300 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: expand
                  ? (state == 0
                      ? Calendar(widget.value, callback: () {})
                      : Container())
                  : Container(),
            )
          ]),
    );
  }
}

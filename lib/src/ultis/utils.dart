import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class Utils {
  static String CalculateAge(DateTime date) {
    String res = '';
    Duration duration = DateTime.now().difference(date);
    int day_remain = duration.inDays;

    if (duration.inDays / 365 > 1) {
      res = "${(duration.inDays / 365).toStringAsFixed(2)} năm ";
    } else if (duration.inDays / 30 > 1) {
      res = "${(duration.inDays / 30).toStringAsFixed(2)} tháng ";
    } else {
      res = "$day_remain ngày";
    }
    return res;
  }

  static String FormatCurrency(double value, {String signature = 'đ'}) {
    return NumberFormat('#,##0$signature').format(value);
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double statusBarHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    switch ('$width x $height') {
      case '428 x 926':
        return 1;
      case '414 x 896':
        return 1;
      case '390 x 844':
        return 1;
      case '375 x 812':
        return 1;
      case '414 x 736':
        return 1;
      case '375 x 667':
        return 1;
      case '320 x 568':
        return 1;
      default:
        return 0;
    }
  }
}

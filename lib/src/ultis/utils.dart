import 'package:intl/intl.dart';

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
}

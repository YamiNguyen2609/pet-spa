import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/text.dart';

class AppCheckbox extends StatelessWidget {
  final String title;
  final double textSize;
  final Color textColor;
  final double size;
  final Function onPress;
  final double border;
  final Color borderColor;
  final Radius radius;
  final bool value;
  const AppCheckbox(
    this.title,
    this.value, {
    super.key,
    this.textSize = text_size_label,
    required this.onPress,
    this.textColor = Colors.black87,
    this.size = icon_regular,
    this.border = 2,
    this.borderColor = Colors.black26,
    this.radius = radius_tiny,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Row(
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: value ? color_secondary_1 : Colors.transparent,
                borderRadius: BorderRadius.all(radius),
                border: Border.all(
                    width: border,
                    color: value ? color_secondary_1 : borderColor)),
            child: Icon(Icons.check, color: Colors.white, size: size - 4),
          ),
          AppText(
            title,
            margin: EdgeInsets.only(left: padding_tiny.left),
            size: textSize,
            color: textColor,
          )
        ],
      ),
    );
  }
}

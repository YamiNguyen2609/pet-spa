import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Color.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/text.dart';

enum ButtonType { TextButton, IconButton, ImageButton, CustomButton }

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight textWeight;
  final Icon icon;
  final double iconSize;
  final Color iconColor;
  final String image;
  final Widget? widget;
  final type;
  final double width;
  final double height;
  final Color backgroundColor;
  final double size;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final EdgeInsets marginHorizontal;
  final EdgeInsets marginVertical;
  final Radius radius;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onPress;
  const AppButton(
      {super.key,
      this.text = "",
      this.textColor = Colors.white,
      this.textWeight = FontWeight.w500,
      this.icon = const Icon(null),
      this.iconSize = 20,
      this.iconColor = Colors.transparent,
      this.image = "logo.png",
      this.widget,
      this.type = ButtonType.TextButton,
      this.width = 0,
      this.height = 0,
      this.backgroundColor = Colors.transparent,
      this.size = 20,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.marginHorizontal = EdgeInsets.zero,
      this.marginVertical = EdgeInsets.zero,
      this.radius = Radius.zero,
      this.borderWidth = 0,
      this.borderColor = Colors.transparent,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    double Width = width > 0 ? width : 60;
    double Height = height > 0 ? height : 50;
    EdgeInsets padding = margin;
    if (marginHorizontal != EdgeInsets.zero ||
        marginVertical != EdgeInsets.zero) {
      padding = EdgeInsets.symmetric(
          horizontal: marginHorizontal.top, vertical: marginVertical.left);
    }
    switch (type) {
      case ButtonType.TextButton:
        return Container(
          width: Width,
          height: Height,
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(radius),
              border: Border.all(width: borderWidth, color: borderColor),
              color: backgroundColor),
          child: GestureDetector(
              onTap: onPress,
              child: Center(
                child: AppText(
                  text,
                  color: textColor,
                  size: size,
                  weight: textWeight,
                ),
              )),
        );
      case ButtonType.IconButton:
        return Padding(
            padding: padding,
            child: Container(
                width: Height,
                height: Height,
                decoration: BoxDecoration(
                    border: Border.all(width: borderWidth, color: borderColor),
                    borderRadius: BorderRadius.all(radius),
                    color: backgroundColor),
                child: IconButton(
                  icon: icon,
                  iconSize: iconSize,
                  color: iconColor,
                  onPressed: onPress,
                )));
      case ButtonType.ImageButton:
        return Padding(
            padding: padding,
            child: SizedBox(
                width: Width,
                height: Height,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(radius),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: borderWidth, color: borderColor),
                            borderRadius: BorderRadius.all(radius),
                            color: backgroundColor),
                        child: GestureDetector(
                          child: Image.asset(
                            'assets/$image',
                            width: width - 10,
                            height: height - 10,
                          ),
                        )))));
      case ButtonType.CustomButton:
        return Padding(
            padding: padding,
            child: SizedBox(
                width: Width,
                height: Height,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(radius),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: borderWidth, color: borderColor),
                            borderRadius: BorderRadius.all(radius),
                            color: backgroundColor),
                        child: widget))));
      default:
        return Container();
    }
  }
}

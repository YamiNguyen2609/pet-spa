import 'package:flutter/material.dart';
import 'package:pet_spa/src/widgets/button.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';
import '../../widgets/text.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 65;
    return Container(
        padding: padding_tiny,
        margin: padding_tiny,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: padding_regular.left),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        child: AppHeading2Text('Thú cưng của bạn',
                            color: color_secondary_1),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const AppText('xem thêm'),
                      )
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                      3,
                      (index) => AppButton(
                          type: ButtonType.ImageButton,
                          radius: radius_large,
                          width: size,
                          height: size,
                          borderWidth: 3,
                          image: "launcher.png",
                          backgroundColor: color_primary,
                          onPress: () {})),
                  AppButton(
                    type: ButtonType.IconButton,
                    icon: Icons.add,
                    height: size,
                    radius: radius_large,
                    iconColor: color_primary,
                    iconSize: icon_large * 1.5,
                    borderColor: color_primary,
                    borderWidth: 3,
                    onPress: () {},
                  )
                ],
              )
            ]));
  }
}

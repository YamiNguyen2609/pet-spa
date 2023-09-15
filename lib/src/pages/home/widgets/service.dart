import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/home/beauty.dart';
import 'package:pet_spa/src/pages/home/widgets/item_service.dart';
import 'package:pet_spa/src/pages/widgets/title.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Metrics.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderTitle("Dịch vụ của Lin's house"),
        Padding(
          padding: EdgeInsets.only(
              left: padding_regular.left,
              right: padding_regular.right,
              bottom: padding_tiny.top),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem('Dịch vụ\nLưu trú', Beauty()),
              ServiceItem('Vệ sinh\nChải chuốt', Beauty())
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: padding_regular.left,
              right: padding_regular.right,
              top: padding_tiny.top),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem('Chăm sóc\nKhám bệnh', Beauty()),
              ServiceItem('Tư vấn\nonline', Beauty()),
            ],
          ),
        )
      ],
    );
  }
}

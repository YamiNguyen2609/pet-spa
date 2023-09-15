import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/widgets/header.dart';
import 'package:pet_spa/src/widgets/card.dart';
import 'package:pet_spa/src/widgets/text.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';

class Complain extends StatelessWidget {
  const Complain({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 35;
    return CupertinoPageScaffold(
        backgroundColor: background_color,
        child: Column(children: [
          const Header('Liên hệ và góp ý'),
          CardContainer(children: [
            SizedBox(
                height: height,
                child: Row(
                  children: [
                    const Icon(Icons.phone,
                        size: icon_medium, color: Colors.black87),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLabelText(
                          'Tổng đài',
                          color: Colors.black87,
                          margin: EdgeInsets.only(left: padding_small.left),
                        ),
                        AppLabelText('01267446584',
                            color: Colors.black87,
                            margin: EdgeInsets.only(left: padding_small.left))
                      ],
                    )
                  ],
                )),
            Divider(height: padding_large.top),
            SizedBox(
                height: height,
                child: Row(
                  children: [
                    const Icon(Icons.mail,
                        size: icon_medium, color: Colors.black87),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLabelText(
                          'Email',
                          color: Colors.black87,
                          margin: EdgeInsets.only(left: padding_small.left),
                        ),
                        AppLabelText('tch@gmail.com',
                            color: Colors.black87,
                            margin: EdgeInsets.only(left: padding_small.left))
                      ],
                    )
                  ],
                )),
            Divider(height: padding_large.top),
            SizedBox(
                height: height,
                child: Row(
                  children: [
                    const Icon(Icons.facebook_rounded,
                        size: icon_medium, color: Colors.black87),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLabelText(
                          'Facebook',
                          color: Colors.black87,
                          margin: EdgeInsets.only(left: padding_small.left),
                        ),
                        AppLabelText('facebook.com/tch',
                            color: Colors.black87,
                            margin: EdgeInsets.only(left: padding_small.left))
                      ],
                    )
                  ],
                )),
            Divider(height: padding_large.top),
            SizedBox(
                height: height,
                child: Row(
                  children: [
                    const Icon(Icons.messenger_rounded,
                        size: icon_medium, color: Colors.black87),
                    AppLabelText(
                      'Gửi góp ý về ứng dụng',
                      color: Colors.black87,
                      margin: EdgeInsets.only(left: padding_small.left),
                    ),
                  ],
                )),
          ]),
        ]));
  }
}

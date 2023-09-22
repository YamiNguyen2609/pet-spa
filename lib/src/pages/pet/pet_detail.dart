import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/pet/widgets/header.dart';
import 'package:pet_spa/src/models/pet_model.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../theme/Color.dart';
import '../../theme/Metrics.dart';

class PetDetail extends StatefulWidget {
  final PetModel? Pet;
  const PetDetail(this.Pet, {super.key});
  @override
  State<PetDetail> createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SafeArea(
          child: Stack(children: [
        SlidingUpPanel(
          parallaxEnabled: true,
          backdropOpacity: 0,
          panel: const AppSubTitleText("Text panel"),
          minHeight: MediaQuery.of(context).size.height / 2,
          maxHeight: MediaQuery.of(context).size.height * 2 / 3,
          borderRadius: const BorderRadius.all(radius_small),
          body: Container(
            color: color_secondary_3,
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 2),
            child: Image.asset(
              'assets/launcher.png',
            ),
          ),
        ),
        Positioned(
            child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                    horizontal: padding_small.left,
                    vertical: padding_regular.top),
                // color: Colors.amberAccent,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: color_primary,
                            size: 25,
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: color_yellow,
                            size: 25,
                          ))
                    ]))),
      ])),
    );
  }
}

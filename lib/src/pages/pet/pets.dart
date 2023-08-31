import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/pet/header.dart';
import 'package:pet_spa/src/pages/pet/pet_detail.dart';
import 'package:pet_spa/src/pages/pet/pet_item.dart';
import 'package:pet_spa/src/pages/pet/pet_model.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';

import '../../theme/Color.dart';
import '../data/data.dart';

class Pets extends StatefulWidget {
  const Pets({super.key});

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> {
  void _onPressFavorite(int id) {
    int index = pets.indexWhere((element) => element.id == id);
    setState(() {
      pets[index].isFavorite = !pets[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SafeArea(
          child: Column(children: [
        Header(
          "My Pets",
          widget: GestureDetector(
              child: const Icon(
                Icons.add_rounded,
                color: color_primary,
                size: 28,
              ),
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const PetDetail(null)))),
        ),
        AppScollview(children: [
          ...List.generate(
              pets.length,
              (index) => (PetItem(
                    pets[index],
                    index,
                    onPress: _onPressFavorite,
                  )))
        ]),
      ])),
    );
  }
}

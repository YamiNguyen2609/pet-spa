import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_spa/src/pages/pet/header.dart';
import 'package:pet_spa/src/pages/pet/pet_detail.dart';
import 'package:pet_spa/src/pages/pet/pet_item.dart';
import 'package:pet_spa/src/pages/pet/pet_model.dart';
import 'package:pet_spa/src/theme/Metrics.dart';
import 'package:pet_spa/src/widgets/scrollview.dart';
import 'package:pet_spa/src/widgets/text.dart';
import '../../theme/Color.dart';
import '../data/data.dart';
import '../widgets/title.dart';

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
    List<PetModel> cats =
        pets.where((element) => element.type == PetType.cat).toList();
    List<PetModel> dogs =
        pets.where((element) => element.type == PetType.dog).toList();
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(
            "Thú cưng của bạn",
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
            const HeaderTitle('Mèo cưng của bạn'),
            SizedBox(
                height: 250,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(cats.length,
                        (index) => PetItem(cats[index], index, cats.length)))),
            const HeaderTitle('Chó cưng của bạn'),
            SizedBox(
                height: 250,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(dogs.length,
                        (index) => PetItem(dogs[index], index, dogs.length))))
          ])
        ]));
  }
}

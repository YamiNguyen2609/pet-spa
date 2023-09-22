import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/pet_model.dart';
import '../../theme/Color.dart';
import '../../data/data.dart';
import '../../widgets/scrollview.dart';
import '../widgets/title.dart';
import 'pet_detail.dart';
import 'widgets/header.dart';
import 'widgets/pet_item.dart';

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
    List<PetModel> cats = pets;
    List<PetModel> dogs = pets;
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          const Header("Thú cưng của bạn"),
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

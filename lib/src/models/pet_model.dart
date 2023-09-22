import 'type_pet_model.dart';

class PetModel {
  int id;
  String name;
  bool gender;
  String birthday;
  String breed;
  String color;
  bool isFavorite;
  int petTypeId;
  PetModel(this.id, this.name, this.petTypeId, this.gender, this.birthday,
      this.breed, this.color, this.isFavorite);
}

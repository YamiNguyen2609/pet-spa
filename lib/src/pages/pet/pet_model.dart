enum PetType { cat, dog }

class PetModel {
  int id;
  String name;
  bool gender;
  String birthday;
  String breed;
  String color;
  bool isFavorite;
  PetType type;
  PetModel(this.id, this.name, this.type, this.gender, this.birthday,
      this.breed, this.color, this.isFavorite);
}

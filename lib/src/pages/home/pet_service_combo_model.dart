import 'package:pet_spa/src/pages/home/pet_service_option_model.dart';

class PetServiceComboModel {
  int id;
  String name;
  bool checked;
  List<String> items;
  List<PetServiceOptionModel>? options;
  PetServiceComboModel(
      this.id, this.name, this.items, this.options, this.checked);
}

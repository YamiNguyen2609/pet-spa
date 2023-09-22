import 'package:pet_spa/src/models/grooming_option_in_combo_model.dart';

class GroomingComboModel {
  int id;
  String name;
  bool checked;
  double cost;
  List<String>? items;
  List<GroomingOptionInComboModel>? options;
  GroomingComboModel(this.id,
      {this.name = '',
      this.cost = 0,
      this.items,
      this.options,
      this.checked = false});
}

import 'package:pet_spa/src/models/option_service_model.dart';

class ComboServiceModel {
  int id;
  String name;
  bool checked;
  double cost;
  List<String> items;
  List<OptionServiceModel> options;
  ComboServiceModel(
      this.id, this.name, this.cost, this.items, this.options, this.checked);
}

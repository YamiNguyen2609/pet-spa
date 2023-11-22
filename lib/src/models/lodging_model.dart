class LodgingModel {
  int id;
  String name;
  String description;
  double cost;
  List<String>? items;
  List<String>? services;
  LodgingModel(this.id, this.name,
      {this.description = "", this.cost = 0, this.items, this.services});
}

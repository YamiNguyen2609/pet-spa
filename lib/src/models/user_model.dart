import 'address_model.dart';

class UserModel {
  int id;
  String name;
  String phone;
  String username;
  int level;
  List<AddressModel>? address;
  UserModel(this.id,
      {this.name = '',
      this.phone = '',
      this.username = '',
      this.level = 1,
      this.address});
}

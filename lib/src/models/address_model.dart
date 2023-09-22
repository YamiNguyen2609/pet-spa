class AddressModel {
  int id;
  String name;
  String phone;
  String address;
  String ward;
  String district;
  String city;
  bool isDefault;
  AddressModel(this.id,
      {this.name = '',
      this.phone = '',
      this.address = '',
      this.ward = '',
      this.district = '',
      this.city = '',
      this.isDefault = false});
}

class StoreModel {
  int id;
  String name;
  String phone;
  String address;
  String ward;
  String district;
  String city;
  String country;
  String distance;
  String unitdistance;
  String time;
  String unittime;
  StoreModel(this.id,
      {this.name = '',
      this.phone = '',
      this.address = '',
      this.ward = '',
      this.district = '',
      this.city = '',
      this.country = '',
      this.time = '',
      this.unittime = '',
      this.distance = '',
      this.unitdistance = ''});
}

import 'package:pet_spa/src/models/store_model.dart';

import '../models/grooming_combo_model.dart';
import '../models/lodging_model.dart';
import '../models/veterinary_model.dart';
import '../models/pet_model.dart';
import '../theme/constant.dart';

class AppointmentModel {
  int id;
  String code;
  PetModel pet;
  int state;
  bool isCancel;
  Service service;
  LodgingModel? lodging;
  GroomingComboModel? grooming;
  VeterinaryModel? veterinary;
  DateTime dateStart;
  DateTime? dateEnd;
  StoreModel store;
  double total;
  double discount;
  double remain;
  bool isPickupHome;
  AppointmentModel(
    this.id,
    this.service, {
    required this.code,
    required this.pet,
    required this.dateStart,
    required this.store,
    this.state = 0,
    this.total = 0,
    this.discount = 0,
    this.remain = 0,
    this.isCancel = false,
    this.isPickupHome = false,
    this.dateEnd,
    this.lodging,
    this.grooming,
    this.veterinary,
  });
}

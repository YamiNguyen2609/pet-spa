import 'package:pet_spa/src/models/user_model.dart';

import '../../models/combo_service_model.dart';
import '../../models/store_model.dart';
import '../../models/option_service_model.dart';
import '../pet/pet_model.dart';

UserModel user = UserModel(1, 'Yami Nguyễn', '01267446584', 'yami2609', 1);

List<PetModel> pets = [
  PetModel(
      1, "Thú cưng 1", PetType.dog, true, "2023-01-01", "husky", "nâu", false),
  PetModel(
      2, "Thú cưng 2", PetType.cat, true, "2021-05-01", "meo", "nâu", false),
  PetModel(3, "Thú cưng 3", PetType.dog, false, "2022-01-01", "husky", "nâu",
      false),
];

final List<OptionServiceModel> options = [
  OptionServiceModel(1, "Cắt mài móng", 40000, false),
  OptionServiceModel(2, "Cạo bàn chân", 50000, false),
  OptionServiceModel(3, "Cạo lông (trừ đầu và thân)", 60000, false),
  OptionServiceModel(4, "Cắt tạo kiểu lông", 70000, false),
  OptionServiceModel(5, "Gỡ rối lông", 75000, false),
  OptionServiceModel(6, "Vệ sinh răng miệng", 80000, false),
];

final List<ComboServiceModel> combos = [
  ComboServiceModel(
      1,
      "Mát mẻ",
      230000,
      [
        'Vệ sinh tai',
        'Chải lông rụng',
        'Tắm xả',
        'Sấy khô',
        'Chải mượt lông',
        'Xịt dưỡng lông'
      ],
      options,
      false),
  ComboServiceModel(
      2,
      "Mơn mởn",
      300000,
      [
        'Cắt móng',
        'Vệ sinh tai',
        'Chải lông rụng',
        'Tắm xả',
        'Sấy khô',
        'Gỡ rối lông',
        'Chải mượt lông',
        'Xịt dưỡng lông',
        'Vệ Sinh răng miệng'
      ],
      options,
      false),
  ComboServiceModel(
      3,
      "Mẫu mực",
      1000000,
      [
        'Cắt móng',
        'Vệ sinh tai',
        'Chải lông rụng',
        'Cắt tạo kiểu',
        'Tắm xả tinh dầu hoa hồng',
        'Sấy khô',
        'Gỡ rối lông',
        'Chải mượt lông',
        'Xịt dưỡng lông',
        'Vệ Sinh răng miệng'
      ],
      options,
      false),
];

final List<StoreModel> book_locations = [
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km')
];

final List<StoreModel> stores = [
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km'),
  StoreModel(2, "Lin's house 2", '149 Đội cung', '9', '11', 'TP.HCM', '12',
      'phút', '1.5', 'km'),
  StoreModel(3, "Lin's house 3", '59 Trần Hưng Đạo', 'Nguyễn Thái Bình', '1',
      'TP.HCM', '18', 'phút', '8', 'km'),
  StoreModel(1, "Lin's house 1", '124 Vườn Lài', 'Tân Thành', 'Tân Phú',
      'TP.HCM', '42', 'phút', '14', 'km')
];

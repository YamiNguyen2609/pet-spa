import '../home/pet_service_combo_model.dart';
import '../home/pet_service_option_model.dart';
import '../pet/pet_model.dart';

List<PetModel> pets = [
  PetModel(1, "Thú cưng 1", false, "2023-01-01", "husky", "nâu", false),
  PetModel(2, "Thú cưng 2", true, "2021-05-01", "husky", "nâu", false),
  PetModel(3, "Thú cưng 3", false, "2022-01-01", "husky", "nâu", false),
];

final List<PetServiceOptionModel> options = [
  PetServiceOptionModel(1, "Cắt mài móng", 40000, false),
  PetServiceOptionModel(2, "Cạo bàn chân", 50000, false),
  PetServiceOptionModel(3, "Cạo lông (trừ đầu và thân)", 60000, false),
  PetServiceOptionModel(4, "Cắt tạo kiểu lông", 70000, false),
  PetServiceOptionModel(5, "Gỡ rối lông", 75000, false),
  PetServiceOptionModel(6, "Vệ sinh răng miệng", 80000, false),
];

final List<PetServiceComboModel> combos = [
  PetServiceComboModel(
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
  PetServiceComboModel(
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
  PetServiceComboModel(
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

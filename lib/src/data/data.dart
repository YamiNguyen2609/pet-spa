import 'package:pet_spa/src/models/address_model.dart';
import 'package:pet_spa/src/models/user_model.dart';
import 'package:pet_spa/src/theme/constant.dart';

import '../models/appoinment_model.dart';
import '../models/grooming_combo_model.dart';
import '../models/lodging_model.dart';
import '../models/store_model.dart';
import '../models/grooming_option_in_combo_model.dart';
import '../models/type_pet_model.dart';
import '../models/veterinary_model.dart';
import '../models/pet_model.dart';

UserModel user = UserModel(1,
    name: 'Yami Nguyễn',
    phone: '01267446584',
    username: 'yami2609',
    level: 1,
    address: [
      AddressModel(1,
          address: '124 Vườn Lài',
          ward: 'Tân Thành',
          district: 'Tân Phú',
          city: 'TP.HCM',
          isDefault: true),
      AddressModel(2,
          address: '124 Vườn Lài',
          ward: 'Tân Thành',
          district: 'Tân Phú',
          city: 'TP.HCM',
          phone: '0908564940'),
      AddressModel(3,
          address: '124 Vườn Lài',
          ward: 'Tân Thành',
          district: 'Tân Phú',
          city: 'TP.HCM')
    ]);

List<PetModel> pets = [
  PetModel(1, "Thú cưng 1", 1, true, "2023-01-01", "husky", "nâu", false),
  PetModel(2, "Thú cưng 2", 2, true, "2021-05-01", "meo", "nâu", false),
  PetModel(3, "Thú cưng 3", 3, false, "2022-01-01", "husky", "nâu", false),
];

final List<GroomingOptionInComboModel> options = [
  GroomingOptionInComboModel(1,
      name: "Cắt mài móng", value: 40000, checked: false),
  GroomingOptionInComboModel(2,
      name: "Cạo bàn chân", value: 50000, checked: false),
  GroomingOptionInComboModel(3,
      name: "Cạo lông (trừ đầu và thân)", value: 60000, checked: false),
  GroomingOptionInComboModel(4,
      name: "Cắt tạo kiểu lông", value: 70000, checked: false),
  GroomingOptionInComboModel(5,
      name: "Gỡ rối lông", value: 75000, checked: false),
  GroomingOptionInComboModel(6,
      name: "Vệ sinh răng miệng", value: 80000, checked: false),
];

final List<GroomingComboModel> grooming_combos = [
  GroomingComboModel(1,
      name: "Combo mát mẻ",
      cost: 230000,
      items: [
        'Vệ sinh tai',
        'Chải lông rụng',
        'Tắm xả',
        'Sấy khô',
        'Chải mượt lông',
        'Xịt dưỡng lông'
      ],
      options: options),
  GroomingComboModel(2,
      name: "Combo mơn mởn",
      cost: 300000,
      items: [
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
      options: options),
  GroomingComboModel(3,
      name: "Combo mẫu mực",
      cost: 1000000,
      items: [
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
      options: options),
];

final List<StoreModel> booked_stores = [
  StoreModel(1,
      name: "Lin's house 1",
      address: '124 Vườn Lài',
      ward: 'Tân Thành',
      district: 'Tân Phú',
      city: 'TP.HCM',
      time: '42',
      unittime: 'phút',
      distance: '14',
      unitdistance: 'km'),
  StoreModel(2,
      name: "Lin's house 2",
      address: '149 Đội cung',
      ward: '9',
      district: '11',
      city: 'TP.HCM',
      time: '12',
      unittime: 'phút',
      distance: '1.5',
      unitdistance: 'km'),
  StoreModel(3,
      name: "Lin's house 3",
      address: '59 Trần Hưng Đạo',
      ward: 'Nguyễn Thái Bình',
      district: '1',
      city: 'TP.HCM',
      time: '18',
      unittime: 'phút',
      distance: '8',
      unitdistance: 'km'),
  StoreModel(4,
      name: "Lin's house 4",
      address: '01 Vườn Lài',
      ward: 'Tân Thành',
      district: 'Tân Phú',
      city: 'TP.HCM',
      time: '42',
      unittime: 'phút',
      distance: '14',
      unitdistance: 'km'),
];

final List<StoreModel> stores = [
  StoreModel(1,
      name: "Lin's house 1",
      address: '124 Vườn Lài',
      ward: 'Tân Thành',
      district: 'Tân Phú',
      city: 'TP.HCM',
      time: '42',
      unittime: 'phút',
      distance: '14',
      unitdistance: 'km'),
  StoreModel(2,
      name: "Lin's house 2",
      address: '149 Đội cung',
      ward: '9',
      district: '11',
      city: 'TP.HCM',
      time: '12',
      unittime: 'phút',
      distance: '1.5',
      unitdistance: 'km'),
  StoreModel(3,
      name: "Lin's house 3",
      address: '59 Trần Hưng Đạo',
      ward: 'Nguyễn Thái Bình',
      district: '1',
      city: 'TP.HCM',
      time: '18',
      unittime: 'phút',
      distance: '8',
      unitdistance: 'km'),
  StoreModel(4,
      name: "Lin's house 4",
      address: '01 Vườn Lài',
      ward: 'Tân Thành',
      district: 'Tân Phú',
      city: 'TP.HCM',
      time: '42',
      unittime: 'phút',
      distance: '14',
      unitdistance: 'km'),
  StoreModel(5,
      name: "Lin's house 5",
      address: '200 Đội cung',
      ward: '9',
      district: '11',
      city: 'TP.HCM',
      time: '12',
      unittime: 'phút',
      distance: '1.5',
      unitdistance: 'km'),
  StoreModel(6,
      name: "Lin's house 6",
      address: '160 Trần Hưng Đạo',
      ward: 'Nguyễn Thái Bình',
      district: '1',
      city: 'TP.HCM',
      time: '18',
      unittime: 'phút',
      distance: '8',
      unitdistance: 'km'),
];

final List<VeterinaryModel> veterinaries = [
  VeterinaryModel(1, name: 'Tiêm ngừa dại', value: 80000),
  VeterinaryModel(2, name: 'Tiêm ngừa bệnh virus', value: 120000),
  VeterinaryModel(3, name: 'Vệ sinh tai, răng miệng', value: 70000),
  VeterinaryModel(4, name: 'Điều trị ve rận\n(1/7 liệu trình)', value: 100000),
  VeterinaryModel(5, name: 'Điều trị nấm\n(1/5 liệu trình)', value: 110000),
];

final List<TypePetModel> types = [
  TypePetModel(1, "Mèo Anh lông ngắn", PetType.cat),
  TypePetModel(2, "Mèo mướp", PetType.cat),
  TypePetModel(3, "Mèo Ba Tư", PetType.cat),
  TypePetModel(4, "Mèo tam thể", PetType.cat),
  TypePetModel(5, "Mèo Abyssinian", PetType.cat),
  TypePetModel(6, "Mèo Bali", PetType.cat),
  TypePetModel(7, "Mèo lông xoăn Selkirk", PetType.cat),
  TypePetModel(8, "Mèo Ai Cập", PetType.cat),
  TypePetModel(9, "Mèo Anh lông dài", PetType.cat),
  TypePetModel(10, "Mèo Munchkin", PetType.cat),
  TypePetModel(11, "Mèo Angora", PetType.cat),
  TypePetModel(12, "Mèo LaPerm", PetType.cat),
  TypePetModel(13, "Mèo Somali", PetType.cat),
  TypePetModel(14, "Mèo Maine Coon", PetType.cat),
  TypePetModel(15, "Mèo Toyger", PetType.cat),
  TypePetModel(16, "Mèo Xiêm", PetType.cat),
  TypePetModel(17, "Mèo Turkish Van", PetType.cat),
  TypePetModel(18, "Mèo tai cụp Scotland", PetType.cat),
  TypePetModel(19, "Mèo Miến điện", PetType.cat),
  TypePetModel(20, "Mèo Exotic", PetType.cat),
  TypePetModel(21, "Mèo Chartreux", PetType.cat),
  TypePetModel(22, "Mèo Savannah", PetType.cat),
  TypePetModel(23, "Mèo Ragdoll", PetType.cat),
  TypePetModel(24, "Mèo Ragamuffin", PetType.cat),
  TypePetModel(25, "Mèo Bengal", PetType.cat),
  TypePetModel(26, "​​Mèo Allerca", PetType.cat),
  TypePetModel(27, "Mèo rừng Nauy", PetType.cat),
  TypePetModel(28, "Mèo Manx", PetType.cat),
  TypePetModel(29, "Mèo Mỹ tai xoắn", PetType.cat),
  TypePetModel(30, "Mèo Siberian", PetType.cat),
  TypePetModel(31, "Chó chăn cừu Đức(Chó Berger)", PetType.dog),
  TypePetModel(32, "Chó ngao Tây Tạng(Ngao tạng)", PetType.dog),
  TypePetModel(33, "Dobermann", PetType.dog),
  TypePetModel(34, "Great Dane(Chó ngao Đức)", PetType.dog),
  TypePetModel(35, "Greyhound(Chó săn xám)", PetType.dog),
  TypePetModel(36, "Golden Retriever", PetType.dog),
  TypePetModel(37, "Chó Husky Sibir(Siberian Husky)", PetType.dog),
  TypePetModel(38, "Chó chăn cừu Shetland", PetType.dog),
  TypePetModel(
      39,
      "Chó chăn cừu Iceland(Chien de berger islandais, Islenskur Fjárhundur)",
      PetType.dog),
  TypePetModel(40, "Shiba Inu(Chó Shiba)", PetType.dog),
  TypePetModel(41, "Chó Chihuahua", PetType.dog),
  TypePetModel(42, "Chó Nhật", PetType.dog),
  TypePetModel(43, "Chó Bắc Kinh", PetType.dog),
  TypePetModel(44, "Chó Pug", PetType.dog),
  TypePetModel(45, "Chó Dachshund(Chó lạp xưởng)", PetType.dog),
  TypePetModel(46, "Chó Pungsan", PetType.dog),
  TypePetModel(47, "Chó Phú Quốc", PetType.dog),
  TypePetModel(48, "Chó St. Bernard", PetType.dog),
  TypePetModel(49, "Chó săn Afghan", PetType.dog),
  TypePetModel(50, "Akita Inu(Chó Akita)", PetType.dog),
  TypePetModel(51, "Alaskan Klee Kai", PetType.dog),
  TypePetModel(52, "Alaskan Malamute(Chó Alaska)", PetType.dog),
  TypePetModel(53, "Akita Mỹ", PetType.dog),
  TypePetModel(54, "Chó bò Anh(Chó bull Anh)", PetType.dog),
  TypePetModel(55, "Chó bò Mỹ(Chó bull Mỹ)", PetType.dog),
  TypePetModel(56, "Chó bò Pháp(Chó bull Pháp)", PetType.dog),
  TypePetModel(57, "Chó sục Boston", PetType.dog),
  TypePetModel(58, "Chó sục Pit Bull Mỹ", PetType.dog),
  TypePetModel(59, "American Cocker Spaniel", PetType.dog),
  TypePetModel(60, "Chó săn cáo Mỹ", PetType.dog),
  TypePetModel(61, "Chó thổ dân da đỏ", PetType.dog),
  TypePetModel(62, "Chó Canaan", PetType.dog),
  TypePetModel(63, "Chó Bangkaew Thái", PetType.dog),
  TypePetModel(64, "Basenji", PetType.dog),
  TypePetModel(65, "Chó cỏ(Chó ta)", PetType.dog),
  TypePetModel(66, "Chó Trùng Khánh", PetType.dog),
  TypePetModel(67, "Chó Kangal(Chó chăn cừu Anatoli)", PetType.dog),
  TypePetModel(68, "Chó Kintamani(Chó núi Bali)", PetType.dog),
  TypePetModel(69, "Chó Jindo", PetType.dog),
  TypePetModel(70, "Lundehund(Chó sáu ngón)", PetType.dog),
  TypePetModel(71, "Chó biết hát New Guinea", PetType.dog),
  TypePetModel(72, "Chó núi Đài Loan(Chó Đài Loan)", PetType.dog),
  TypePetModel(73, "Telomian", PetType.dog),
  TypePetModel(74, "Chó sục cáo lông mượt", PetType.dog),
  TypePetModel(75, "Chó chăn cừu Tervuren", PetType.dog),
  TypePetModel(76, "Chó chăn cừu Malinois", PetType.dog),
  TypePetModel(77, "Chó chăn gia súc Úc", PetType.dog),
  TypePetModel(78, "Chó chăn cừu Kelpie Úc", PetType.dog),
  TypePetModel(79, "Chó Beauceron", PetType.dog),
  TypePetModel(80, "Labrador Retriever( Chó Lab)", PetType.dog),
  TypePetModel(81, "Chó chăn cừu Anatoli(Çoban Köpeği)", PetType.dog),
  TypePetModel(82, "Azawakh", PetType.dog),
  TypePetModel(83, "Sloughi", PetType.dog),
  TypePetModel(84, "Saluki", PetType.dog),
  TypePetModel(85, "Chó lông xoáy Nam Phi( Chó xoáy Rhodesian)", PetType.dog),
  TypePetModel(86, "Chó săn Pharaoh(Kelb Tal Fenek)", PetType.dog),
  TypePetModel(87, "Podenco Canario", PetType.dog),
  TypePetModel(
      88, "Chó lông xoáy Thái Lan(Chó xoáy Thái, Phú Quốc Thái)", PetType.dog),
  TypePetModel(89, "Chó Phốc", PetType.dog),
  TypePetModel(90, "Podenco Ibicenco(Ibizan Podenco)", PetType.dog),
  TypePetModel(91, "Chó chăn cừu Úc", PetType.dog),
  TypePetModel(92, "Chó sục Úc", PetType.dog),
  TypePetModel(93, "Chó săn chân lùn", PetType.dog),
  TypePetModel(94, "Chó săn thỏ", PetType.dog),
  TypePetModel(95, "Chó chăn cừu râu dài", PetType.dog),
  TypePetModel(96, "Chó sục Bedlington", PetType.dog),
  TypePetModel(
      97,
      "Chó chăn cừu trắng Thụy Sĩ(Berger Blanc SuisseWeißer Schweizer Schäferhund)",
      PetType.dog),
  TypePetModel(98, "Samoyed", PetType.dog),
  TypePetModel(99, "Chó Spitz Nhật(Japanischer/Japanese Spitz)", PetType.dog),
  TypePetModel(100, "Chó Eskimo Mỹ", PetType.dog),
  TypePetModel(101, "Hokkaidō-Inu(Chó Hokkaido)", PetType.dog),
  TypePetModel(102, "Kishu Inu", PetType.dog),
  TypePetModel(103, "Chó chăn cừu Picard", PetType.dog),
  TypePetModel(104, "Chó núi Bern( Bouvier bernois, Bernenski pies pasterski)",
      PetType.dog),
  TypePetModel(105, "Bichon Frise", PetType.dog),
  TypePetModel(106, "Chó săn gấu mèo nâu đen", PetType.dog),
  TypePetModel(107, "Chó sục Nga đen", PetType.dog),
  TypePetModel(108, "Chó săn gấu mèo lam", PetType.dog),
  TypePetModel(109, "Collie biên giới", PetType.dog),
  TypePetModel(110, "Borzoi(Ngao xù)", PetType.dog),
  TypePetModel(111, "Chó chăn gia súc Flanders", PetType.dog),
  TypePetModel(112, "Braque(Braque du Bourbonnais)", PetType.dog),
  TypePetModel(113, "Briard(Berger de Brie)", PetType.dog),
  TypePetModel(114, "Chó sục Bun", PetType.dog),
  TypePetModel(115, "Chó ngao Bun", PetType.dog),
  TypePetModel(116, "Chó ngao Brasil(Fila Brasileiro)", PetType.dog),
  TypePetModel(117, "Chó ngao Anh", PetType.dog),
  TypePetModel(118, "Chó ngao Neopolitan", PetType.dog),
  TypePetModel(119, "Chó ngao Ý", PetType.dog),
  TypePetModel(120, "Dogo Argentino(Chó ngao Á Căn Đình)", PetType.dog),
  TypePetModel(121, "Chó ngao Pháp", PetType.dog),
  TypePetModel(122, "Chó săn vịt(Pudel)", PetType.dog),
  TypePetModel(
      123, "Chó chăn gia súc vùng Azores(Cão Fila de São Miguel)", PetType.dog),
  TypePetModel(124, "Galgo Español(lévrier espagnol)", PetType.dog),
  TypePetModel(125, "Chó săn Rampur", PetType.dog),
  TypePetModel(126, "Chó Catahoula(Chó báo leo cây Catahoula)", PetType.dog),
  TypePetModel(127, "Chó chăn cừu Kavkaz", PetType.dog),
  TypePetModel(128, "Cavalier King Charles Spaniel(Vua kỵ sĩ xứ Tây Ban Nha)",
      PetType.dog),
  TypePetModel(129, "Chó sục Jack Russell", PetType.dog),
  TypePetModel(130, "Chó sục Séc(Chó sục Tiệp, Český Teriér)", PetType.dog),
  TypePetModel(131, "Chó Vịnh Chesapeake", PetType.dog),
  TypePetModel(132, "Chó chăn cừu Laekenois", PetType.dog),
  TypePetModel(133, "Chó đánh hơi(Chien de Saint-Hubert)", PetType.dog),
  TypePetModel(134, "Chó có mào", PetType.dog),
  TypePetModel(135, "Chow Chow", PetType.dog),
  TypePetModel(136, "Chó Côn Minh", PetType.dog),
  TypePetModel(137, "Clumber Spaniel", PetType.dog),
  TypePetModel(138, "Chó Bướm", PetType.dog),
  TypePetModel(139, "Chó đốm(Dalmatinac)", PetType.dog),
  TypePetModel(140, "Chó võ sĩ(Chó Bốc-xơ)", PetType.dog),
  TypePetModel(141, "Cocker spaniel Anh Quốc", PetType.dog),
  TypePetModel(142, "Chó săn cáo Anh Quốc", PetType.dog),
  TypePetModel(143, "Setter Anh QuốcSetter( anglais)", PetType.dog),
  TypePetModel(144, "Chó Anh(Brittany Spaniel)", PetType.dog),
  TypePetModel(145, "Setter nâu đen(Setter gordon)", PetType.dog),
  TypePetModel(146, "Setter đỏ trắng", PetType.dog),
  TypePetModel(147, "Setter Ái Nhĩ Lan", PetType.dog),
  TypePetModel(148, "Chó sục Wheaten lông mềm", PetType.dog),
  TypePetModel(149, "Chó Komondor(Chó giẻ lau)", PetType.dog),
  TypePetModel(150, "Lhasa Apso", PetType.dog),
  TypePetModel(151, "Chó sục Manchester", PetType.dog),
  TypePetModel(152, "Chó Newfoundland", PetType.dog),
  TypePetModel(153, "Chó chăn cừu Anh Quốc(Bobtail)", PetType.dog),
  TypePetModel(154, "Chó săn xám Ý", PetType.dog),
  TypePetModel(155, "Löwchen(Chó sư tử/Petit chien lion)", PetType.dog),
  TypePetModel(156, "Pit bull(Chó chiến binh)", PetType.dog),
  TypePetModel(157, "Pit Bull Mỹ", PetType.dog),
  TypePetModel(158, "Chó Phốc sóc(Pom)", PetType.dog),
  TypePetModel(159, "Puli", PetType.dog),
  TypePetModel(160, "Rottweiler(Rốt, Rốt-ti)", PetType.dog),
  TypePetModel(161, "Collie lông dài", PetType.dog),
  TypePetModel(162, "Schipperke", PetType.dog),
  TypePetModel(163, "Chó sục Scotland(Scottish Terrier)", PetType.dog),
  TypePetModel(164, "Miniature Schnauzer", PetType.dog),
  TypePetModel(165, "Chó Sa Bì", PetType.dog),
  TypePetModel(166, "Shih Tzu(Thạch sư khuyểnChó sư tử đá)", PetType.dog),
  TypePetModel(167, "Shikoku Inu", PetType.dog),
  TypePetModel(168, "Chó sục Skye", PetType.dog),
  TypePetModel(169, "Collie lông mượt", PetType.dog),
  TypePetModel(170, "Chó sục Bun Staffordshire", PetType.dog),
  TypePetModel(171, "Chó săn Phần Lan", PetType.dog),
  TypePetModel(172, "Sussex Spaniel", PetType.dog),
  TypePetModel(173, "Chó cảnh Tây Tạng", PetType.dog),
  TypePetModel(174, "Chó sục cáo cảnh", PetType.dog),
  TypePetModel(175, "Weimaraner(Con Ma xám)", PetType.dog),
  TypePetModel(176, "Chó Corgi xứ Wales cổ", PetType.dog),
  TypePetModel(177, "Whippet(Mũi tên đường đua)", PetType.dog),
  TypePetModel(178, "Chó không lông", PetType.dog),
  TypePetModel(179, "Chó sục Yorkshire", PetType.dog),
  TypePetModel(180, "Chó sục cáo lông xoănChó sục( lông xoăn)", PetType.dog),
  TypePetModel(181, "Chó khỉ Affenpinscher", PetType.dog),
  TypePetModel(182, "Aidi", PetType.dog),
  TypePetModel(183, "Chó sục Airedale", PetType.dog),
  TypePetModel(184, "Alaskan Husky", PetType.dog),
  TypePetModel(185, "Alpine Dachsbracke", PetType.dog),
  TypePetModel(186, "Altdeutscher Hütehund", PetType.dog),
  TypePetModel(187, "Chó sục lông ngắn Mỹ", PetType.dog),
  TypePetModel(188, "Chó sục cảnh Mỹ", PetType.dog),
  TypePetModel(189, "American Water Spaniel", PetType.dog),
  TypePetModel(190, "Chó săn xám Anatoli", PetType.dog),
  TypePetModel(191, "Anglo-Français de Petite Vénerie", PetType.dog),
  TypePetModel(192, "Appenzeller Sennenhund", PetType.dog),
  TypePetModel(193, "Ariégeois", PetType.dog),
  TypePetModel(194, "Chó sục Silky Úc", PetType.dog),
  TypePetModel(195, "Australian Stumpy Tail Cattle Dog", PetType.dog),
  TypePetModel(196, "Barbet", PetType.dog),
  TypePetModel(197, "Bardino(Perro de Ganado Majorero)", PetType.dog),
  TypePetModel(198, "Basset Artésien Normand", PetType.dog),
  TypePetModel(199, "Basset Bleu de Gascogne", PetType.dog),
  TypePetModel(200, "Basset Fauve de Bretagne", PetType.dog),
  TypePetModel(201, "Bayerischer Gebirgsschweißhund", PetType.dog),
  TypePetModel(202, "Chó chăn cừu Griffon(Griffons belges)", PetType.dog),
  TypePetModel(203, "Chó vẩy Bergamasco", PetType.dog),
  TypePetModel(204, "Chó chăn cừu Pyrénées(Berger des Pyrénées)", PetType.dog),
  TypePetModel(205, "Bichon Havanais", PetType.dog),
  TypePetModel(206, "Billy", PetType.dog),
  TypePetModel(207, "Blue Picardy Spaniel", PetType.dog),
  TypePetModel(208, "Boerboel", PetType.dog),
  TypePetModel(209, "Chó đốm Bohemian", PetType.dog),
  TypePetModel(210, "Chó Bolognese(Bichon bolonais)", PetType.dog),
  TypePetModel(211, "Bolonka franzuska", PetType.dog),
  TypePetModel(212, "Bolonka Zwetna", PetType.dog),
  TypePetModel(213, "Chó sục biên giới", PetType.dog),
  TypePetModel(214, "Bosanski Ostrodlaki Gonic Barak", PetType.dog),
  TypePetModel(215, "Boykin Spaniel", PetType.dog),
  TypePetModel(
      216,
      "Chó chỉ điểm Pháp giống Pyrenees(Braque francais type Pyrenees)",
      PetType.dog),
  TypePetModel(217, "Bracco Ý", PetType.dog),
  TypePetModel(218, "Brandlbracke", PetType.dog),
  TypePetModel(219, "Braque d' Auvergne", PetType.dog),
  TypePetModel(220, "Braque Saint-Germain", PetType.dog),
  TypePetModel(221, "Briquet Griffon Vendeen", PetType.dog),
  TypePetModel(222, "Broholmer", PetType.dog),
  TypePetModel(
      223, "Chó ngao Majorca(Dogue de Majorque, Ca de Bou)", PetType.dog),
  TypePetModel(224, "Chó chăn cừu Majorca(Ca de Bestiar)", PetType.dog),
  TypePetModel(225, "Chó sục Cairn", PetType.dog),
  TypePetModel(226, "Can de Palleiro", PetType.dog),
  TypePetModel(227, "Chó Canada Eskimo", PetType.dog),
  TypePetModel(228, "Cane da pastore Maremmano-Abbruzzese", PetType.dog),
  TypePetModel(229, "Cane pecoraio siciliano", PetType.dog),
  TypePetModel(
      230, "Chó lội nước Bồ Đào Nha(Cão de Água Português)", PetType.dog),
  TypePetModel(231, "Cao de Serra de Aires", PetType.dog),
  TypePetModel(232, "Chó săn Caravan", PetType.dog),
  TypePetModel(233, "Chó Carolina", PetType.dog),
  TypePetModel(234, "Chó Bun Catahoula", PetType.dog),
  TypePetModel(235, "Chó chăn cừu Trung Á", PetType.dog),
  TypePetModel(236, "Český fousek", PetType.dog),
  TypePetModel(237, "Cierny Sery", PetType.dog),
  TypePetModel(
      238,
      "Chó lai sói Tiệp Khắc(Československý vlčiakChó săn sói Tschechoslowakischer)",
      PetType.dog),
  TypePetModel(239, "Chart Polski", PetType.dog),
  TypePetModel(240, "Chó núi Pyrénées(Chien de Montagne des Pyrénées, Patou)",
      PetType.dog),
  TypePetModel(
      241,
      "Chó chăn cừu Groenendael(Chien de Berger Belge Groenendael)",
      PetType.dog),
  TypePetModel(242, "Chó núi Estrela(Cão da serra da Estrela)", PetType.dog),
  TypePetModel(
      243, "Chó chăn cừu Bồ Đào Nha(Cao de castro laboreiro)", PetType.dog),
  TypePetModel(244, "Chó săn Artois(Chien d'Artois)", PetType.dog),
  TypePetModel(245, "Chinook", PetType.dog),
  TypePetModel(246, "Chó chăn cừu Bohemian(Chodský pes)", PetType.dog),
  TypePetModel(247, "Chortaj", PetType.dog),
  TypePetModel(
      248,
      "Chó chăn cừu Carpathian Romania(Ciobanesc Românesc Carpatin)",
      PetType.dog),
  TypePetModel(
      249,
      "Chó chăn cừu Romanian de Bucovina(Ciobanesc Romanesc de Bucovina)",
      PetType.dog),
  TypePetModel(
      250,
      "Chó chăn cừu Mioritic Romania(Ciobanesc Romanesc Mioritic)",
      PetType.dog),
  TypePetModel(251, "Cirneco dell'Etna", PetType.dog),
  TypePetModel(252, "Coton de Tulear", PetType.dog),
  TypePetModel(253, "Chó săn Crete", PetType.dog),
  TypePetModel(254, "Cursinu", PetType.dog),
  TypePetModel(255, "Curly Coated Retriever", PetType.dog),
  TypePetModel(256, "Chó sục Dandie Dinmont", PetType.dog),
  TypePetModel(257, "Chó nông trại Đan Mạch-Thụy Điển(Dansk-Svensk Gaardshund)",
      PetType.dog),
  TypePetModel(258, "Chó săn hươu", PetType.dog),
  TypePetModel(259, "Chó săn Đức(Deutsche Bracke)", PetType.dog),
  TypePetModel(260, "Chó chăn cừu lông dài(Deutsch-Langhaar)", PetType.dog),
  TypePetModel(261, "Deutsch Stichelhaar", PetType.dog),
  TypePetModel(262, "Deutscher Pinscher(Pinscher allemand)", PetType.dog),
  TypePetModel(263, "Chó Spitz Đức", PetType.dog),
  TypePetModel(264, "Deutscher Wachtel", PetType.dog),
  TypePetModel(265, "Deutsch Kurzhaar", PetType.dog),
  TypePetModel(266, "Deutsch Drahthaar", PetType.dog),
  TypePetModel(267, "Dogo Canario", PetType.dog),
  TypePetModel(268, "Drentse Patrijshond", PetType.dog),
  TypePetModel(269, "Drever", PetType.dog),
  TypePetModel(270, "Chó săn Na Uy", PetType.dog),
  TypePetModel(271, "Elo", PetType.dog),
  TypePetModel(272, "Chó săn gấu mèo Anh Quốc", PetType.dog),
  TypePetModel(273, "Springer Spaniel Anh Quốc", PetType.dog),
  TypePetModel(274, "Chó chỉ điểm Anh Quốc", PetType.dog),
  TypePetModel(275, "Chó sục cảnh Anh Quốc", PetType.dog),
  TypePetModel(276, "Entlebucher Sennenhund", PetType.dog),
  TypePetModel(277, "Epagneul Français", PetType.dog),
  TypePetModel(278, "Epagneul Picard", PetType.dog),
  TypePetModel(279, "Epagneul de Pont-Audemer", PetType.dog),
  TypePetModel(280, "Erdélyi Kopó", PetType.dog),
  TypePetModel(281, "Eurasier", PetType.dog),
  TypePetModel(282, "Flat Coated Retriever", PetType.dog),
  TypePetModel(283, "Chó sục cáo", PetType.dog),
  TypePetModel(284, "Gammel Dansk Hønsehund", PetType.dog),
  TypePetModel(285, "Chó sục Glen xứ Imaal", PetType.dog),
  TypePetModel(286, "Gończy Polski", PetType.dog),
  TypePetModel(287, "Chó chăn cùu Catalan(Gos-d'Atura-Catala)", PetType.dog),
  TypePetModel(
      288,
      "Chó săn Anh Pháp lớn tam thể(Grand anglo-français tricolore)",
      PetType.dog),
  TypePetModel(
      289,
      "Chó săn Anh Pháp lớn cam trắng(Grand anglo-français blanc et orange)",
      PetType.dog),
  TypePetModel(
      290,
      "Chó săn Anh Pháp lớn đen trắng(Grand anglo-français blanc et noir)",
      PetType.dog),
  TypePetModel(291, "Grand Basset Griffon Vendéen", PetType.dog),
  TypePetModel(292, "(Grand Griffon Vendeen)", PetType.dog),
  TypePetModel(293, "Chó săn Gascony lớn(Grand Bleu de Gascogne)", PetType.dog),
  TypePetModel(294, "Chó Greenland(Grønlandshund)", PetType.dog),
  TypePetModel(295, "Griffon Fauve de Bretagne", PetType.dog),
  TypePetModel(296, "Griffon bleu de Gascogne", PetType.dog),
  TypePetModel(297, "Griffon d'arrêt à poil dur Korthals", PetType.dog),
  TypePetModel(298, "Griffon Nivernais", PetType.dog),
  TypePetModel(
      299, "Grosser Schweizer Sennenhund( Grand bouvier Suisse)", PetType.dog),
  TypePetModel(300, "Chó săn Halden(Haldenstovare)", PetType.dog),
  TypePetModel(301, "Chó săn Hamilton(Hamiltonstövare)", PetType.dog),
  TypePetModel(302, "Chó săn Hanover(Hannoverscher Schweisshund)", PetType.dog),
  TypePetModel(303, "Harrier", PetType.dog),
  TypePetModel(304, "Chó săn Hellen(Hellinikos Ichnilatis)", PetType.dog),
  TypePetModel(305, "Hollandse Herdershond", PetType.dog),
  TypePetModel(306, "Hollandse Smoushond", PetType.dog),
  TypePetModel(307, "Hovawart", PetType.dog),
  TypePetModel(308, "Chó chăn cừu Croatia(Hrvatski ovčar)", PetType.dog),
  TypePetModel(309, "Ioujnorousskaîa Ovtcharka", PetType.dog),
  TypePetModel(310, "Huntaway", PetType.dog),
  TypePetModel(311, "Chó Spitz Ấn Độ", PetType.dog),
  TypePetModel(312, "Chó sục Ái Nhĩ Lan", PetType.dog),
  TypePetModel(313, "Irish Water Spaniel", PetType.dog),
  TypePetModel(314, "Chó săn Ái Nhĩ Lan", PetType.dog),
  TypePetModel(315, "Istarski Kratkodlaki Gonič", PetType.dog),
  TypePetModel(316, "Istarski Oštrodlaki Gonič", PetType.dog),
  TypePetModel(317, "Jagdterrier", PetType.dog),
  TypePetModel(318, "Jämthund", PetType.dog),
  TypePetModel(319, "Kai Inu", PetType.dog),
  TypePetModel(320, "Karakatschan", PetType.dog),
  TypePetModel(321, "Karjalankarhukoira", PetType.dog),
  TypePetModel(
      322,
      "Karelo-Finnish Laika(Finlandskaja, Karelskaja, Suomenpystykorva)",
      PetType.dog),
  TypePetModel(323, "Kraški ovčar", PetType.dog),
  TypePetModel(324, "Chó sục xám Kerry", PetType.dog),
  TypePetModel(325, "King Charles Spaniel", PetType.dog),
  TypePetModel(326, "Kooikerhondje", PetType.dog),
  TypePetModel(
      327, "Chó săn Kreta(Kretahund, Kritikos Lagonikos)", PetType.dog),
  TypePetModel(328, "Kromfohrlander", PetType.dog),
  TypePetModel(329, "Kuvasz", PetType.dog),
  TypePetModel(330, "Kyi Leo", PetType.dog),
  TypePetModel(331, "Labradoodle", PetType.dog),
  TypePetModel(332, "Lagotto Romagnolo", PetType.dog),
  TypePetModel(333, "Chó sục Lakeland", PetType.dog),
  TypePetModel(334, "Lancashire Heeler", PetType.dog),
  TypePetModel(335, "Landseer", PetType.dog),
  TypePetModel(336, "Lapinporokoira", PetType.dog),
  TypePetModel(337, "Leonberger", PetType.dog),
  TypePetModel(338, "Chó sục Lucas", PetType.dog),
  TypePetModel(339, "Lupo Ý", PetType.dog),
  TypePetModel(340, "Lurcher", PetType.dog),
  TypePetModel(341, "Chó xám( Bichon maltais, Maltese)", PetType.dog),
  TypePetModel(342, "Chó săn xám Hungari(Magyar Agar)", PetType.dog),
  TypePetModel(343, "Magyar Vizsla", PetType.dog),
  TypePetModel(344, "Maneto", PetType.dog),
  TypePetModel(345, "Markiesje", PetType.dog),
  TypePetModel(346, "Chó ngao vùng Pyrene(Mastín del Pirineo)", PetType.dog),
  TypePetModel(
      347, "Chó ngao Tây Ban Nha(mâtin espagnol, Mastín español)", PetType.dog),
  TypePetModel(348, "Middleasian greyhound-Tazi", PetType.dog),
  TypePetModel(349, "Chó chăn cừu Úc cỡ nhỏ", PetType.dog),
  TypePetModel(350, "Chó tiểu Sa Bì", PetType.dog),
  TypePetModel(351, "Chó Mạc Tư Khoa", PetType.dog),
  TypePetModel(352, "MünsterländerMünsterländer nhỏ", PetType.dog),
  TypePetModel(353, "Mudi", PetType.dog),
  TypePetModel(354, "Norrbottenspets", PetType.dog),
  TypePetModel(355, "Chó săn Na Uy", PetType.dog),
  TypePetModel(356, "Norsk Elghund", PetType.dog),
  TypePetModel(357, "Chó sục Norfolk", PetType.dog),
  TypePetModel(358, "Chó sục Norwich", PetType.dog),
  TypePetModel(359, "Chó Nova Scotia", PetType.dog),
  TypePetModel(360, "Chó săn Ba Lan(Ogar Polski)", PetType.dog),
  TypePetModel(361, "Chó Bun Anh cổ", PetType.dog),
  TypePetModel(362, "Österreichischer Pinscher", PetType.dog),
  TypePetModel(363, "Chó săn rái cá", PetType.dog),
  TypePetModel(364, "Chó sục Parson Russell", PetType.dog),
  TypePetModel(365, "Chó chăn cừu Garafiano(Pastor Garafiano)", PetType.dog),
  TypePetModel(366, "Chó sục Patterdale", PetType.dog),
  TypePetModel(
      367, "Chó lội nước Tây Ban Nha(Perro de Agua Español)", PetType.dog),
  TypePetModel(368, "Perro fino Colombiano", PetType.dog),
  TypePetModel(369, "Cimarrón Uruguayo", PetType.dog),
  TypePetModel(370, "Chó chăn cừu xứ Basque(Perro Pastor Vasco)", PetType.dog),
  TypePetModel(371, "Perro sin pelo del Perú", PetType.dog),
  TypePetModel(372, "Petit Basset Griffon Vendéen", PetType.dog),
  TypePetModel(
      373, "Chó săn Gascony lam nhỏ(Petit bleu de Gascogne)", PetType.dog),
  TypePetModel(374, "Chó săn Plott", PetType.dog),
  TypePetModel(375, "Chó sục Plummer", PetType.dog),
  TypePetModel(376, "Chó săn Andalusi(Podenco andaluz)", PetType.dog),
  TypePetModel(377, "Podengo Bồ Đào Nha( Portuguese Podengo)", PetType.dog),
  TypePetModel(378, "Chó Poitevin", PetType.dog),
  TypePetModel(
      379,
      "Chó chăn cừu hạ Ba Lan( PON, Nizinny Polski Owczarek Nizinny)",
      PetType.dog),
  TypePetModel(
      380, "Chó chăn cừu Tatra(Polski Owczarek Podhalanski)", PetType.dog),
  TypePetModel(381, "Porcelaine", PetType.dog),
  TypePetModel(382, "Perdigueiro Português", PetType.dog),
  TypePetModel(383, "Chó bắt chuột Prague(Pražský krysařík)", PetType.dog),
  TypePetModel(384, "Pudelpointer", PetType.dog),
  TypePetModel(385, "Chó Pumi", PetType.dog),
  TypePetModel(386, "Chó sục chuột", PetType.dog),
  TypePetModel(387, "Chó ngao Alentejo(Rafeiro do Alentejo)", PetType.dog),
  TypePetModel(388, "Chó săn Rajapalayam", PetType.dog),
  TypePetModel(389, "Chó săn chuột Andalusi(Ratonero Andaluz)", PetType.dog),
  TypePetModel(390, "Chó săn gấu mèo Redbone", PetType.dog),
  TypePetModel(391, "Spaniel Nga", PetType.dog),
  TypePetModel(392, "Russo-European Laika", PetType.dog),
  TypePetModel(393, "Chó sục cảnh Nga", PetType.dog),
  TypePetModel(394, "Chó săn sói Saarloos", PetType.dog),
  TypePetModel(395, "Sarplaninac", PetType.dog),
  TypePetModel(396, "Schapendoes", PetType.dog),
  TypePetModel(397, "Chó săn Schiller", PetType.dog),
  TypePetModel(398, "Chó sục Sealyham", PetType.dog),
  TypePetModel(399, "Chó săn Ý(Segugio italiano)", PetType.dog),
  TypePetModel(400, "Shih-Poo", PetType.dog),
  TypePetModel(401, "Chó chăn cừu Shiloh", PetType.dog),
  TypePetModel(402, "Chó săn Silken", PetType.dog),
  TypePetModel(403, "Chó săn Slovakia(Slovenský kopov)", PetType.dog),
  TypePetModel(404, "Slovenský hrubosrstý stavač", PetType.dog),
  TypePetModel(405, "Slovensky Cuvac", PetType.dog),
  TypePetModel(406, "Spinone Italiano", PetType.dog),
  TypePetModel(407, "Chó săn Smaland(Smaland-Stövare)", PetType.dog),
  TypePetModel(408, "Chó săn Serbia(Srpski Gonic)", PetType.dog),
  TypePetModel(
      409, "Chó săn Serbia tam thể(Srpski Trobojni Gonic)", PetType.dog),
  TypePetModel(410, "Stabyhoun", PetType.dog),
  TypePetModel(411, "Steirische Rauhhaarbracke", PetType.dog),
  TypePetModel(412, "Chó săn nòi Phần Lan", PetType.dog),
  TypePetModel(413, "Suomenlapinkoira", PetType.dog),
  TypePetModel(414, "Swedish Lapphund", PetType.dog),
  TypePetModel(
      415,
      "Chó săn Thụy Sĩ nhỏ(Schweizerischer NiederlaufhundPetit chien courant suisse)",
      PetType.dog),
  TypePetModel(416, "Chó săn Thụy Sĩ(Schweizer Laufhund)", PetType.dog),
  TypePetModel(417, "Taigan", PetType.dog),
  TypePetModel(418, "Chó Tamaska", PetType.dog),
  TypePetModel(419, "Chó sục Brasil(Terrier Brasileiro)", PetType.dog),
  TypePetModel(420, "Tesem", PetType.dog),
  TypePetModel(421, "Tornjak", PetType.dog),
  TypePetModel(422, "Tosa inu", PetType.dog),
  TypePetModel(423, "Chó sục cảnh Manchester", PetType.dog),
  TypePetModel(424, "Chó săn gấu mèo leo cây Walker", PetType.dog),
  TypePetModel(425, "Chó sục Tây Tạng(Dhoki Apso)", PetType.dog),
  TypePetModel(426, "Chó săn Tirole", PetType.dog),
  TypePetModel(427, "Vallhund Thụy Điển(Västgötaspets)", PetType.dog),
  TypePetModel(428, "Volpino", PetType.dog),
  TypePetModel(
      429, "Laika Đông Siberia(Vostotchno-Sibirskaïa Laïka)", PetType.dog),
  TypePetModel(430, "Waeller", PetType.dog),
  TypePetModel(431, "Welsh Corgi Pembroke", PetType.dog),
  TypePetModel(432, "Welsh Springer Spaniel", PetType.dog),
  TypePetModel(433, "Chó sục xứ Wales", PetType.dog),
  TypePetModel(434, "Chó sục cao nguyên phía Tây trắng", PetType.dog),
  TypePetModel(435, "Chó sục Westfal", PetType.dog),
  TypePetModel(436, "Westphälische Dachsbracke", PetType.dog),
  TypePetModel(437, "Wetterhond", PetType.dog),
  TypePetModel(438, "Chó Bun Anh trắng", PetType.dog),
  TypePetModel(439, "Yakutian Laika", PetType.dog),
  TypePetModel(440, "Laika Tây Siberia(Zapadno-Sibirskaïa Laïka)", PetType.dog)
];

final List<LodgingModel> lodgings = [
  LodgingModel(1, 'Phòng Đánh giấc',
      description:
          'Phòng cơ bản với đầy đủ tiện nghi cơ bản giúp thú cưng có thể ngủ ngon giấc chờ đến khi chủ về.',
      items: ['WC riêng', 'Sạch sẽ'],
      cost: 120000),
  LodgingModel(2, 'Phòng hội họp',
      description:
          'Phòng cao cấp đầy đủ tiện nghi công nghệ & sân chơi để các bé hướng ngoại thoải mái chơi đùa cùng bạn bè.',
      items: ['WC riêng', 'Sạch sẽ', 'Sân chơi', 'Điều hòa'],
      cost: 150000),
  LodgingModel(3, 'Phòng Hoàng gia',
      description:
          'Phòng thượng hạng với đầy đủ tiện nghi cao cấp nhất cho thú cưng cảm giác thoải mái như đang sống tại nhà.',
      items: ['WC riêng', 'Sạch sẽ', 'Sân chơi', 'Điều hòa', 'Camera quan sát'],
      cost: 210000),
];

final List<AppointmentModel> appointments = [
  AppointmentModel(1, Service.Lodging,
      state: 0,
      code: 'L123456',
      pet: pets[0],
      lodging: lodgings[1],
      dateStart: DateTime.now(),
      store: stores[0],
      dateEnd: DateTime.now().add(const Duration(days: 1, hours: 5))),
  AppointmentModel(
    2,
    Service.Grooming,
    state: 1,
    code: 'S123456',
    pet: pets[1],
    grooming: grooming_combos[2],
    store: stores[2],
    dateStart: DateTime.now(),
  ),
  AppointmentModel(
    3,
    Service.Veterinary,
    state: 2,
    code: 'V123456',
    pet: pets[2],
    store: stores[1],
    dateStart: DateTime.now(),
  ),
  AppointmentModel(3, Service.Veterinary,
      state: 2,
      code: 'V123457',
      pet: pets[2],
      dateStart: DateTime.now(),
      store: stores[0],
      isCancel: true),
];

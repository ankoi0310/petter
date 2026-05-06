// lib/scripts/seed_pets.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petter/core/di/di.dart';
import 'package:petter/core/enums/gender.dart';

Future<void> seedPets() async {
  final firestore = sl<FirebaseFirestore>();
  final collection = firestore.collection('pets');

  final pets = [
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Luna',
      'address': 'Quận 1, TP. Hồ Chí Minh',
      'gender': Gender.female.name,
      'age': '3 năm',
      'weight': '3.5 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Domestic Shorthair (Calico Tabby)',
      'description':
          'Luna là cô mèo calico-tabby với đôi mắt dị sắc đặc biệt - một xanh lá, một hổ phách. Tính cách điềm tĩnh, thích ngồi quan sát từ trên cao. Đã tiêm phòng đầy đủ.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-01-15T08:30:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-20T10:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Mochi',
      'address': 'Quận 3, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '4 năm',
      'weight': '2.8 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Pomeranian',
      'description':
          'Mochi là chú Phốc sóc lông cam rậm, cực kỳ lanh lợi và thân thiện. Biết ngồi, bắt tay và nằm theo lệnh. Thích được vuốt ve và chơi đùa.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-03-10T09:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-18T14:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Max',
      'address': 'Thủ Đức, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '9 năm',
      'weight': '30 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Golden Retriever',
      'description':
          'Max là chú Golden Retriever lớn tuổi, hiền lành và trung thành. Lông vùng mõm đã bạc màu theo năm tháng. Phù hợp gia đình có trẻ em, rất kiên nhẫn và nhẹ nhàng.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2023-06-01T07:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-10T08:00:00.000Z'),
      'isAdopted': true,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Cam',
      'address': 'Bình Thạnh, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '1.5 năm',
      'weight': '4 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Domestic Longhair (Orange Tabby)',
      'description':
          'Cam là mèo tabby cam lông dài, hay mặc áo len siêu dễ thương. Tính cách tò mò, thích nhìn lên trần nhà và quan sát mọi thứ. Rất thân thiện với người lạ.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-05-20T11:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-22T09:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Rocky',
      'address': 'Gò Vấp, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '3 năm',
      'weight': '18 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Border Collie / Husky Mix',
      'description':
          'Rocky là chú chó lai lông đen trắng với đôi mắt nâu biết nói. Nhanh nhẹn, thông minh, thích vui đùa ngoài trời. Đặc biệt thân thiện với trẻ nhỏ.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-02-14T13:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-03-30T15:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Bông',
      'address': 'Tân Bình, TP. Hồ Chí Minh',
      'gender': Gender.female.name,
      'age': '2 năm',
      'weight': '2.5 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Maltese',
      'description':
          'Bông là cô Maltese trắng muốt, lông mượt mà và cực kỳ ngoan. Thích được bế và ôm ấp. Phù hợp sống trong căn hộ, ít짖 sủa, không rụng lông nhiều.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-04-01T10:30:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-25T11:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Chuột Béo',
      'address': 'Quận 7, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '1 năm',
      'weight': '0.85 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Guinea Pig (American Short-hair)',
      'description':
          'Chuột Béo là chú chuột lang lông đỏ nâu tròn trĩnh, cực kỳ hiền và không cắn người. Thích ăn rau xanh và gặm nhấm. Dễ nuôi, phù hợp cho người lần đầu nuôi thú cưng.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-07-10T08:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-01T09:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Sunny',
      'address': 'Quận 2, TP. Hồ Chí Minh',
      'gender': Gender.female.name,
      'age': '1.5 năm',
      'weight': '28 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Golden Retriever',
      'description':
          'Sunny là cô Golden trẻ trung với bộ lông vàng ánh nắng. Hay nằm khoanh tay trước cửa, rất điềm tĩnh và dễ huấn luyện. Đã được tiêm phòng và triệt sản.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-08-05T07:30:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-20T08:30:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Đốm',
      'address': 'Bình Dương',
      'gender': Gender.male.name,
      'age': '3 năm',
      'weight': '4.5 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Chihuahua / Terrier Mix',
      'description':
          'Đốm là chú chó lông đen trắng với đôi tai to vểnh và chiếc khăn bandana xanh thời thượng. Mắt to tròn, hay nhìn chằm chằm rất đáng yêu. Hoạt bát và lanh lợi.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-01-20T14:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-15T16:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Shadow',
      'address': 'Quận 10, TP. Hồ Chí Minh',
      'gender': Gender.male.name,
      'age': '2 năm',
      'weight': '4 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Domestic Shorthair (Tuxedo)',
      'description':
          'Shadow là mèo tuxedo đen trắng cực kỳ bảnh bao với đôi mắt hổ phách sáng long lanh và chiếc vòng cổ nhỏ xinh. Hay nhìn lên với vẻ mặt nghiêm túc nhưng thật ra rất tình cảm.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-03-25T09:30:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-28T10:00:00.000Z'),
      'isAdopted': true,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Bánh',
      'address': 'Đà Nẵng',
      'gender': Gender.female.name,
      'age': '5 tháng',
      'weight': '5 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Pembroke Welsh Corgi',
      'description':
          'Bánh là cún Corgi tai to nổi tiếng với nụ cười toe toét không bao giờ tắt. Còn nhỏ nhưng đã rất dạn người. Đang trong giai đoạn huấn luyện cơ bản, tiếp thu rất nhanh.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-12-01T10:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-27T11:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
    {
      'uid': 'LihBrmmMbqfXPTMfHFMaVPBPKSF2',
      'name': 'Mây',
      'address': 'Hà Nội',
      'gender': Gender.female.name,
      'age': '2 năm',
      'weight': '14 kg',
      'speciesId': 'rPSoL7Env7oBX6UhMr2Q',
      'species': 'Labrador / Mixed Breed',
      'description':
          'Mây là cô chó lông trắng siêu vui tính, nổi tiếng với màn đội mũ tắm hồng cực kỳ kiên nhẫn. Có vòng cổ xanh teal và thẻ ID. Hoà đồng với mọi người và thú cưng khác.',
      'imageUrl':
          'https://xmfpxuvzveooojcgspam.supabase.co/storage/v1/object/public/images/pets/pet_0.jpg',
      'createdAt': DateTime.parse('2024-02-28T15:00:00.000Z'),
      'updatedAt': DateTime.parse('2025-04-29T07:00:00.000Z'),
      'isAdopted': false,
      'isDeleted': false,
    },
  ];

  // Dùng batch write để ghi tất cả trong 1 lần (hiệu quả hơn)
  final batch = firestore.batch();
  for (final pet in pets) {
    final docRef = collection.doc();
    final ref = collection.doc(docRef.id);
    batch.set(ref, {'id': docRef.id, ...pet});
  }

  await batch.commit();
  print('Seed ${pets.length} pets thành công!');
}

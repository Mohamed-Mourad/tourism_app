import 'dart:math';
import '../features/item_listing/models/item_model.dart';

final Random _random = Random();

Map<String, int> _generateAvatarCounts() {
  int totalUsers = _random.nextInt(8) + 1;
  int assignedCount;
  int overflowCount;

  if (totalUsers <= 3) {
    assignedCount = totalUsers;
    overflowCount = 0;
  } else {
    assignedCount = 3;
    overflowCount = totalUsers - 3;
  }
  return {'assigned': assignedCount, 'overflow': overflowCount};
}

final List<String> _itemImagePaths = [
  'assets/images/image1.png',
  'assets/images/image2.png',
  'assets/images/image3.png',
];

final List<ItemModel> mockItems = List.generate(
  10, // Let's generate 10 mock items
      (index) {
    final avatarData = _generateAvatarCounts();
    final itemImage = _itemImagePaths[index % _itemImagePaths.length];

    return ItemModel(
      id: 'item_${index + 1}',
      imageUrl: itemImage,
      title: (index == 1)
          ? 'Long item title highlighting how long an item title can actually be in this card view'
          : 'Item title ${index + 1}',
      status: 'Pending Approval',
      dateInfo: '5 Nights (Jan ${16 + index % 5} - Jan ${20 + index % 5}, 2024)',
      assignedUserCount: avatarData['assigned']!,
      overflowUserCount: avatarData['overflow']!,
      taskInfo: '${_random.nextInt(5) + 1} unfinished tasks',
    );
  },
);
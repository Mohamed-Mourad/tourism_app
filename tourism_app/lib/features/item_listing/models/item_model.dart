class ItemModel {
  final String id;
  final String imageUrl;
  final String title;
  final String status;
  final String dateInfo;
  final int assignedUserCount;
  final int overflowUserCount;
  final String taskInfo;

  const ItemModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.status,
    required this.dateInfo,
    required this.assignedUserCount,
    this.overflowUserCount = 0,
    required this.taskInfo,
  });
}
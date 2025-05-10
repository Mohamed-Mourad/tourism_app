import 'package:flutter/material.dart';
import '/core/constants/app_constants.dart';
import '/core/theme/app_theme.dart';

class UserAvatarsRow extends StatelessWidget {
  final int assignedUserCount;
  final int overflowUserCount;
  final double avatarRadius;
  final double overlapFactor;

  const UserAvatarsRow({
    super.key,
    required this.assignedUserCount,
    this.overflowUserCount = 0,
    this.avatarRadius = AppConstants.avatarRadiusSmall,
    this.overlapFactor = 0.45,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> avatarWidgets = [];
    final double avatarDiameter = avatarRadius * 2;
    final double visiblePartOfAvatar = avatarDiameter * (1 - overlapFactor);

    final List<String> personImageAssets = [
      'assets/images/person1.png',
      'assets/images/person2.png',
      'assets/images/person3.png',
    ];

    for (int i = 0; i < assignedUserCount; i++) {
      if (i < personImageAssets.length) {
        avatarWidgets.add(
          Positioned(
            left: i * visiblePartOfAvatar,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage(personImageAssets[i]),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        );
      }
    }

    if (overflowUserCount > 0) {
      final int positionIndex = assignedUserCount;
      avatarWidgets.add(
        Positioned(
          left: positionIndex * visiblePartOfAvatar,
          child: CircleAvatar(
            radius: avatarRadius,
            backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.8),
            child: Text(
              '+$overflowUserCount',
              style: AppTextStyles.smallHelperText.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.normal,
                fontSize: avatarRadius * 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final int totalVisibleElements = assignedUserCount + (overflowUserCount > 0 ? 1 : 0);
    if (totalVisibleElements == 0) {
      return const SizedBox.shrink();
    }

    final double stackWidth = (totalVisibleElements - 1) * visiblePartOfAvatar + avatarDiameter;

    return SizedBox(
      width: stackWidth,
      height: avatarDiameter,
      child: Stack(
        children: avatarWidgets,
      ),
    );
  }
}
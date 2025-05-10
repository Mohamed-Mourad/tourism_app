import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../models/item_model.dart';
import '../widgets/user_avatars_row.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final VoidCallback? onTap;
  final VoidCallback? onMenuTap;

  const ItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.onMenuTap,
  });

  static const double _imageHeight = 170.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: colorScheme.primary.withOpacity(0.1),
        highlightColor: colorScheme.primary.withOpacity(0.05),
        child: Column(
          children: [
            SizedBox(
              height: _imageHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          color: Colors.white38,
                          size: 50,
                        ),
                      );
                    },
                  ),
                  // --- Black Fade at the bottom of the image ---
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // --- "Pending Approval" Chip inside the Stack ---
                  Positioned(
                    bottom: AppConstants.kInterElementSpacing,
                    left: AppConstants.kInterElementSpacing,
                    child: Chip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(item.status),
                          const SizedBox(width: AppConstants
                              .kInterElementSpacing / 2),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: (theme.chipTheme.labelStyle?.color ??
                                AppTextStyles.cardStatus.color)?.withOpacity(
                                0.8),
                          ),
                        ],
                      ),
                      backgroundColor: theme.chipTheme.backgroundColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      labelPadding: EdgeInsets.zero,
                      padding: theme.chipTheme.padding,
                    ),
                  ),
                  Positioned(
                    top: AppConstants.kInterElementSpacing,
                    right: AppConstants.kInterElementSpacing,
                    child: Material(
                      color: Colors.black.withOpacity(0.4),
                      shape: const CircleBorder(),
                      elevation: 1.0,
                      child: IconButton(
                        icon: const Icon(Icons.more_horiz_rounded),
                        color: Colors.white,
                        iconSize: 20,
                        tooltip: 'More options',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                            minWidth: 36, minHeight: 36),
                        onPressed: onMenuTap ?? () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Content Section ---
            Padding(
              padding: AppEdgeInsets.allMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Removed the Chip from here
                  const SizedBox(
                      height: AppConstants.kInterElementSpacingMedium),

                  // --- Item Title ---
                  Text(
                    item.title,
                    style: textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.kInterElementSpacing),

                  // --- Date Information ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyLight.calendar,
                        size: 14,
                        color: Color(0xFF999999),
                      ),
                      const SizedBox(
                          width: AppConstants.kInterElementSpacing / 2),
                      Expanded(
                        child: Text(
                          item.dateInfo,
                          style: textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF999999)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: AppConstants.kInterElementSpacingMedium),

                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0x80999999),
                  ),

                  const SizedBox(
                      height: AppConstants.kInterElementSpacingMedium),

                  // --- Bottom Row: Avatars and Task Info ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (item.assignedUserCount > 0 ||
                          item.overflowUserCount > 0)
                        UserAvatarsRow(
                          assignedUserCount: item.assignedUserCount,
                          overflowUserCount: item.overflowUserCount,
                          avatarRadius: AppConstants
                              .avatarRadiusSmall, // Use defined constant
                        )
                      else
                        const SizedBox(
                            height: AppConstants.avatarRadiusSmall * 2),

                      // Task Info
                      Flexible(
                        child: Text(
                          item.taskInfo,
                          style: textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF999999)),
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
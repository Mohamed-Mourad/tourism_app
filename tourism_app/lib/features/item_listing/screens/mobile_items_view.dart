import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/item_card.dart';
import '../../../mock_data/items_mock.dart';
import '../models/item_model.dart';

class MobileItemsView extends StatelessWidget {
  const MobileItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.kCardPadding,
        vertical: AppConstants.kInterElementSpacingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Top Row: Title and Filter Button ---
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppConstants.kInterElementSpacingMedium,
              left: AppConstants.kInterElementSpacing / 2,
              right: AppConstants.kInterElementSpacing / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Items',
                  style: textTheme.displaySmall?.copyWith(fontSize: 24),
                ),
                // Filter Button (styled as per screenshots)
                IconButton(
                  icon: const Icon(IconlyLight.filter),
                  tooltip: 'Filter items',
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surface.withOpacity(0.7),
                    foregroundColor: colorScheme.onSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
                    ),
                    padding: const EdgeInsets.all(AppConstants.kInterElementSpacingMedium - 4),
                    minimumSize: const Size(36, 36),
                  ),
                  onPressed: () {
                    // print('Filter button pressed on mobile');
                  },
                ),
              ],
            ),
          ),

          // --- Content Area: List of ItemCards ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: AppConstants.kScreenPadding + 56),
              itemCount: mockItems.length,
              itemBuilder: (BuildContext context, int index) {
                final ItemModel currentItem = mockItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppConstants.kListItemSpacing),
                  child: ItemCard(
                    item: currentItem,
                    onTap: () {
                      // print('Tapped on mobile item: ${currentItem.title}');
                    },
                    onMenuTap: () {
                      // print('Menu tapped for mobile item: ${currentItem.title}');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
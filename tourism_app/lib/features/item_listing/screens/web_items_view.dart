import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/item_card.dart';
import '../../../mock_data/items_mock.dart';
import '../models/item_model.dart';

class WebItemsView extends StatelessWidget {
  const WebItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    final dividerColor = theme.dividerTheme.color ?? theme.dividerColor.withOpacity(0.5);
    const dividerThickness = 2.0;
    const dividerIndent = 8.0;

    return Padding(
      padding: AppEdgeInsets.allScreen, // Using predefined EdgeInsets
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Top Row: Title and Action Buttons ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Items',
                style: textTheme.displaySmall,
              ),
              Row(
                children: [
                  // Filter Button
                  SizedBox(
                    height: 40.0,
                    child: IconButton(
                      icon: const Icon(IconlyLight.filter),
                      tooltip: 'Filter items',
                      style: IconButton.styleFrom(
                        backgroundColor: colorScheme.surface.withOpacity(0.7),
                        foregroundColor: colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
                        ),
                        padding: const EdgeInsets.all(AppConstants.kInterElementSpacingMedium -2),
                        minimumSize: const Size(40, 40),
                      ),
                      onPressed: () {
                        // print('Filter button pressed on web');
                      },
                    ),
                  ),

                  const SizedBox(width: AppConstants.kListItemSpacing),

                  SizedBox(
                    height: 40.0,
                    child: VerticalDivider(
                      color: dividerColor,
                      thickness: dividerThickness,
                      indent: dividerIndent,
                      endIndent: dividerIndent,
                    ),
                  ),

                  const SizedBox(width: AppConstants.kListItemSpacing),

                  // Add New Item Button
                  SizedBox(
                    height: 40.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add a New Item'),
                      onPressed: () {
                        // print('Add a New Item button pressed on web');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppConstants.kScreenPadding),

          // --- Content Area: Grid of ItemCards ---
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: AppConstants.kScreenPadding),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 360.0,
                mainAxisExtent: 328.0,
                crossAxisSpacing: AppConstants.kListItemSpacing,
                mainAxisSpacing: AppConstants.kListItemSpacing,
              ),
              itemCount: mockItems.length,
              itemBuilder: (BuildContext context, int index) {
                final ItemModel currentItem = mockItems[index];
                return ItemCard(
                  item: currentItem,
                  onTap: () {
                    // print('Tapped on web item: ${currentItem.title}');
                  },
                  onMenuTap: () {
                    // print('Menu tapped for web item: ${currentItem.title}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
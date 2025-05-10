import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared_widgets/app_logo.dart';
import '../../../shared_widgets/web_nav_item.dart';

class NavItemData {
  final String title;
  final String routeName;

  NavItemData({required this.title, required this.routeName});
}

class WebNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentSelectedRoute;
  final Function(String routeName) onNavItemTap;

  static final List<NavItemData> _navItems = [
    NavItemData(title: 'Items', routeName: 'items'),
    NavItemData(title: 'Pricing', routeName: 'pricing'),
    NavItemData(title: 'Info', routeName: 'info'),
    NavItemData(title: 'Tasks', routeName: 'tasks'),
    NavItemData(title: 'Analytics', routeName: 'analytics'),
  ];

  const WebNavBar({
    super.key,
    required this.currentSelectedRoute,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.dividerColor.withOpacity(0.5);
    const dividerThickness = 2.0;
    const dividerIndent = 12.0;

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Color(0x80999999))
        )
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.kScreenPadding),
      child: Row(
        children: [
          const AppLogo(height: AppConstants.webAppBarHeight * 0.5),
          const SizedBox(width: AppConstants.kScreenPadding * 1.5),

          const Spacer(),

          // Navigation Items
          ..._navItems.map((item) => WebNavItem(
            title: item.title,
            isSelected: item.routeName == currentSelectedRoute,
            onTap: () => onNavItemTap(item.routeName),
          )),

          // Action Icons & User Profile

          VerticalDivider(
            color: dividerColor,
            thickness: dividerThickness,
            indent: dividerIndent,
            endIndent: dividerIndent,
          ),

          const SizedBox(width: AppConstants.kInterElementSpacing / 2),

          IconButton(
            icon: const Icon(IconlyLight.setting),
            tooltip: 'Settings',
            onPressed: () {},
          ),
          const SizedBox(width: AppConstants.kInterElementSpacing),
          IconButton(
            icon: const Icon(IconlyLight.notification),
            tooltip: 'Notifications',
            onPressed: () {},
          ),

          const SizedBox(width: AppConstants.kInterElementSpacing / 2),

          VerticalDivider(
            color: dividerColor,
            thickness: dividerThickness,
            indent: dividerIndent,
            endIndent: dividerIndent,
          ),

          const SizedBox(width: AppConstants.kInterElementSpacingMedium),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.kInterElementSpacingMedium,
                  vertical: AppConstants.kInterElementSpacing),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: AppConstants.avatarRadiusMedium,
                    backgroundColor: Colors.orangeAccent,
                    child: Text(
                      'JD',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.kInterElementSpacing),
                  Text(
                    'John Doe',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500
                    ) ?? AppTextStyles.userProfileName,
                  ),
                  const SizedBox(width: AppConstants.kInterElementSpacing / 2),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.webAppBarHeight);
}
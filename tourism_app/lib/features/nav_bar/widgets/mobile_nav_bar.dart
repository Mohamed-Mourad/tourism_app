// lib/features/nav_bar/widgets/mobile_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/app_constants.dart';
import '../../../shared_widgets/app_logo.dart'; // Assuming AppLogo is in shared_widgets

class MobileNavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed; // Callback for the menu/drawer icon

  const MobileNavBar({
    super.key,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.dividerColor.withOpacity(0.5);
    const dividerThickness = 1.0;
    const dividerIndent = 12.0;

    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.menu_rounded),
        tooltip: 'Open navigation menu',
        onPressed: onMenuPressed ?? () {
          // print('Menu button pressed - Drawer not implemented yet.');
        },
      ),
      title: const AppLogo(height: AppConstants.mobileAppBarHeight * 0.5),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.setting),
          tooltip: 'Settings',
          onPressed: () {
            // Handle settings tap
          },
        ),
        IconButton(
          icon: const Icon(IconlyLight.notification),
          tooltip: 'Notifications',
          onPressed: () {
            // Handle notifications tap
          },
        ),

        VerticalDivider(
          color: dividerColor,
          thickness: dividerThickness,
          indent: dividerIndent,
          endIndent: dividerIndent,
        ),

        Padding(
          padding: const EdgeInsets.only(
            right: AppConstants.kInterElementSpacingMedium, // 12.0
            left: AppConstants.kInterElementSpacing / 2,   // 4.0
          ),
          child: GestureDetector(
            onTap: () {
              // Handle profile avatar tap
            },
            child: const CircleAvatar(
              radius: AppConstants.avatarRadiusMedium, // 16.0
              // In a real app, use user's actual avatar
              backgroundColor: Colors.orangeAccent, // Placeholder color
              child: Text( // Placeholder initials
                'JD',
                style: TextStyle(
                    fontSize: AppConstants.avatarRadiusMedium * 0.8, // Scale text with avatar size
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.mobileAppBarHeight); // e.g., 56.0
}
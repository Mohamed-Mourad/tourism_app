import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../core/constants/app_constants.dart';

class WebNavItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  const WebNavItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppConstants.kCardPadding,
      vertical: AppConstants.kInterElementSpacingMedium + 4.0,
    ),
  });

  @override
  State<WebNavItem> createState() => _WebNavItemState();
}

class _WebNavItemState extends State<WebNavItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color accentColor = theme.colorScheme.primary;

    Color? effectiveBackgroundColor;
    if (_isHovering && !widget.isSelected) {
      effectiveBackgroundColor = theme.colorScheme.primary.withOpacity(0.1);
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: effectiveBackgroundColor ?? Colors.transparent,
          padding: widget.padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.webNavLink
              ),
              const SizedBox(height: 4.0),
              AnimatedContainer(
                duration: AppConstants.kShortAnimationDuration,
                height: 2.5,
                width: widget.isSelected ? 30.0 : 0.0,
                decoration: BoxDecoration(
                  color: widget.isSelected ? accentColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
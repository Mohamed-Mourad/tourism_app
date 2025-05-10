import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget webScaffold;

  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.webScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;

        if (screenWidth >= AppConstants.webBreakpoint) {
          return webScaffold;
        }
        else {
          return mobileScaffold;
        }
      },
    );
  }
}
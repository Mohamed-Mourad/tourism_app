import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;

  const AppLogo({
    super.key,
    this.width,
    this.height,
  });

  // Define the asset path centrally
  static const String _logoAssetPath = 'assets/svgs/logo.svg';

  @override
  Widget build(BuildContext context) {
    final double defaultHeight = height ?? 40.0;

    return SvgPicture.asset(
      _logoAssetPath,
      width: width,
      height: defaultHeight,
      semanticsLabel: 'App Logo',
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
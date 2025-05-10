import 'package:flutter/material.dart';
import 'package:tourism_app/features/item_listing/screens/item_listing_screen.dart';
import 'core/theme/app_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Items App',
      themeMode: ThemeMode.dark,
      darkTheme: getAppThemeData(),
      home: const ItemListingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
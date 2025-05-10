import 'package:flutter/material.dart';
import '../../../core/layout/responsive_layout.dart';
import '../../nav_bar/widgets/web_nav_bar.dart';
import '../../nav_bar/widgets/mobile_nav_bar.dart';
import './web_items_view.dart';
import './mobile_items_view.dart';

class ItemListingScreen extends StatefulWidget {
  const ItemListingScreen({super.key});

  @override
  State<ItemListingScreen> createState() => _ItemListingScreenState();
}

class _ItemListingScreenState extends State<ItemListingScreen> {
  String _currentWebRoute = 'items';

  void _onWebNavItemTapped(String routeName) {
    setState(() {
      _currentWebRoute = routeName;
    });
    // print('Web Nav Tapped: $routeName');
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // ----- Mobile UI -----
      mobileScaffold: Scaffold(
        appBar: MobileNavBar(
          onMenuPressed: () {
            // Scaffold.of(context).openDrawer(); // When MobileDrawer is implemented
            print('Mobile menu icon tapped');
          },
        ),
        // drawer: const MobileDrawer(), // To be added when implemented
        body: const MobileItemsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () { /* Logic for adding new item on mobile */ },
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      // ----- Web UI -----
      webScaffold: Scaffold(
        appBar: WebNavBar(
          currentSelectedRoute: _currentWebRoute,
          onNavItemTap: _onWebNavItemTapped,
        ),
        body: const WebItemsView(),
      ),
    );
  }
}
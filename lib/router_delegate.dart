import 'package:flutter/material.dart';
import 'package:navigator_2_demo/details_screen.dart';
import 'package:navigator_2_demo/home_screen.dart';
import 'package:navigator_2_demo/settings_screen.dart';
import 'route_path.dart';

class MyRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  String? _selectedItem;
  bool _showSettings = false;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RoutePath get currentConfiguration {
    if (_showSettings) {
      return RoutePath.settings();
    } else if (_selectedItem != null) {
      return RoutePath.details(_selectedItem!);
    } else {
      return RoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('HomePage'),
          child: HomeScreen(
            onSettings: _handleSettings,
            onDetails: _handleDetails,
          ),
        ),
        if (_showSettings)
          const MaterialPage(
            key: ValueKey('SettingsPage'),
            child: SettingsScreen(),
          ),
        if (_selectedItem != null)
          MaterialPage(
            key: const ValueKey('DetailsPage'),
            child: DetailsScreen(item: _selectedItem!),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_showSettings) {
          _showSettings = false;
        } else if (_selectedItem != null) {
          _selectedItem = null;
        }
        notifyListeners();
        return true;
      },
    );
  }

  void _handleSettings() {
    _showSettings = true;
    notifyListeners();
  }

  void _handleDetails(String item) {
    _selectedItem = item;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration.isSettingsPage) {
      _showSettings = true;
      _selectedItem = null;
    } else if (configuration.isDetailsPage) {
      _selectedItem = configuration.id;
      _showSettings = false;
    } else {
      _selectedItem = null;
      _showSettings = false;
    }
  }
}

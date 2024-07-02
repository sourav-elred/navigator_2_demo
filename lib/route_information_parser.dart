import 'package:flutter/material.dart';
import 'route_path.dart';

class MyRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return RoutePath.home();
    } else if (uri.pathSegments.length == 1 &&
        uri.pathSegments[0] == 'settings') {
      return RoutePath.settings();
    } else if (uri.pathSegments.length == 2 &&
        uri.pathSegments[0] == 'details') {
      final id = uri.pathSegments[1];
      return RoutePath.details(id);
    } else {
      return RoutePath.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    } else if (configuration.isSettingsPage) {
      return const RouteInformation(location: '/settings');
    } else if (configuration.isDetailsPage) {
      return RouteInformation(location: '/details/${configuration.id}');
    } else {
      return const RouteInformation(location: '/');
    }
  }
}

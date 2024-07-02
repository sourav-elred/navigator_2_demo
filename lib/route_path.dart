class RoutePath {
  final String? id;
  final bool isUnknown;

  RoutePath.home()
      : id = null,
        isUnknown = false;

  RoutePath.details(this.id) : isUnknown = false;

  RoutePath.settings()
      : id = null,
        isUnknown = false;

  RoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null && !isUnknown;

  bool get isDetailsPage => id != null && !isUnknown;

  bool get isSettingsPage => id == null && !isUnknown;
}

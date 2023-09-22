part of bc_utils;

class AppRoutes {
  static const String wrapperRoute = '/wrapper';
  static const String initRoute = '/';
  static const String homeRoute = '/home';
  static const String uploadRoute = '/upload';
  static const String resultRoute = '/result';
  static const String analyticsRoute = '/analytics';
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initRoute:
        return _route(screen: const Loader());
      case AppRoutes.homeRoute:
        return _route(screen: const HomeScreen());
      case AppRoutes.uploadRoute:
        return _route(screen: const UploadScreen());
      case AppRoutes.resultRoute:
        return _route(screen: const ResultScreen());
      case AppRoutes.analyticsRoute:
        return _route(screen: const AnalyticsScreen());
      default:
        return _route(screen: const Loader());
    }
  }

  static Route<dynamic>? _route({screen}) {
    return CupertinoPageRoute(builder: (_) => screen);
  }
}

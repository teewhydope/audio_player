// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const TabScreen(),
      );
    },
    TrackListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const TracksPage(),
      );
    },
    StreamsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SpotifyPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              TrackListRoute.name,
              path: 'track-list-page',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              StreamsRoute.name,
              path: 'streams-page',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [TabScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [TracksPage]
class TrackListRoute extends PageRouteInfo<void> {
  const TrackListRoute()
      : super(
          TrackListRoute.name,
          path: 'track-list-page',
        );

  static const String name = 'TrackListRoute';
}

/// generated route for
/// [SpotifyPage]
class StreamsRoute extends PageRouteInfo<void> {
  const StreamsRoute()
      : super(
          StreamsRoute.name,
          path: 'streams-page',
        );

  static const String name = 'StreamsRoute';
}

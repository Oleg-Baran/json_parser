// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:todo_app/data/models/lessons.dart' as _i5;
import 'package:todo_app/navigation/navigation_container.dart' as _i1;
import 'package:todo_app/screens/detail_screen/detail_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NavigationContainer.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.NavigationContainer(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailPage(
          key: args.key,
          lesson: args.lesson,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          NavigationContainer.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailRoute.name,
          path: '/detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.NavigationContainer]
class NavigationContainer extends _i3.PageRouteInfo<void> {
  const NavigationContainer()
      : super(
          NavigationContainer.name,
          path: '/',
        );

  static const String name = 'NavigationContainer';
}

/// generated route for
/// [_i2.DetailPage]
class DetailRoute extends _i3.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i4.Key? key,
    required _i5.LessonsItem lesson,
  }) : super(
          DetailRoute.name,
          path: '/detail-page',
          args: DetailRouteArgs(
            key: key,
            lesson: lesson,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.lesson,
  });

  final _i4.Key? key;

  final _i5.LessonsItem lesson;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, lesson: $lesson}';
  }
}

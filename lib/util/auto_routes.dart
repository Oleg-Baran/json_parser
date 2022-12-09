import 'package:auto_route/auto_route.dart';
import 'package:todo_app/navigation/navigation_container.dart';
import 'package:todo_app/screens/detail_screen/detail_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page: NavigationContainer, initial: true),
    AutoRoute(page: DetailPage),
  ],
)
class $AppRouter {}

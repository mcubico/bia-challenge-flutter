import 'package:flutter/material.dart';
import 'package:src/ui/helpers/helpers.dart';
import 'package:src/ui/screens/screens.dart';

import '../ui/models/models.dart';

class AppRoutes {
  static const _homeViewRoute = 'home';
  static const _detailViewRoute = 'detail';
  static const initialRoute = _homeViewRoute;

  static final _menuOptions = <MenuOptionModel>[
    // Home
    MenuOptionModel(
      route: _homeViewRoute,
      name: 'Home',
      view: const HomeScreen(),
      icon: Icons.home,
    ),

    // Movie Detail
    MenuOptionModel(
      route: _detailViewRoute,
      name: 'Zone Detail',
      view: const DetailsScreen(),
      icon: Icons.details,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> response = {};
    for (var option in _menuOptions) {
      response.addAll({option.route: (BuildContext context) => option.view});
    }

    return response;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }

  static String getViewRoute(ViewRoutesEnum route) => getViewData(route).route;

  static MenuOptionModel getViewData(ViewRoutesEnum route) {
    late String viewRoute;

    switch (route) {
      case ViewRoutesEnum.home:
        viewRoute = _homeViewRoute;
        break;
      case ViewRoutesEnum.detail:
        viewRoute = _detailViewRoute;
        break;
      default:
        viewRoute = _homeViewRoute;
        break;
    }

    return _menuOptions.firstWhere((element) => element.route == viewRoute);
  }
}

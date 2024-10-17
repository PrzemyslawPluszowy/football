// ignore: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:football/features/app/view/bootom_navigation.dart';
import 'package:football/features/home/domain/entities/reeel_entity.dart';
import 'package:football/features/home/view/home_screen.dart';
import 'package:football/features/home/view/widgets/reels_view/view/reels_screen.dart';
import 'package:football/features/table/view/table_screen.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: BootomNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(
              page: TableRoute.page,
            ),
          ],
        ),
        AutoRoute(page: ReelsRoute.page),
      ];
}

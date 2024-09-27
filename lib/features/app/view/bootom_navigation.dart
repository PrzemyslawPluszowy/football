import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/core/navigation/route.dart';
import 'package:ionicons/ionicons.dart';

@RoutePage()
class BootomNavigationScreen extends StatelessWidget {
  const BootomNavigationScreen({super.key, this.appBar});

  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        const TableRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: appBar,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AutoTabsRouter.of(context).activeIndex,
            onTap: AutoTabsRouter.of(context).setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.home_outline),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined),
                label: 'Table',
              ),
            ],
          ),
        );
      },
    );
  }
}

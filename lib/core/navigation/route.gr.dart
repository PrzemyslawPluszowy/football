// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [BootomNavigationScreen]
class BootomNavigationRoute extends PageRouteInfo<BootomNavigationRouteArgs> {
  BootomNavigationRoute({
    Key? key,
    PreferredSizeWidget? appBar,
    List<PageRouteInfo>? children,
  }) : super(
          BootomNavigationRoute.name,
          args: BootomNavigationRouteArgs(
            key: key,
            appBar: appBar,
          ),
          initialChildren: children,
        );

  static const String name = 'BootomNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BootomNavigationRouteArgs>(
          orElse: () => const BootomNavigationRouteArgs());
      return BootomNavigationScreen(
        key: args.key,
        appBar: args.appBar,
      );
    },
  );
}

class BootomNavigationRouteArgs {
  const BootomNavigationRouteArgs({
    this.key,
    this.appBar,
  });

  final Key? key;

  final PreferredSizeWidget? appBar;

  @override
  String toString() {
    return 'BootomNavigationRouteArgs{key: $key, appBar: $appBar}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ReelsScreen]
class ReelsRoute extends PageRouteInfo<ReelsRouteArgs> {
  ReelsRoute({
    required List<String> reels,
    required int selectedId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ReelsRoute.name,
          args: ReelsRouteArgs(
            reels: reels,
            selectedId: selectedId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReelsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReelsRouteArgs>();
      return ReelsScreen(
        reels: args.reels,
        selectedId: args.selectedId,
        key: args.key,
      );
    },
  );
}

class ReelsRouteArgs {
  const ReelsRouteArgs({
    required this.reels,
    required this.selectedId,
    this.key,
  });

  final List<String> reels;

  final int selectedId;

  final Key? key;

  @override
  String toString() {
    return 'ReelsRouteArgs{reels: $reels, selectedId: $selectedId, key: $key}';
  }
}

/// generated route for
/// [TableScreen]
class TableRoute extends PageRouteInfo<void> {
  const TableRoute({List<PageRouteInfo>? children})
      : super(
          TableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TableRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TableScreen();
    },
  );
}

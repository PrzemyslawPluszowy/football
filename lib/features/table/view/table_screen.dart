import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football/common/widgets/main_app_bar.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';

@RoutePage()
class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors!.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(Sizes.p56),
        child: MainAppBar(),
      ),
    );
  }
}

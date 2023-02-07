import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import 'synthese_home_page.dart';

class GlobalHomePage extends StatefulWidget {
  const GlobalHomePage({super.key});

  @override
  State<GlobalHomePage> createState() => _GlobalHomePageState();
}

class _GlobalHomePageState extends State<GlobalHomePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TabBarView(
        controller: tabController,
        children: const [
          SyntheseHomePage(),
          SyntheseHomePage(),
          SyntheseHomePage(),
          SyntheseHomePage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: AppColors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: TabBar(
          controller: tabController,
          indicator: const BoxDecoration(),
          tabs: const [
            Tab(
              icon: Icon(FeatherIcons.home),
            ),
            Tab(
              icon: Icon(FeatherIcons.user),
            ),
            Tab(
              icon: Icon(FeatherIcons.creditCard),
            ),
            Tab(
              icon: Icon(FeatherIcons.inbox),
            ),
          ],
        ),
      ),
    );
  }
}

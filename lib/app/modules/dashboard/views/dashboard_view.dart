import 'package:appperpus_app/app/modules/profile/views/profile_view.dart';
import 'package:appperpus_app/app/modules/searchbuku/controllers/searchbuku_controller.dart';
import 'package:appperpus_app/app/modules/searchbuku/views/searchbuku_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/customNavigationBar.dart';
import '../../bookmark/views/bookmark_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) {
          return Scaffold(

              body: SafeArea(
                child: Center(
                    child: IndexedStack(
                      index: controller.tabIndex,
                      children: [
                        HomeView(),
                        SearchbukuView(),
                        BookmarkView(),
                        ProfileView(),
                      ],
                    )
                ),
              ),
              bottomNavigationBar: CustomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
              )
          );
        }
    );
  }
}

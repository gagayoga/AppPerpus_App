import 'package:appperpus_app/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:appperpus_app/app/modules/home/controllers/home_controller.dart';
import 'package:appperpus_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:appperpus_app/app/modules/searchbuku/controllers/searchbuku_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<BookmarkController>(
          () => BookmarkController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
    Get.lazyPut<SearchbukuController>(
          () => SearchbukuController(),
    );
  }
}

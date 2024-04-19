import 'package:get/get.dart';

import '../controllers/searchbuku_controller.dart';

class SearchbukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchbukuController>(
      () => SearchbukuController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/updateprofile_controller.dart';

class UpdateprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateprofileController>(
      () => UpdateprofileController(),
    );
  }
}

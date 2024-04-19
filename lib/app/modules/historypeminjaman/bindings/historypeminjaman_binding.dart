import 'package:get/get.dart';

import '../controllers/historypeminjaman_controller.dart';

class HistorypeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistorypeminjamanController>(
      () => HistorypeminjamanController(),
    );
  }
}

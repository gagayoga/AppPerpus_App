import 'package:appperpus_app/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  late final String usernameUser;
  late final String emailUser;
  final loading = false.obs;

  // Color
  final Color primary = const Color(0xFF5566FF);
  final Color yellow = const Color(0xFFFFB800);
  final Color red = const Color(0xFFFF0000);


  @override
  void onInit() {
    super.onInit();
    getDataUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDataUser(){
    usernameUser = StorageProvider.read(StorageKey.username);
    emailUser = StorageProvider.read(StorageKey.email);
  }

  logout() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();

      var response = await ApiProvider.instance().post(
          Endpoint.logout
      );

      if (response.statusCode == 200) {

        StorageProvider.clearAll();

        Get.snackbar("Success",
          "Logout berhasil, Silakan login dahulu",
          backgroundColor: primary,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          icon: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
            "Gagal",
            "Logout Gagal, Coba daftar kembali",
            backgroundColor: Colors.red,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white
        );
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              snackStyle: SnackStyle.FLOATING,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              backgroundColor: red, colorText: Colors.white, icon: const Icon(Icons.error_rounded, color: Colors.white,));
        }
      } else {
        Get.snackbar("Pemberitahuan", e.message ?? "",
            backgroundColor: yellow,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            icon: const Icon(Icons.alarm_add_rounded, color: Colors.white,)
        );
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: red, colorText: Colors.white, icon: const Icon(Icons.error_rounded, color: Colors.white,));
    }
  }
}

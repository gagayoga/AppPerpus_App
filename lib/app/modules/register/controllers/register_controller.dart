import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {

  final loadinglogin = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Color primary = const Color(0xFF5566FF);
  final Color yellow = const Color(0xFFFFB800);
  final Color red = const Color(0xFFFF0000);
  

  var isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  registerPost() async {
    loadinglogin(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        var response = await ApiProvider.instance().post(Endpoint.register,
            data:
            {
              "username": usernameController.text.toString(),
              "email": emailController.text.toString(),
              "password": passwordController.text.toString()
            }
        );
        if (response.statusCode == 201) {
          String username = usernameController.text.toString();
          Get.snackbar("Success",
            "Registrasi berhasil, Hallo $username, Silakan login dahulu",
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
              "Registrasi Gagal, Coba daftar kembali",
              backgroundColor: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              snackStyle: SnackStyle.FLOATING,
              colorText: Colors.white
          );
        }
      }
      loadinglogin(false);
    } on DioException catch (e) {
      loadinglogin(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['Message']}",
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
      loadinglogin(false);
      Get.snackbar("Error", e.toString(),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: red, colorText: Colors.white, icon: const Icon(Icons.error_rounded, color: Colors.white,));
    }
  }
}

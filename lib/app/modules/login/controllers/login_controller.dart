import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoint.dart';
import '../../../data/model/user/response_login.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final loadinglogin = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
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

  login() async {
    loadinglogin(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {
                  "email": emailController.text.toString(),
                  "password": passwordController.text.toString()
                }
            )
        );
        if (response.statusCode == 200) {
          ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.username, responseLogin.data!.username.toString());
          await StorageProvider.write(StorageKey.tokenUser, responseLogin.data!.token.toString());
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id.toString());
          await StorageProvider.write(StorageKey.email, responseLogin.data!.email.toString());
          await StorageProvider.write(StorageKey.bio, responseLogin.data!.bio.toString());
          await StorageProvider.write(StorageKey.namaLengkap, responseLogin.data!.namaLengkap.toString());
          await StorageProvider.write(StorageKey.telepon, responseLogin.data!.telepon.toString());

          String username =  StorageProvider.read(StorageKey.username);

          Get.snackbar("Success",
            "Login berhasil, Welcome back $username",
            backgroundColor: primary,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          );
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar(
              "Sorry",
              "Login Gagal, Coba kembali masuk dengan akun anda",
              backgroundColor: red,
              snackStyle: SnackStyle.FLOATING,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              colorText: Colors.white
          );
        }
      }
      loadinglogin(false);
    } on dio.DioException catch (e) {
      loadinglogin(false);
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
          colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            icon: const Icon(Icons.alarm_add_rounded, color: Colors.white,
            )
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

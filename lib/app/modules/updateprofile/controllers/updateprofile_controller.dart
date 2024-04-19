import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/user/response_data_profile.dart';
import '../../../data/model/user/response_update_profile.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class UpdateprofileController extends GetxController with StateMixin{

  var detailProfile = Rxn<DataUser>();
  final loading = false.obs;
  final loadingLogout = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController namalengkapController = TextEditingController();

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

  Future<void> getDataUser() async {
    detailProfile.value = null;
    change(null, status: RxStatus.loading());

    try {
      final responseDetailBuku = await ApiProvider.instance().get(Endpoint.getDataProfile);

      if (responseDetailBuku.statusCode == 200) {
        final ResponseDataProfile responseBuku = ResponseDataProfile.fromJson(responseDetailBuku.data);

        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          detailProfile(responseBuku.data);
          emailController.text = detailProfile.value!.email.toString();
          bioController.text = detailProfile.value!.bio.toString();
          teleponController.text = detailProfile.value!.telepon.toString();
          usernameController.text = detailProfile.value!.username.toString();
          namalengkapController.text = detailProfile.value!.namaLengkap.toString();
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  updateProfilePost() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        var response = await ApiProvider.instance().patch(Endpoint.updateProfile,
            data:
            {
              "Username" : usernameController.text.toString(),
              "Bio" : bioController.text.toString(),
              "NamaLengkap" : namalengkapController.text.toString(),
              "Email" : emailController.text.toString(),
              "NoTelepon" : teleponController.text.toString(),
            }
        );
        if (response.statusCode == 201) {
          ResponseUpdateProfile responseUpdateProfile = ResponseUpdateProfile.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.username, responseUpdateProfile.data!.username.toString());
          await StorageProvider.write(StorageKey.idUser, responseUpdateProfile.data!.id.toString());
          await StorageProvider.write(StorageKey.email, responseUpdateProfile.data!.email.toString());
          await StorageProvider.write(StorageKey.bio, responseUpdateProfile.data!.bio.toString());
          await StorageProvider.write(StorageKey.namaLengkap, responseUpdateProfile.data!.namaLengkap.toString());
          await StorageProvider.write(StorageKey.telepon, responseUpdateProfile.data!.telepon.toString());
          String username = usernameController.text.toString();
          Get.snackbar("Success",
            "Update Profile Akun $username Berhasil",
            backgroundColor: primary,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          );
          getDataUser();
          Navigator.pop(Get.context!, 'OK');
        } else {
          Get.snackbar(
              "Gagal",
              "Update Profile Gagal, Coba kembali",
              backgroundColor: Colors.red,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              snackStyle: SnackStyle.FLOATING,
              colorText: Colors.white
          );
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
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
      loading(false);
      Get.snackbar("Error", e.toString(),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: red, colorText: Colors.white, icon: const Icon(Icons.error_rounded, color: Colors.white,));
    }
  }
}

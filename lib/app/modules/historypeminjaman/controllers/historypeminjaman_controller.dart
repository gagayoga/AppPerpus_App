import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customTextField.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/model/peminjaman/response_history_peminjaman.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class HistorypeminjamanController extends GetxController with StateMixin{

  var historyPeminjaman = RxList<DataHistory>();
  String idUser = StorageProvider.read(StorageKey.idUser);

  // Post Ulasan
  double ratingBuku= 0;
  final loadingUlasan = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ulasanController = TextEditingController();

  // Color
  final Color primary = const Color(0xFF5566FF);
  final Color yellow = const Color(0xFFFFB800);
  final Color red = const Color(0xFFFF0000);

  @override
  void onInit() {
    super.onInit();
    getDataPeminjaman();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataPeminjaman() async {
    change(null, status: RxStatus.loading());

    try {
      final responseHistoryPeminjaman = await ApiProvider.instance().get(
          '${Endpoint.pinjamBuku}/$idUser');

      if (responseHistoryPeminjaman.statusCode == 200) {
        final ResponseHistoryPeminjaman responseHistory = ResponseHistoryPeminjaman.fromJson(responseHistoryPeminjaman.data);

        if (responseHistory.data!.isEmpty) {
          historyPeminjaman.clear();
          change(null, status: RxStatus.empty());
        } else {
          historyPeminjaman.assignAll(responseHistory.data!);
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

  // View Post Ulasan Buku
  Future<void> kontenBeriUlasan(String idBuku, String NamaBuku) async{
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Berikan Ulasan Buku',
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(Get.context!).size.width,
              child: Form(
                key: formKey,
                child: ListBody(
                  children: <Widget>[

                    Text(
                      'Rating Buku',
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    RatingBar.builder(
                      allowHalfRating: false,
                      itemCount: 5,
                      minRating: 1,
                      initialRating: 5,
                      direction: Axis.horizontal,
                      itemSize: 30,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {
                        ratingBuku = value;
                      },
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    CustomTextField(
                      labelText: 'Ulasan Buku',
                      controller: ulasanController,
                      hinText: 'Ulasan Buku',
                      obsureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pleasse input ulasan buku';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: MediaQuery.of(Get.context!).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(Get.context!).size.width,
                  height: 50,
                  child: TextButton(
                    autofocus: true,
                    style: TextButton.styleFrom(
                      backgroundColor: primary,
                      animationDuration: const Duration(milliseconds: 300),
                    ),
                    onPressed: (){
                      postUlasanBuku(idBuku, NamaBuku);
                      Navigator.of(Get.context!).pop();
                    },
                    child: Text(
                      'Simpan Ulasan Buku',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  postUlasanBuku(String buku, String namaBuku) async {
    loadingUlasan(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        int ratingBukuInt = ratingBuku.round();
        final response = await ApiProvider.instance().post(Endpoint.ulasanBuku,
            data: dio.FormData.fromMap(
                {
                  "Rating": ratingBukuInt,
                  "BukuID": buku,
                  "Ulasan": ulasanController.text.toString()
                }
            )
        );
        if (response.statusCode == 201) {
          Get.snackbar("Success",
            "Ulasan Buku $namaBuku berhasil di simpan",
            backgroundColor: primary,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          );
          Navigator.of(Get.context!).pop();
          ulasanController.text = '';
        } else {
          Get.snackbar(
              "Sorry",
              "Ulasan Gagal di simpan, Coba kembali lagi",
              backgroundColor: red,
              snackStyle: SnackStyle.FLOATING,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              colorText: Colors.white
          );
        }
      }
      loadingUlasan(false);
    } on dio.DioException catch (e) {
      loadingUlasan(false);
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
      loadingUlasan(false);
      Get.snackbar("Error", e.toString(),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: red, colorText: Colors.white, icon: const Icon(Icons.error_rounded, color: Colors.white,));
    }
  }

}

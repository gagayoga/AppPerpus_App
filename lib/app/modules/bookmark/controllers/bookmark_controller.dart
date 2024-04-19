import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_koleksi_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class BookmarkController extends GetxController with StateMixin{

  var koleksiBook = RxList<DataKoleksiBook>();
  String idUser = StorageProvider.read(StorageKey.idUser);

  var loading = false.obs;

  // Jumlah Data
  int get jumlahKoleksiBook => koleksiBook.length;

  @override
  void onInit() async{
    super.onInit();
    await getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final responseKoleksiBuku = await ApiProvider.instance().get(
          '${Endpoint.koleksiBuku}/$idUser');

      if (responseKoleksiBuku.statusCode == 200) {
        final ResponseKoleksiBook responseKoleksi = ResponseKoleksiBook.fromJson(responseKoleksiBuku.data);

        if (responseKoleksi.data!.isEmpty) {
          koleksiBook.clear();
          change(null, status: RxStatus.empty());
        } else {
          koleksiBook.assignAll(responseKoleksi.data!);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  deleteKoleksiBook(String id, BuildContext context) async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      var userID = StorageProvider.read(StorageKey.idUser).toString();
      var bukuID = id.toString();

      var response = await ApiProvider.instance().delete(
          '${Endpoint.deleteKoleksi}$userID/koleksi/$bukuID');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Buku berhasil dihapus di koleksi buku",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFF5F5F5),
          textColor: const Color(0xFF5566FF),
        );
        getData();
      } else {
        Fluttertoast.showToast(
          msg: "Buku gagal dihapus, silakan coba kembali",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFF5F5F5),
          textColor: Colors.black,
        );
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Fluttertoast.showToast(
            msg: e.response?.data?['Message'] ?? "Terjadi kesalahan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: const Color(0xFFF5F5F5),
            textColor: Colors.black,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: e.message ?? "Terjadi kesalahan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFFF5F5F5),
          textColor: Colors.black,
        );
      }
    } catch (e) {
      loading(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xFFF5F5F5),
        textColor: Colors.black,
      );
    }
  }
}

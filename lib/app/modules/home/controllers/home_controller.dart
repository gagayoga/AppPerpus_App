import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book_new.dart';
import '../../../data/model/response_popular_book.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController with StateMixin{

  var newBooks = RxList<DataBookNew>();
  var popularBooks = RxList<DataPopularBook>();

  @override
  void onInit() {
    super.onInit();
    getData();
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
      final responseNew = await ApiProvider.instance().get(Endpoint.bukuNew);
      final responsePopular = await ApiProvider.instance().get(Endpoint.bukuPopular);

      if (responseNew.statusCode == 200 && responsePopular.statusCode == 200) {
        final ResponseBookNew responseBukuNew = ResponseBookNew.fromJson(responseNew.data);
        final ResponsePopularBook responseBukuPopular = ResponsePopularBook.fromJson(responsePopular.data);

        if (responseBukuNew.data!.isEmpty && responseBukuPopular.data!.isEmpty) {
          newBooks.clear();
          popularBooks.clear();
          change(null, status: RxStatus.empty());
        } else {
          newBooks.assignAll(responseBukuNew.data!);
          popularBooks.assignAll(responseBukuPopular.data!);
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
}

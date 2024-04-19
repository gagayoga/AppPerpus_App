import 'package:appperpus_app/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  static late Dio _dio;

  static Dio instance() {
    _dio = Dio();

    // Tambahkan interceptor untuk logging
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: kDebugMode,
      requestBody: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: false,
      error: kDebugMode,
      compact: kDebugMode,
      maxWidth: 90,
    ));

    // Tambahkan interceptor untuk penanganan token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Ambil token dari shared preferences
        String? token = StorageProvider.read(StorageKey.tokenUser);

        // Tambahkan token ke dalam header jika token tersedia
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }

        return handler.next(options);
      },
    ));

    return _dio;
  }
}

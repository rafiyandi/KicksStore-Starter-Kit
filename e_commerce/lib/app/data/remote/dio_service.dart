import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Service Singleton HTTP Client Dio (Sesi 05: REST API Networking)
class DioService {
  static final DioService _instance = DioService._internal();
  factory DioService() => _instance;

  late final Dio dio;

  DioService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Logging interceptor untuk memudahkan siswa SMK mengamati request & response di terminal
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: false,
          error: true,
          logPrint: (obj) => debugPrint('[DIO NETWORK] $obj'),
        ),
      );
    }
  }
}

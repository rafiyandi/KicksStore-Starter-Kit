import 'package:dio/dio.dart';
import 'package:e_commerce/app/data/models/product_model.dart';
import 'package:e_commerce/app/data/remote/dio_service.dart';

/// Repository untuk abstraksi pemanggilan data produk (Sesi 05: REST API Networking)
class ProductRepository {
  final DioService _dioService = DioService();

  /// Mengambil data produk sepatu dari endpoint DummyJSON
  Future<List<ProductModel>> fetchProducts() async {
    try {
      // Mengakses endpoint kategori mens-shoes di DummyJSON
      final response = await _dioService.dio.get('/products/category/mens-shoes');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic> && data['products'] is List) {
          final List list = data['products'] as List;
          return list
              .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
      }
      return [];
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception('Gagal memuat katalog: $e');
    }
  }

  /// Helper untuk menyajikan pesan error jaringan yang edukatif bagi siswa SMK
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Waktu koneksi habis (Timeout). Periksa koneksi internet Anda.';
      case DioExceptionType.connectionError:
        return 'Gagal terhubung ke server. Pastikan perangkat terhubung ke internet.';
      case DioExceptionType.badResponse:
        return 'Server memberikan respons kesalahan (${error.response?.statusCode}).';
      case DioExceptionType.cancel:
        return 'Permintaan data dibatalkan.';
      default:
        return 'Gangguan koneksi: ${error.message}';
    }
  }
}

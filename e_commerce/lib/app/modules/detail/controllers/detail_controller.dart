import 'package:get/get.dart';

import 'package:e_commerce/app/data/models/product_model.dart';
import 'package:e_commerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerce/app/modules/home/controllers/home_controller.dart';

class DetailController extends GetxController {
  // Sesi 03: Arsitektur MVVM - Model Data Type-Safe
  final product = Rx<ProductModel?>(null);
  final quantity = 1.obs;
  final selectedSize = '42'.obs;
  final isFavorite = false.obs;

  // Daftar Ukuran Sepatu Tersedia
  final availableSizes = ['40', '41', '42', '43', '44'];

  @override
  void onInit() {
    super.onInit();
    // Menangkap data argumen yang dikirim dari HomeView
    if (Get.arguments != null) {
      if (Get.arguments is ProductModel) {
        product.value = Get.arguments as ProductModel;
      } else if (Get.arguments is Map<String, dynamic>) {
        product.value = ProductModel.fromMap(Get.arguments as Map<String, dynamic>);
      }
    }

    // Fallback data default jika dibuka langsung
    product.value ??= const ProductModel(
      id: 'shoe-01',
      name: 'Nike Air Jordan 1 High OG',
      category: 'Basketball',
      price: 2499000,
      rating: 4.9,
      reviewCount: 312,
      imageUrl:
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?auto=format&fit=crop&w=800&q=80',
      description:
          'Sepatu legendaris dengan material kulit premium, bantalan Air-Sole klasik, dan sol traksi karet tangguh untuk gaya hidup dan performa maksimal.',
    );

    // Cek apakah item ini sudah ada di daftar wishlist HomeController
    if (Get.isRegistered<HomeController>() && product.value != null) {
      final homeController = Get.find<HomeController>();
      isFavorite.value = homeController.isFavorite(product.value!.id);
    }
  }

  // Tambah kuantitas
  void incrementQuantity() {
    quantity.value++;
  }

  // Kurangi kuantitas (minimal 1)
  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  // Ganti ukuran sepatu aktif
  void changeSize(String size) {
    selectedSize.value = size;
  }

  // Toggle status favorit
  void toggleFavorite() {
    if (product.value == null) return;
    isFavorite.value = !isFavorite.value;
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().toggleFavorite(product.value!.id);
    }
  }

  // Sesi 03: Mengakses CartController via Dependency Injection
  CartController get cartController {
    if (Get.isRegistered<CartController>()) {
      return Get.find<CartController>();
    }
    return Get.put(CartController());
  }

  // Jumlah total item di keranjang untuk badge AppBar reaktif
  int get cartCount => cartController.totalItemCount;

  // Sesi 03: Mengirim produk ke CartController via Dependency Injection (Get.find)
  void addToCart() {
    if (product.value == null) return;

    cartController.addItem(
      product.value!,
      quantity: quantity.value,
      size: selectedSize.value,
    );
  }
}


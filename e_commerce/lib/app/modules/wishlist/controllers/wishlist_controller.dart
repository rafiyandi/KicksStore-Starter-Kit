import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/app/data/models/product_model.dart';
import 'package:e_commerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerce/app/modules/home/controllers/home_controller.dart';

class WishlistController extends GetxController {
  // Sesi 03: Mengakses HomeController dan CartController via Dependency Injection

  HomeController get homeController {
    if (Get.isRegistered<HomeController>()) {
      return Get.find<HomeController>();
    }
    return Get.put(HomeController());
  }

  CartController get cartController {
    if (Get.isRegistered<CartController>()) {
      return Get.find<CartController>();
    }
    return Get.put(CartController());
  }

  // Daftar produk yang sedang difavoritkan oleh pengguna
  List<ProductModel> get wishlistItems {
    final favIds = homeController.favoriteIds;
    return homeController.products
        .where((product) => favIds.contains(product.id))
        .toList();
  }

  int get totalCount => wishlistItems.length;

  // Hapus dari wishlist
  void removeFromWishlist(String productId) {
    homeController.favoriteIds.remove(productId);
    Get.snackbar(
      'Dihapus dari Wishlist',
      'Produk telah dikeluarkan dari daftar favorit.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF334155),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.favorite_border, color: Colors.white),
    );
  }

  // Pindahkan item wishlist langsung ke keranjang belanja
  void moveToCart(ProductModel product) {
    cartController.addItem(product);
    homeController.favoriteIds.remove(product.id);
  }

  // Buka detail produk
  void openDetail(ProductModel product) {
    Get.toNamed('/detail', arguments: product.toMap());
  }
}

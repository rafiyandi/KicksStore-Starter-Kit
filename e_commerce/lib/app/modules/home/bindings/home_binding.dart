import 'package:get/get.dart';

import 'package:e_commerce/app/modules/cart/controllers/cart_controller.dart';
import '../controllers/home_controller.dart';

/// Sesi 03: Dependency Injection via Binding
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Inisialisasi CartController agar tersedia secara global di seluruh aplikasi
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

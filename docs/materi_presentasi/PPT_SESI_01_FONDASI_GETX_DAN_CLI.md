---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #0F172A
color: #F8FAFC
style: |
  section {
    font-family: 'Inter', sans-serif;
    padding: 40px;
  }
  h1 {
    color: #818CF8;
  }
  h2 {
    color: #38BDF8;
  }
  h3 {
    color: #F472B6;
  }
  code {
    background: #1E293B;
    color: #38BDF8;
  }
  footer {
    font-size: 0.5em;
    color: #94A3B8;
  }
---

# KICKSTORE: FLUTTER BOOTCAMP
## Sesi 01: Menguasai Fondasi GetX & GetX CLI
### 3 Pilar Utama: State, Route, & Dependency Management

**Instruktur**: Sanbercode Flutter SMK Specialist  
**Aplikasi Acuan**: KicksStore Mini E-Commerce  
**Prasyarat**: Dasar Pemrograman Dart & Flutter SDK  

---

## DAFTAR AGENDA HARI INI 

1. **Kenapa GetX?** Masalah Klasik Flutter Standar vs Solusi GetX
2. **Pilar 1: State Management** (Reaktivitas `.obs` & `Obx`)
3. **Pilar 2: Route Management** (Navigasi Bersih tanpa `BuildContext`)
4. **Pilar 3: Dependency Management** (Injeksi Memori & `Bindings`)
5. **GetX CLI**: Standarisasi Proyek & Otomasi Arsitektur Industri
6. **Bedah Arsitektur Starter Kit**: Menjelajahi Repositori *KicksStore*
7. **Kuis Interaktif & Persiapan Sesi 02**

---

## 1. MASALAH KLASIK FLUTTER STANDAR

Sebelum mengenal GetX, perhatikan kendala yang sering dihadapi developer:

| Masalah di Flutter Standar | Dampak pada Aplikasi |
|---|---|
| **`setState()` Rebuild Terlalu Luas** | Seluruh pohon widget di-rebuild, performa boros baterai dan FPS drop |
| **Ketergantungan `BuildContext`** | Pindah halaman atau menampilkan snackbar butuh context yang dalam |
| **Boilerplate Provider / Bloc Rumit** | Butuh puluhan baris kode hanya untuk mengubah 1 angka counter |
| **Manajemen Memori Manual** | Controller sering lupa di-dispose sehingga terjadi memory leak |

---

## SOLUSI REVOLUSIONER: TIGA PILAR GETX

GetX adalah framework mikro yang sangat ringan, cepat, dan powerful dengan 3 pilar:

```
                  ┌─────────────────────────────────┐
                  │          GETX FRAMEWORK         │
                  └────────────────┬────────────────┘
          ┌────────────────────────┼────────────────────────┐
          ▼                        ▼                        ▼
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ STATE MANAGEMENT │     │ ROUTE MANAGEMENT │     │    DEPENDENCY    │
│  (Data Reaktif)  │     │ (Navigasi Bebas) │     │    MANAGEMENT    │
│   .obs  &  Obx   │     │  Get.toNamed()   │     │ Get.lazyPut & DI │
└──────────────────┘     └──────────────────┘     └──────────────────┘
```

> **Prinsip Utama GetX**: *High Performance*, *Minimal Consumption*, dan *Clean Code*.

---

## ANALOGI DUNIA NYATA: RESTORAN KICKSTORE

Mari bayangkan arsitektur GetX seperti alur kerja di sebuah Restoran Modern:

- 👤 **User**: Pembeli sepatu di aplikasi
- 📋 **View (UI)**: Meja makan & buku menu (hanya menampilkan data)
- 👨‍🍳 **Controller (Logika)**: Koki di dapur (mengolah data, menghitung harga)
- 🚚 **Binding (Dependency)**: Supplier logistik (mengantar bahan ke dapur saat restoran buka)
- 🚪 **Route (Navigasi)**: Pintu antar ruangan (VIP room, kasir, dapur) tanpa perlu izin berbelit-belit

---

## PILAR 1: STATE MANAGEMENT
### Apa Itu "State"?

> **State** adalah informasi atau data yang dapat berubah selama aplikasi berjalan dan memengaruhi apa yang tampil di layar (misalnya: jumlah barang di keranjang, status login, list sepatu).

### Cara Biasa vs Cara GetX

```dart
// ❌ CARA BIASA (StatefulWidget + setState)
int counter = 0;
void increment() {
  setState(() {
    counter++; // Merender ulang SELURUH Scaffold halaman!
  });
}
```

```dart
// ✅ CARA GETX (Reaktif murni)
var counter = 0.obs; // Cukup tambahkan .obs
void increment() => counter++; // Otomatis memberitahu widget yang mendengar
```

---

## CARA KERJA REAKTIVITAS: `.obs` & `Obx()`

1. Tambahkan `.obs` di belakang variabel di **Controller**:
   ```dart
   class CartController extends GetxController {
     var itemCount = 1.obs;      // RxInt
     var isFavorite = false.obs;  // RxBool
     var totalPrice = 0.0.obs;    // RxDouble
     
     void add() => itemCount.value++;
   }
   ```
2. Bungkus HANYA bagian widget yang perlu diupdate dengan `Obx` di **View**:
   ```dart
   Obx(() => Text("Jumlah Item: ${controller.itemCount}"))
   ```
>  **Keajaiban Performa**: Hanya `Text` ini saja yang di-rebuild! Tombol, AppBar, dan Background tetap tenang tanpa komputasi ulang.

---

## PILAR 2: ROUTE MANAGEMENT
### Navigasi Tanpa "BuildContext"

Di Flutter bawaan, kita harus membawa `BuildContext`:
```dart
// ❌ FLUTTER STANDAR (Panjang dan butuh context)
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => const DetailView()),
);
```

Di GetX, navigasi sangat manusiawi dan dapat dipanggil dari mana saja:
```dart
// ✅ GETX ROUTING (Ringkas, elegan, global)
Get.toNamed('/detail');                      // Pindah halaman
Get.back();                                 // Kembali (Pop)
Get.offNamed('/home');                      // Pindah & hapus halaman sebelumnya
Get.offAllNamed('/login');                  // Hapus semua history (misal: Logout)
```

---

## MENGIRIM ARGUMEN & DATA ANTAR HALAMAN

Bagaimana saat user klik produk di Katalog lalu ingin membuka Detail Produk?

### 1. Di Halaman Pengirim (Home):
```dart
Get.toNamed('/detail', arguments: {
  'id': 'shoe-01',
  'name': 'Nike Air Jordan High',
  'price': 2499000,
});
```

### 2. Di Halaman Penerima (Detail Controller):
```dart
class DetailController extends GetxController {
  late Map<String, dynamic> product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments; // Langsung tangkap datanya!
  }
}
```

---

## PILAR 3: DEPENDENCY MANAGEMENT
### Apa Itu Dependency Injection (DI)?

> **Dependency Injection** adalah cara memberikan controller atau service ke widget yang membutuhkan **tanpa harus membuat instance baru berulang-ulang**.

```dart
// ❌ Tanpa DI: Boros memori, state berbeda di tiap tempat
CartController cart = CartController(); 

// ✅ Dengan GetX DI: Mengambil instance yang SAMA di mana saja
CartController cart = Get.find<CartController>();
```

### Metode Injeksi di GetX:
- `Get.put(Controller())` : Dibuat langsung di memori saat itu juga.
- `Get.lazyPut(() => Controller())` : Hemat RAM! Objek baru dibuat saat pertama kali digunakan (`Get.find`).
- `Get.find<Controller>()` : Mengambil objek yang sudah terdaftar.

---

## JEMBATAN OTOMATIS: GETX BINDINGS

Agar kode bersih, kita tidak menaruh `Get.lazyPut` di dalam widget View. Kita taruh di file khusus bernama **`Binding`**:

```dart
// lib/app/modules/cart/bindings/cart_binding.dart
class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
```

### Siklus Hidup Memori Otomatis:
1. User masuk ke `/cart` ➡️ `CartBinding` aktif ➡️ `CartController` dimuat ke RAM.
2. User menekan tombol Back ➡️ `CartController` **otomatis dihapus (disposed)** dari RAM.
3. Bebas *Memory Leak* tanpa perlu mengetik `dispose()` manual!

---

## MENGENAL GETX CLI: STANDAR INDUSTRI

> **GetX CLI** adalah Command Line Tool resmi dari komunitas GetX untuk mengotomatisasi pembuatan folder, file, controller, view, dan routes dalam hitungan detik.

### Kenapa Wajib Menggunakan GetX CLI di SMK?
1. **Standarisasi**: Seluruh siswa di kelas memiliki struktur folder dan penamaan yang 100% identik.
2. **Anti-Typo**: Menghilangkan kesalahan manusia saat mendaftarkan routing.
3. **Cepat**: Membuat 1 fitur lengkap (View + Controller + Binding + Route) hanya dengan 1 baris perintah terminal.

---

## CHEAT SHEET PERINTAH GETX CLI

Perintah yang digunakan untuk membangun proyek KicksStore:

```bash
# 1. Inisialisasi Proyek Baru
get create project:e_commerce

# 2. Membuat Modul Lengkap (View + Controller + Binding + Route Otomatis)
get create page:home
get create page:detail
get create page:cart
get create page:checkout
get create page:wishlist
get create page:login
get create page:register
get create page:orders
```

---

## ANATOMI STRUKTUR FOLDER GETX PATTERN

Inilah struktur folder berstandar industri yang sudah ada di proyek kita:

```
lib/
├── app/
│   ├── core/
│   │   └── theme/            <-- AppColors & AppTheme (Dark/Light)
│   ├── data/                 <-- Models, Providers/Dio, Hive Box
│   ├── modules/              <-- Modular Per Fitur
│   │   ├── home/
│   │   │   ├── bindings/     <-- home_binding.dart
│   │   │   ├── controllers/  <-- home_controller.dart
│   │   │   └── views/        <-- home_view.dart & components/
│   │   ├── detail/
│   │   ├── cart/
│   │   └── ... (8 Modul)
│   └── routes/
│       ├── app_pages.dart    <-- Daftar Route & Binding Terdaftar
│       └── app_routes.dart   <-- Konstanta String Path (/home, /cart)
└── main.dart                 <-- GetMaterialApp & Entrypoint
```

---

## BAGAIMANA SEMUA INI TERHUBUNG? (FLOW CHART)

```
[ Klik Tombol di HomeView ]
             │
             ▼
   Get.toNamed('/detail')
             │
             ▼
   [ app_pages.dart ] ──── Menemukan Route '/detail'
             │
      ┌──────┴──────┐
      ▼             ▼
[ DetailBinding ]  [ DetailView ]
      │             │
      ▼             ▼
Injeksi Controller  Menampilkan UI Adaptif
(DetailController)  (Light/Dark Theme)
      │             │
      └──────┬──────┘
             ▼
[ Obx Merender State Reaktif ]
```

---

## MEMPERKENALKAN STARTER-KIT KICKSSTORE

Dalam pembelajaran ini, seluruh tampilan antarmuka (**8 Modul UI**) telah disiapkan di branch **`starter-kit`**:

- 🌟 UI Modern, Bersih, dan Komersial (Standar Industri E-Commerce)
- 🌓 Mendukung **Light Mode** dan **Dark Mode** secara otomatis
- 🛒 8 Modul Lengkap: Home, Detail, Cart, Wishlist, Checkout, Login, Register, Orders
- 🎯 **Tugas Kita di Sesi-Sesi Berikutnya**:
  Fokus 100% mempelajari dan menginjeksi:
  *Logika Bisnis*, *Reaktivitas GetX*, *Dio Rest API*, *Hive NoSQL Storage*, dan *Firebase Auth/Firestore*!

---

## KUIS INTERAKTIF CEPAT (CEK PEMAHAMAN) 

### Pertanyaan 1:
> *"Apa yang terjadi pada widget Text yang dibungkus `Obx(() => Text(...))` ketika variabel `.obs` di dalamnya berubah nilai?"*
- **A)** Seluruh halaman Scaffold dirender ulang
- **B)** Hanya widget Text itu saja yang di-update secara efisien
- **C)** Aplikasi mengalami crash

---

## KUIS INTERAKTIF CEPAT (CEK PEMAHAMAN) 

### Pertanyaan 2:
> *"Apa keuntungan utama memanggil navigasi `Get.toNamed('/cart')` dibanding `Navigator.push` bawaan Flutter?"*
- **A)** Tidak membutuhkan `BuildContext` dan lebih ringkas
- **B)** Harus selalu menulis StatefulWidget
- **C)** Hanya bisa berjalan di web browser

---

## KUIS INTERAKTIF CEPAT (CEK PEMAHAMAN) 

### Pertanyaan 3:
> *"Apa peran dari file `Binding` pada arsitektur GetX?"*
- **A)** Menghias tampilan tombol dengan warna gradien
- **B)** Menghubungkan halaman dengan Controller-nya menggunakan Dependency Injection
- **C)** Mengubah nama aplikasi di Play Store

---

## PENUTUP & CHECKLIST PERSIAPAN SESI 02 

###  Yang Telah Kita Kuasai Hari Ini:
1. Memahami 3 Pilar GetX: State, Route, dan Dependency Management.
2. Memahami peran GetX CLI dalam standarisasi arsitektur modular.
3. Mengenal struktur folder `lib/app/` (routes, modules, data, core).

###  Persiapan untuk Sesi 02:
1. Pastikan Flutter SDK & VS Code / Android Studio siap dijalankan.
2. Clone repository dan checkout ke branch `starter-kit`.
3. Jalankan `flutter run` untuk memastikan UI tampil sempurna di emulator/device!

---

# TERIMA KASIH! 
## Mari Bangun Masa Depan Mobile Developer SMK yang Kompeten & Siap Industri! 

*Pertanyaan & Diskusi: Silakan tanyakan ke instruktur.*

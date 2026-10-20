# BRIEF & SPESIFIKASI SLIDE PRESENTASI: SESI 01
## Materi: Fondasi GetX Framework (3 Pilar Utama) & GetX CLI Architecture
> **Panduan Penggunaan**: File ini dirancang khusus sebagai *Source Document / Master Prompt* untuk dimasukkan ke AI generator presentasi seperti **Claude, NotebookLM, Gamma.app, atau ChatGPT** agar menghasilkan slide deck presentasi visual yang modern, profesional, dan berstandar industri.

---

## 1. PANDUAN GAYA & DESAIN UNTUK AI (DESIGN DIRECTIVES)

* **Tema Visual**: **Clean Light Theme** (Minimalis, Modern, Elegan).
* **Latar Belakang**: Putih Bersih (`#FFFFFF`) dipadu dengan kartu abu-abu lembut Slate (`#F8FAFC`).
* **Palet Warna Utama**:
  * *Primary Color*: Deep Indigo (`#4F46E5`) — untuk judul utama, ikon, dan aksen aktif.
  * *Secondary / Accent*: Energetic Coral (`#EA580C`) — untuk badge perhatian dan highlight.
  * *Support Colors*: Emerald Green (`#16A34A`) untuk kelebihan/solusi, Soft Rose (`#DC2626`) untuk kendala/problem.
  * *Text Color*: Slate 900 (`#0F172A`) untuk judul, Slate 700 (`#334155`) untuk body text.
* **Tipografi**: Sans-Serif Modern (Plus Jakarta Sans, Inter, atau SF Pro Display). Kode menggunakan JetBrains Mono / Fira Code.
* **Proporsi Teks**: Hindari teks raksasa yang memenuhi layar. Gunakan hirarki visual proporsional: Title (28–32pt), Subtitle (18–20pt), Body/List (13–15pt), Code (11–12pt).
* **Format Rasio Slide**: Widescreen 16:9.
* **Target Audiens**: Siswa SMK Jurusan Rekayasa Perangkat Lunak (RPL) / Mobile Application Developer tingkat menengah.

---

## 2. STRUKTUR & DETAIL KONTEN SLIDE-BY-SLIDE

---

### SLIDE 1: COVER PRESENTASI (TITLE SLIDE)
* **Tipe Slide**: Hero Cover Minimalis dengan Badge Kategori.
* **Badge Atas**: `FLUTTER BOOTCAMP SMK • SESI 01`
* **Judul Utama**: Menguasai Fondasi Arsitektur GetX & GetX CLI
* **Sub-Judul**: Membedah 3 Pilar Utama: State Management, Route Management, & Dependency Management
* **Elemen Visual / Kartu Metadata**:
  * *Studi Kasus Proyek*: Aplikasi Mini E-Commerce Sepatu (**KicksStore**).
  * *Metode Belajar*: Clean UI Starter Kit & Step-by-Step Logic Injection.
  * *Instruktur*: Sanbercode Flutter SMK Specialist.
* **Speaker Notes (Catatan Instruktur)**:
  > "Selamat pagi/siang rekan-rekan siswa. Hari ini di Sesi 01 kita tidak langsung terjun mengetik ratusan baris layouting. Kita akan membangun peta mental yang sangat penting: bagaimana arsitektur GetX membuat kode aplikasi mobile kita jauh lebih cepat, hemat memori, dan rapi seperti standar industri di perusahaan teknologi."

---

### SLIDE 2: AGENDA PEMBELAJARAN
* **Tipe Slide**: 3-Column Grid Cards.
* **Judul Slide**: Agenda & Alur Belajar Sesi 01
* **Konten Kartu**:
  * **Kartu 1 (Problem Statement)**:
    * Ikon: ⚠️ Warning Icon
    * Judul: Evaluasi Flutter Standar
    * Poin: Mengapa `setState()` boros memori dan `BuildContext` menyulitkan navigasi.
  * **Kartu 2 (Core Framework)**:
    * Ikon: 🏛️ Pillar Icon
    * Judul: Bedah 3 Pilar GetX
    * Poin: State reaktif (`.obs`/`Obx`), routing bebas context, dan Dependency Injection via Binding.
  * **Kartu 3 (Tooling & Starter Kit)**:
    * Ikon: ⚡ Lightning / CLI Icon
    * Judul: Otomasi GetX CLI & KicksStore
    * Poin: Standarisasi folder modular dan onboarding branch `starter-kit`.
* **Speaker Notes**:
  > "Agenda kita terbagi menjadi 3 bagian: pertama memahami masalah, kedua memahami solusi 3 pilar GetX, dan ketiga melihat implementasinya langsung pada proyek KicksStore."

---

### SLIDE 3: MASALAH PADA FLUTTER STANDAR (PAIN POINTS)
* **Tipe Slide**: Side-by-Side Comparison (Kiri: Merah/Masalah, Kanan: Hijau/Solusi).
* **Judul Slide**: Mengapa Industri Membutuhkan Framework Tambahan?
* **Kolom Kiri (Kendala Flutter Standar)**:
  * ❌ **Rebuild Boros**: Memanggil `setState()` akan merender ulang seluruh widget pohon halaman (Scaffold), menurunkan performa FPS.
  * ❌ **Keterikatan BuildContext**: Pindah halaman, membuka dialog, atau menampilkan snackbar wajib membawa `BuildContext`.
  * ❌ **Boilerplate Berlebih**: Solusi lain seperti Bloc/Provider membutuhkan puluhan baris file terpisah hanya untuk 1 aksi sederhana.
  * ❌ **Memory Leak**: Controller manual sering lupa di-dispose saat halaman ditutup.
* **Kolom Kanan (Solusi Modern GetX)**:
  * ✅ **Reaktivitas Mikro**: Hanya widget spesifik di dalam `Obx` yang di-rebuild.
  * ✅ **Decoupled Architecture**: Navigasi dan state logic bebas dipanggil dari mana saja tanpa BuildContext.
  * ✅ **Sangat Ringkas**: Cukup tambahkan `.obs` di belakang variabel data.
  * ✅ **Auto-Dispose**: Memori dibersihkan otomatis oleh sistem Binding saat layar ditinggalkan.
* **Speaker Notes**:
  > "Banyak developer pemula bertanya, 'Kenapa tidak pakai setState() saja?'. Bayangkan kalian ingin mengecat ulang 1 pintu kamar mandi, tapi kalian merobohkan dan membangun ulang seluruh gedung rumah. Itulah yang dilakukan setState(). GetX hanya mengecat pintunya saja."

---

### SLIDE 4: THE BIG PICTURE — TIGA PILAR GETX
* **Tipe Slide**: 3 Pillar Architectural Diagram.
* **Judul Slide**: Fondasi GetX: Tiga Pilar yang Bekerja Harmonis
* **Subtitle**: GetX bukan hanya state management, melainkan ekosistem lengkap dengan 3 pilar utama:
* **Konten 3 Pilar**:
  1. **Pilar 1: State Management**
     * *Peran*: Mengelola perubahan data secara reaktif dan real-time.
     * *Sintaks Kunci*: `var count = 0.obs;` dan `Obx(() => Text(...))`
  2. **Pilar 2: Route Management**
     * *Peran*: Mengatur perpindahan antar halaman, animasi transisi, dan passing data tanpa `BuildContext`.
     * *Sintaks Kunci*: `Get.toNamed('/cart')`, `Get.back()`, `Get.offAllNamed('/login')`
  3. **Pilar 3: Dependency Management**
     * *Peran*: Menyediakan objek Controller ke widget yang membutuhkan secara efisien (Lazy Loading & Auto Dispose).
     * *Sintaks Kunci*: `Get.lazyPut(() => CartController())`, `Get.find<CartController>()`
* **Speaker Notes**:
  > "Ingat rumus ini: State mengurus DATA, Route mengurus NAVIGASI, dan Dependency mengurus MEMORI RAM. Ketiganya independen namun bersinergi."

---

### SLIDE 5: ANALOGI DUNIA NYATA — RESTORAN KICKSTORE
* **Tipe Slide**: 4-Step Flow Process Cards.
* **Judul Slide**: Memahami Arsitektur GetX Seperti Restoran Modern
* **Alur Analogi**:
  * **1. User (Pelanggan)**: Pembeli yang menekan tombol sepatu atau membuka keranjang di aplikasi.
  * **2. View (Buku Menu & Meja Makan)**: Antarmuka UI murni. Tugasnya HANYA menampilkan data visual dan menangkap interaksi klik.
  * **3. Controller (Koki di Dapur)**: Otak logika aplikasi. Menghitung kuantitas, kalkulasi total diskon, dan mengambil data produk dari server.
  * **4. Binding (Distributor / Supplier Logistik)**: Mengirimkan koki dan bahan ke dapur tepat saat pesanan tiba, dan membersihkan dapur saat restoran tutup.
* **Golden Rule**:
  > 💡 *Aturan Emas Industri*: View tidak boleh menghitung logika bisnis atau rumus matematika! Semua logika wajib berada di Controller.
* **Speaker Notes**:
  > "Pelanggan tidak pernah memasak sendiri di meja makan. Sama halnya di Flutter: View tidak boleh melakukan kalkulasi harga atau panggilan API secara langsung. View hanya memanggil Controller."

---

### SLIDE 6: PILAR 1 — STATE MANAGEMENT REAKTIF
* **Tipe Slide**: Side-by-Side Code Comparison.
* **Judul Slide**: Reaktivitas Presisi: setState() vs GetX Reactive
* **Kode Kiri (Flutter Standar - Tidak Efisien)**:
```dart
// ❌ Boros Rebuild
class _CounterState extends State<CounterView> {
  int counter = 0;
  void add() {
    setState(() {
      counter++; // ⚠️ Seluruh Scaffold di bawah ini dirender ulang!
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("$counter")),
      floatingActionButton: FloatingActionButton(onPressed: add),
    );
  }
}
```
* **Kode Kanan (GetX Pattern - Presisi Tinggi)**:
```dart
// ✅ Controller: Tempat data reaktif tinggal
class CartController extends GetxController {
  var counter = 0.obs; // .obs membuat variabel bisa didengar
  void add() => counter.value++;
}

// ✅ View: Hanya Text yang dibungkus Obx yang di-update
class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text("${controller.counter}")), // 🎯 Presisi!
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.add),
    );
  }
}
```
* **Speaker Notes**:
  > "Perhatikan perbedaannya: dengan Obx, hanya widget Text yang diperbarui nilainya. Tombol, AppBar, background layar tidak disentuh sama sekali. Aplikasi menjadi sangat ringan dan hemat baterai."

---

### SLIDE 7: PILAR 1 — TIPE DATA REAKTIF `.obs` PADA E-COMMERCE
* **Tipe Slide**: Structured Data Table + Warning Banner.
* **Judul Slide**: Tipe Data Reaktif yang Sering Digunakan di KicksStore
* **Tabel Tipe Data**:
  | Tipe Asli Dart | Tipe Reaktif GetX | Contoh Deklarasi | Kasus Penggunaan di KicksStore |
  |---|---|---|---|
  | `int` | `RxInt` | `var quantity = 1.obs;` | Jumlah kuantitas checkout sepatu |
  | `double` | `RxDouble` | `var totalPrice = 0.0.obs;` | Total tagihan belanja di keranjang |
  | `String` | `RxString` | `var selectedSize = '42'.obs;` | Ukuran sepatu yang dipilih pembeli |
  | `bool` | `RxBool` | `var isFavorite = false.obs;` | Status icon love / bookmark produk |
  | `List<T>` | `RxList<T>` | `var cartItems = <Item>[].obs;` | Daftar barang di dalam keranjang |
* **Warning Card**:
  > ⚠️ **Common Pitfall**: Jangan pernah membungkus widget dengan `Obx` jika di dalamnya tidak ada variabel bertipe `.obs`, karena Flutter akan memunculkan error *"Improper use of GetX / Obx"*.

---

### SLIDE 8: PILAR 2 — ROUTE MANAGEMENT (NAVIGASI BEBAS CONTEXT)
* **Tipe Slide**: 2-Column Split (Kiri: Perintah Navigasi, Kanan: Passing Arguments).
* **Judul Slide**: Navigasi Modern Tanpa Terikat BuildContext
* **Kolom Kiri (Daftar Perintah Routing Kunci)**:
  * `Get.toNamed('/detail');` : Pindah ke halaman detail (menumpuk di navigation stack).
  * `Get.back();` : Menutup halaman saat ini dan kembali ke sebelumnya (Pop).
  * `Get.offNamed('/home');` : Pindah halaman dan menutup halaman saat ini (berguna setelah login).
  * `Get.offAllNamed('/login');` : Menghapus seluruh history halaman (digunakan saat Logout).
* **Kolom Kanan (Mengirim dan Menangkap Data Antar Halaman)**:
```dart
// 1. Mengirim Data dari Katalog (HomeView)
Get.toNamed('/detail', arguments: {
  'id': 'shoe-01',
  'name': 'Nike Air Jordan 1',
  'price': 2499000,
});

// 2. Menerima Data di DetailController
class DetailController extends GetxController {
  late Map<String, dynamic> shoe;

  @override
  void onInit() {
    super.onInit();
    shoe = Get.arguments; // Langsung siap dipakai!
  }
}
```
* **Speaker Notes**:
  > "Tidak ada lagi kode panjang seperti Navigator.of(context).push(MaterialPageRoute(...)). Dengan Get.toNamed(), navigasi menjadi sangat mudah dibaca dan dapat dipanggil dari mana saja."

---

### SLIDE 9: PILAR 3 — DEPENDENCY MANAGEMENT & BINDING
* **Tipe Slide**: Concept Card + Code Box.
* **Judul Slide**: Efisiensi Memori: Menghubungkan Controller via Binding
* **Pertanyaan Inti**: Mengapa kita tidak membuat controller langsung di dalam widget View (`final c = CartController()`)?
* **Jawaban**: Karena setiap kali widget di-rebuild, objek baru akan tercipta di RAM, menyebabkan *memory bloat*.
* **Solusi: GetX Binding**:
```dart
// lib/app/modules/cart/bindings/cart_binding.dart
class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(), // Objek HANYA dibuat saat halaman keranjang dibuka
    );
  }
}
```
* **Siklus Hidup Memori Otomatis**:
  1. User klik ikon keranjang ➡️ `CartBinding` memuat `CartController` ke RAM.
  2. User menyelesaikan checkout / menekan Back ➡️ `CartController` **otomatis dihapus (auto-disposed)** dari RAM. Bebas kebocoran memori!

---

### SLIDE 10: STANDARISASI ARSITEKTUR DENGAN GETX CLI
* **Tipe Slide**: Feature Highlights (3 Cards) + Terminal Command Box.
* **Judul Slide**: GetX CLI: Alat Wajib Standarisasi Industri
* **Tiga Manfaat GetX CLI bagi Kelas SMK**:
  1. **Kecepatan Tinggi (Fast Scaffolding)**: Membuat 1 fitur lengkap (View, Controller, Binding, dan Route) hanya dalam 2 detik.
  2. **Bebas Kesalahan (Zero Typo)**: Mencegah siswa salah menamai rute navigasi atau lupa mendaftarkan binding.
  3. **Standarisasi Seragam**: Seluruh 30+ siswa di kelas memiliki pola folder yang 100% konsisten sehingga guru mudah memeriksa tugas.
* **Perintah Terminal Utama**:
```bash
# 1. Inisialisasi Proyek Baru
get create project:e_commerce

# 2. Membuat Modul Fitur Baru Secara Otomatis
get create page:home
get create page:detail
get create page:cart
get create page:checkout
```

---

### SLIDE 11: ANATOMI STRUKTUR FOLDER RESMI KICKSTORE
* **Tipe Slide**: Clean Tree Layout & Layer Explanation.
* **Judul Slide**: Anatomi Folder Standar Industri (`lib/app/`)
* **Struktur Pohon Folder**:
```
lib/
├── app/
│   ├── core/theme/         --> AppColors & AppTheme (Light & Dark Theme)
│   ├── data/               --> Models, Dio ApiService, Hive Storage
│   ├── modules/            --> Fitur-Fitur Modular Mandiri
│   │   ├── home/           --> bindings/, controllers/, views/ & components/
│   │   ├── detail/         --> Halaman Detail Produk & Size Selector
│   │   ├── cart/           --> Keranjang Belanja & Quantity Stepper
│   │   ├── wishlist/       --> Daftar Produk Favorit
│   │   ├── checkout/       --> Kurir, Alamat, & Metode Pembayaran
│   │   ├── login/          --> Autentikasi Pengguna Masuk
│   │   ├── register/       --> Formulir Pendaftaran Akun
│   │   └── orders/         --> Riwayat Pesanan & Status Pengiriman
│   └── routes/
│       ├── app_pages.dart  --> Registry Rute + Binding Resmi
│       └── app_routes.dart --> Konstanta Path String (/home, /cart, dll)
└── main.dart               --> Entrypoint GetMaterialApp
```

---

### SLIDE 12: ONBOARDING STARTER KIT KICKSSTORE
* **Tipe Slide**: Strategy Showcase (Kiri: Filosofi Belajar, Kanan: Roadmap Sesi 02–12).
* **Judul Slide**: Mengapa UI Disiapkan Penuh di Branch `starter-kit`?
* **Filosofi Belajar (Kenapa Full UI First?)**:
  * Menghilangkan frustrasi siswa menghabiskan waktu berjam-jam hanya untuk memperbaiki layout overflow.
  * Tampilan antarmuka sudah estetik, responsif, dan mendukung **Dark Mode** secara otomatis.
  * Siswa belajar mensimulasikan pekerjaan nyata: **"Menghubungkan logika bisnis dan API ke UI yang sudah jadi"**.
* **Roadmap Pembelajaran di Sesi-Sesi Berikutnya**:
  * **Sesi 02–03**: State Reaktif, Cart Counter, Badge Update, & Detail Navigation.
  * **Sesi 04**: Validasi Form Input & Regex.
  * **Sesi 05–06**: Networking Rest API via Dio & Shimmer Skeleton.
  * **Sesi 07–08**: Local Caching via SharedPreferences & NoSQL Hive CE.
  * **Sesi 09–10**: Firebase Auth & Cloud Firestore Realtime Orders.

---

### SLIDE 13: KUIS INTERAKTIF & CEK PEMAHAMAN
* **Tipe Slide**: 3 Interactive Quiz Cards.
* **Judul Slide**: Kuis Cek Pemahaman Konsep (Interactive Quiz)
* **Kuis 1**:
  * *Pertanyaan*: Apa yang terjadi saat nilai variabel bertipe `.obs` diubah?
  * *Pilihan*:
    * A. Seluruh layar Scaffold dirender ulang.
    * **B. Hanya widget spesifik di dalam Obx yang diperbarui nilainya. (Jawaban Benar)**
    * C. Aplikasi otomatis restart.
* **Kuis 2**:
  * *Pertanyaan*: Perintah apa yang digunakan untuk berpindah ke halaman keranjang belanja tanpa BuildContext?
  * *Pilihan*:
    * A. `Navigator.jump('/cart');`
    * **B. `Get.toNamed('/cart');` (Jawaban Benar)**
    * C. `Screen.open('/cart');`
* **Kuis 3**:
  * *Pertanyaan*: Apa peran utama dari file `Binding` pada GetX?
  * *Pilihan*:
    * A. Memberi warna pada tombol aplikasi.
    * **B. Menyuntikkan Controller ke memori via Dependency Injection. (Jawaban Benar)**
    * C. Menyimpan file database gambar.

---

### SLIDE 14: RANGKUMAN & PERSIAPAN SESI 02
* **Tipe Slide**: Summary & Action Checklist.
* **Judul Slide**: Rangkuman Sesi 01 & Checklist Persiapan Sesi 02
* **Pencapaian Sesi 01 Hari Ini**:
  * ✅ Menguasai pemahaman 3 Pilar GetX: State, Route, dan Dependency Management.
  * ✅ Mengetahui keunggulan reaktivitas `.obs`/`Obx` dibanding `setState()`.
  * ✅ Memahami struktur modular yang dihasilkan oleh GetX CLI.
* **Checklist Tugas Siswa Menjelang Sesi 02**:
  * 📋 Pastikan laptop telah terpasang Flutter SDK & Android Studio / VS Code.
  * 📋 Jalankan perintah Git:
    ```bash
    git clone https://github.com/rafiyandi/KicksStore-Starter-Kit.git
    git checkout starter-kit
    ```
  * 📋 Jalankan `flutter run` untuk memastikan 8 layar UI KicksStore berjalan sempurna di emulator.
* **Pesan Penutup**:
  > **"Sampai jumpa di Sesi 02! Kita akan mulai menyuntikkan reaktivitas state dan menggerakkan aplikasi KicksStore!"**

---

## 3. PROMPT SIAP COPY-PASTE UNTUK AI GENERATOR (CLAUDE / NOTEBOOK LM / GAMMA)

Jika Anda ingin langsung men-generate presentasi menggunakan AI, salin prompt di bawah ini:

```text
Buatkan presentasi profesional 14 slide berdasarkan dokumen brief di atas dengan spesifikasi teknis berikut:
1. Tema Desain: Clean Light Theme dengan latar belakang putih (#FFFFFF) dan kartu Slate lembut (#F8FAFC). Aksen utama Deep Indigo (#4F46E5) dan Coral Orange (#EA580C).
2. Rasio Slide: 16:9 Widescreen.
3. Tipografi: Modern sans-serif, bersih, dengan ukuran teks seimbang dan proporsional (judul 26-28pt, teks isi 14pt, kode 12pt). Hindari teks raksasa yang memenuhi layar.
4. Tata Letak: Gunakan visual card modern, 2-column comparison, grid layout, dan diagram alur yang rapi.
5. Format Konten: Ikuti secara presisi susunan Slide 1 hingga Slide 14 beserta kode dan speaker notes yang telah disediakan dalam dokumen ini.
```

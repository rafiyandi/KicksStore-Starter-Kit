# Silabus Final Terpadu & Panduan Eksekusi Master Project
## Flutter Mobile Development Bootcamp (12 Sesi)

* **Sasaran Program:** Siswa SMK (Jurusan Rekayasa Perangkat Lunak / PPLG / SIJA)
* **Pendekatan:** *Code-First Curriculum*, *Project-Based Learning (PBL)*, & *Incremental Continuous Capstone*
* **Tema Proyek:** **Mini E-Commerce Application** (*Master & Mirror Project*)
* **Dokumen Acuan Awal:** [Silabus_Flutter_12_Sesi (1).xlsx](file:///Users/rafiyandi/Downloads/sanbercode/SMK/docs/Silabus_Flutter_12_Sesi%20(1).xlsx)
* **Arsitektur Utama:** GetX Pattern (MVVM: Module, Binding, Controller, View, Route)

---

## 1. Eksekutif Ringkasan: Mengapa Silabus Direkonstruksi?

Silabus awal memiliki materi yang solid namun bersifat terfragmentasi (tiap sesi mengerjakan potongan kecil latihan terpisah, lalu di akhir tiba-tiba membuat *Weather App* yang tidak terhubung dengan sesi-sesi sebelumnya). 

Rekonstruksi ini menyatukan **100% materi silabus awal** ke dalam **1 Aplikasi Mini E-Commerce Utuh** yang dibangun secara bertahap dari Sesi 1 sampai Sesi 12.

### Matriks Komparasi Silabus Awal vs Silabus Final

| Sesi | Silabus Awal (Excel) | Silabus Final Terpadu (Mini E-Commerce) | Rasionalisasi & Peningkatan |
| :---: | :--- | :--- | :--- |
| **01** | OOP Dart, Async dasar, Flutter CLI, Widget Tree, Layouting | **Kickoff, Inisialisasi GetX CLI & Layouting Katalog Produk** | Proyek di-generate dengan struktur standar sejak menit pertama. Konsep *async* dipindah ke sesi API agar siswa tidak *cognitive overload*. |
| **02** | Fundamental State, Stateless vs Stateful, GetX Obs & Obx, Route | **Reaktivitas UI E-Commerce: Quantity Counter & Cart Badge** | Langsung diterapkan pada tombol (+/-) item belanja, badge keranjang reaktif, dan navigasi ke halaman Detail Produk. |
| **03** | GetxController, Lifecycle, Dependency Injection (Get.put/lazyPut) | **Arsitektur MVVM & Pemisahan Logika Bisnis Keranjang** | Memisahkan `ProductController` dan `CartController` dengan Binding dan DI yang bersih, mencegah *spaghetti code*. |
| **04** | REST API Fundamental, HTTP Methods, JSON, Setup Dio Client | **Integrasi REST API DummyJSON Produk via Dio Client** | Membaca data katalog produk nyata secara online dari endpoint resmi DummyJSON. Siswa memahami alur data dari internet. |
| **05** | JSON Serialization (fromJson), UI States (Loading, Empty, Error) | **Product Model Parsing & UI State Handling (Shimmer & Error)** | Mengonversi JSON ke objek `ProductModel`, menampilkan GridView asli, efek *loading shimmer*, dan penanganan jaringan putus. |
| **06** | Client Storage, SharedPreferences (Theme), Setup Hive CE | **SharedPreferences (Dark Mode & Onboarding) + Setup Hive CE** | Menyimpan preferensi tema gelap/terang dan flag pembuka aplikasi, serta mempersiapkan box database lokal Hive NoSQL. |
| **07** | CRUD Local Storage dengan Hive CE (Catatan/Todo) | **Fitur Wishlist / Favorit Offline dengan Hive CE TypeAdapter** | Bukan membuat aplikasi catatan terpisah, melainkan fitur Wishlist produk toko yang bisa diakses penuh saat *Airplane Mode*. |
| **08** | Flow Auth (Register, Login, Token Dio, Storage, Middleware) | **Logika Transaksi Keranjang, Validasi Checkout & Route Guard** | Menghitung subtotal/diskon/total secara reaktif, formulir pesanan, dan proteksi rute (`Middleware`) sebelum masuk proses pembayaran. |
| **09** | FlutterFire CLI, Firebase Core, Firebase Auth Email/Password | **Firebase Authentication: Register, Login & User Session Gate** | Menghilangkan redundansi login token palsu; langsung memakai autentikasi produksi Firebase Auth dengan listener status akun. |
| **10** | Cloud Firestore: Collections, Documents, CRUD, Stream | **Cloud Firestore: Real-time Order Placement & Riwayat Transaksi** | Transaksi checkout tersimpan ke cloud dan otomatis muncul secara *real-time* di tab "Riwayat Pesanan" pembeli. |
| **11** | Arsitektur MVVM & GetX CLI (Refactoring) | **Fitur Pencarian, Filter Kategori, Dialog & Visual Polish** | Karena GetX CLI sudah dipakai sejak Sesi 1, sesi ini dimanfaatkan untuk fitur penunjang (Search Bar, Chip Filter, Snackbar, BottomSheet). |
| **12** | Final Project Weather App & Overview Play Store | **Packaging, Custom App Icon, Build APK Rilis & Demo Showcase** | Siswa mengganti ikon & nama toko, mengompilasi APK rilis mandiri (`--split-per-abi`), dan memamerkan aplikasi tokonya masing-masing. |

---

## 2. Strategi Eksekusi: Master Project vs Mirror Project

Untuk menjamin kelancaran kelas SMK, diterapkan metodologi pedagogis **"I Do, We Do, You Do"**:

```
┌────────────────────────────────────────────────────────────────────────┐
│                   ALUR PEMBELAJARAN PER SESI                           │
├────────────────────┬────────────────────┬──────────────────────────────┤
│ 1. I DO (20%)      │ 2. WE DO (40%)     │ 3. YOU DO (40%)              │
│ Instruktur         │ Instruktur & Siswa │ Siswa Mandiri                │
│ Mendemonstrasikan  │ Melakukan live     │ Mengimplementasikan pada     │
│ konsep & arsitektur│ coding bersama     │ Mirror Project masing-masing │
│ pada Master Project│ fitur demi fitur   │ dengan tema toko pilihan     │
└────────────────────┴────────────────────┴──────────────────────────────┘
```

### 1. Master Project (Pegangan Instruktur)
* Instruktur menyelesaikan **100% kode aplikasi** sebelum pelatihan dimulai.
* Disimpan dalam repositori Git dengan penandaan **Git Tag** per sesi (`sesi-01`, `sesi-02`, dst.).
* Berfungsi sebagai standar acuan (*single source of truth*), sumber tangkapan layar slide, dan jaring pengaman jika siswa tertinggal.
* **Domain Rekomendasi:** *KicksStore* (Toko Sneakers & Sepatu).

### 2. Mirror Project (Karya Mandiri Siswa)
* Struktur modul, logika bisnis, dan model data **100% identik** dengan Master Project (memiliki `id`, `title`, `price`, `thumbnail`, `category`, `description`).
* Siswa bebas memilih domain toko sesuai minat mereka dengan memanfaatkan kategori pada DummyJSON:
  * Opsi A: *Foodies* (Kategori: `groceries`)
  * Opsi B: *TechMart* (Kategori: `smartphones`, `laptops`)
  * Opsi C: *GlowBeauty* (Kategori: `beauty`, `fragrances`)
  * Opsi D: *UrbanStyle* (Kategori: `mens-shirts`, `womens-dresses`)

### 3. Strategi Starter UI & Scaffolded Learning Workflow

Untuk memaksimalkan alokasi waktu 180 menit per sesi dan mencegah siswa kelelahan akibat salah ketik tanda kurung (*bracket hell*) pada layout Flutter:

* **Sesi 01 (Satu-satunya Penulisan UI Murni):** Siswa diajak mengetik widget dasar (`Row`, `Column`, `Container`, `Card`) agar memahami cara kerja *Widget Tree*.
* **Sesi 02 s.d. 11 (Fokus Logika Bisnis & Data):** Tampilan antarmuka (*Starter UI*) sudah disediakan dalam kondisi estetik dan rapi. Siswa menyalin template UI tersebut ke dalam `_view.dart`, lalu fokus 100% pada penulisan logika di `_controller.dart`, menghubungkan variabel `.obs` dengan widget `Obx`, serta mengintegrasikan API/Database.

```
┌────────────────────────────────────────────────────────────────────────┐
│               SOP 3 LANGKAH PENGEMBANGAN MODUL DI KELAS                │
├────────────────────┬────────────────────┬──────────────────────────────┤
│ 1. GENERATE CLI    │ 2. PASANG UI       │ 3. SUNTIK LOGIKA (LIVE CODE) │
│ Ketik perintah Get │ Siswa menyalin     │ Instruktur memimpin live     │
│ CLI di terminal    │ template Starter   │ coding controller, binding   │
│ untuk membuat modul│ UI ke dalam View   │ data reaktif Obx, & API      │
└────────────────────┴────────────────────┴──────────────────────────────┘
```

#### Pemetaan 7 Modul Inti Menggunakan GetX CLI:

| No | Modul | Perintah GetX CLI | Tanggung Jawab Utama | Sesi |
| :---: | :--- | :--- | :--- | :---: |
| 1 | **`home`** | *(Otomatis saat `get create project`)* | Katalog produk, search bar, filter kategori, saklar Dark Mode. | **01** |
| 2 | **`detail`** | `get create page:detail` | Detail produk, counter kuantitas (+/-), tombol keranjang & wishlist. | **02** |
| 3 | **`cart`** | `get create page:cart` | Keranjang belanja, manajemen item, kalkulasi subtotal/total. | **03** |
| 4 | **`wishlist`** | `get create page:wishlist` | Daftar barang favorit offline tersimpan di database lokal Hive CE. | **07** |
| 5 | **`checkout`** | `get create page:checkout` | Formulir pengiriman pesanan, proteksi rute (*Route Guard Middleware*). | **08** |
| 6 | **`login` & `register`** | `get create page:login`<br>`get create page:register` | Form autentikasi email & password terintegrasi Firebase Auth. | **09** |
| 7 | **`orders`** | `get create page:orders` | Riwayat transaksi pesanan belanja real-time dari Cloud Firestore. | **10** |

---

## 3. Peta Arsitektur Teknologi & Library Terpilih

```
┌───────────────────────────────────────────────────────────────────────────┐
│                       ARSITEKTUR MINI E-COMMERCE                          │
├─────────────────────────┬─────────────────────────────────────────────────┤
│ Layer / Kebutuhan       │ Pilihan Teknologi & Paket                       │
├─────────────────────────┼─────────────────────────────────────────────────┤
│ Pattern & Routing       │ GetX CLI (`get_cli`), GetX Pattern (MVVM)       │
│ State Management & DI   │ `get: ^4.6.6` (Reactive State: `.obs`, `Obx`)   │
│ HTTP Client & Jaringan  │ `dio: ^5.7.0` (Client-Server, Interceptors)     │
│ Data Source Publik      │ DummyJSON Products API (Gratis, Cepat, Tanpa Key)│
│ Preferensi Lokal        │ `shared_preferences: ^2.3.3` (Theme & Flag)     │
│ Database NoSQL Lokal    │ `hive_ce: ^2.8.2`, `hive_ce_flutter: ^2.1.2`   │
│ Generator Model/Hive    │ `build_runner`, `hive_ce_generator`             │
│ Cloud Authentication    │ `firebase_core: ^3.6.0`, `firebase_auth: ^5.3.1`│
│ Cloud Realtime Database │ `cloud_firestore: ^5.4.4`                       │
│ Packaging & Release     │ `flutter_launcher_icons`, Split-per-ABI APK     │
└─────────────────────────┴─────────────────────────────────────────────────┘
```

---

## 4. Rincian Silabus 12 Sesi Pembelajaran

Setiap sesi dirancang dengan standar durasi rata-rata **180 menit** (3 jam pelajaran).

---

### Sesi 01: Inisialisasi Proyek, GetX CLI & Layouting Katalog
* **Git Checkpoint:** `git tag -a sesi-01 -m "Sesi 01: Project init and static catalog layout"`
* **Tujuan Pembelajaran:** Siswa memahami struktur proyek Flutter standar industri, arsitektur GetX Pattern, dan mampu menyusun tata letak (*layout*) kartu produk e-commerce.
* **Alokasi Waktu:**
  * 30 Menit: Pengenalan Flutter, widget tree, dan arsitektur GetX Pattern.
  * 60 Menit: Inisialisasi proyek via GetX CLI (`get create project e_commerce`), review folder `lib/app/`.
  * 75 Menit: Praktik layouting: `Scaffold`, `AppBar`, `Container`, `Row`, `Column`, `ListView`, dan `GridView`.
  * 15 Menit: Troubleshooting & review hasil layout.
* **Materi Teori:**
  * Anatomi widget tree dan perbedaan `StatelessWidget` vs `StatefulWidget`.
  * Anatomi GetX Pattern: modul `home` (`views/`, `controllers/`, `bindings/`).
  * Layout responsive dengan `AspectRatio`, `Card`, dan `ClipRRect`.
* **Praktik Master Project:**
  * Membangun `ProductCard` statis: gambar produk (placeholder), judul barang, kategori badge, harga produk berformat Rupiah, dan tombol keranjang.
  * Menampilkan 6 kartu produk statis dalam `GridView.builder`.
* **Titik Kritis Siswa (Common Pitfalls):**
  * *RenderFlex overflowed*: Ingatkan penggunaan `Expanded`, `SingleChildScrollView`, atau batasi dimensi dengan `SizedBox`.
  * Salah letak file: Tekankan aturan meletakkan widget di folder modular `modules/home/views/components/`.

---

### Sesi 02: Reaktivitas State & Navigasi GetX
* **Git Checkpoint:** `git tag -a sesi-02 -m "Sesi 02: Reactive counter, cart badge, and navigation"`
* **Tujuan Pembelajaran:** Siswa memahami konsep reaktivitas (*state management*) tanpa `setState`, mengontrol pembaruan antarmuka menggunakan `.obs` dan `Obx`, serta menguasai navigasi modern tanpa `BuildContext`.
* **Alokasi Waktu:**
  * 30 Menit: Teori state reaktif, kelemahan `setState()` pada performa widget rebuild.
  * 60 Menit: Live coding implementasi `.obs`, `Obx`, dan rute navigasi `Get.toNamed()`.
  * 75 Menit: Praktik pembuatan halaman Detail Produk dan interaksi penambahan item.
  * 15 Menit: Evaluasi pemahaman reaktivitas.
* **Materi Teori:**
  * Tipe data reaktif: `RxInt`, `RxString`, `RxBool`, dan ekstensi `.obs`.
  * Widget `Obx(() => ...)` sebagai pendengar perubahan state secara presisi.
  * Navigasi GetX: `Get.to()`, `Get.toNamed()`, `Get.back()`, dan passing argument via `Get.arguments`.
* **Praktik Master Project:**
  * Membuat variabel kuantitas produk reaktif (`var quantity = 1.obs`).
  * Tombol counter increment/decrement (`+` dan `-`) dengan validasi minimal 1.
  * Badge keranjang belanja di `AppBar` yang otomatis terupdate saat tombol "Tambah ke Keranjang" ditekan.
  * Navigasi klik item kartu produk menuju `ProductDetailView` dengan mengirimkan data produk.
* **Titik Kritis Siswa (Common Pitfalls):**
  * Error *"Improper use of GetX / Obx"*: Siswa membungkus widget dengan `Obx` tetapi tidak ada variabel `.obs` di dalamnya.

---

### Sesi 03: Arsitektur MVVM & Dependency Injection
* **Git Checkpoint:** `git tag -a sesi-03 -m "Sesi 03: Clean MVVM architecture and controller bindings"`
* **Tujuan Pembelajaran:** Siswa mampu memisahkan antarmuka (View) dari logika bisnis (Controller) serta mengelola instansiasi controller menggunakan `Binding` dan `Dependency Injection`.
* **Alokasi Waktu:**
  * 30 Menit: Konsep MVVM (*Model-View-ViewModel*) dan daur hidup `GetxController`.
  * 60 Menit: Pembuatan `CartController`, setup `Binding`, registrasi dependensi `Get.lazyPut()`.
  * 75 Menit: Pemindahan seluruh kalkulasi belanja dari UI ke dalam controller.
  * 15 Menit: Code review arsitektur modular siswa.
* **Materi Teori:**
  * Siklus hidup `GetxController`: `onInit()`, `onReady()`, `onClose()`.
  * Metode Dependency Injection: `Get.put()` (instan) vs `Get.lazyPut()` (efisien memori).
  * Penggunaan `Bindings` pada konfigurasi routing `GetPage(binding: ...)`.
  * Pemanggilan instance di View menggunakan `Get.find<Controller>()`.
* **Praktik Master Project:**
  * Men-generate modul baru via CLI: `get make page:cart`.
  * Membuat `CartController` untuk menyimpan daftar belanjaan global.
  * Memastikan `CartBinding` memuat `CartController` secara otomatis saat rute keranjang diakses.
* **Titik Kritis Siswa (Common Pitfalls):**
  * Error *"CartController not found"*: Lupa mendaftarkan binding pada `AppPages` atau memanggil controller sebelum terinisialisasi.

---

### Sesi 04: Asynchronous Dart & REST API dengan Dio
* **Git Checkpoint:** `git tag -a sesi-04 -m "Sesi 04: Dio HTTP setup and DummyJSON integration"`
* **Tujuan Pembelajaran:** Siswa memahami konsep komunikasi client-server, protokol HTTP, asynchronous Dart (`Future`, `async/await`), serta mampu melakukan request data menggunakan library Dio.
* **Alokasi Waktu:**
  * 30 Menit: Konsep Client-Server, HTTP Methods (GET, POST), Status Code (200, 404, 500), struktur JSON.
  * 60 Menit: Instalasi package `dio`, inisialisasi `BaseOptions`, dan request data katalog.
  * 75 Menit: Praktik melakukan fetch data ke endpoint `https://dummyjson.com/products`.
  * 15 Menit: Inspeksi response body di debug console.
* **Materi Teori:**
  * Asynchronous programming pada Dart: `Future`, `async`, `await`, dan `try-catch`.
  * Mengapa memilih `dio` dibanding paket bawaan `http` (otomatis JSON parsing, base URL, timeout, interceptor).
  * Pembuatan data provider/service: `ProductProvider` / `ApiService`.
* **Praktik Master Project:**
  * Menambahkan dependensi `dio: ^5.7.0` pada `pubspec.yaml`.
  * Membuat kelas `ApiService` dengan base URL `https://dummyjson.com/`.
  * Menguji request `GET /products` dan menampilkan daftar data mentah (raw JSON) di terminal.
* **Titik Kritis Siswa (Common Pitfalls):**
  * Siswa lupa kata kunci `await`, sehingga variabel menampung objek `Instance of Future` bukan data respons.
  * Masalah izin akses internet di Android Manifest (jika running di platform native tertentu).

---

### Sesi 05: JSON Model Parsing & Penanganan UI State
* **Git Checkpoint:** `git tag -a sesi-05 -m "Sesi 05: ProductModel serialization and UI states"`
* **Tujuan Pembelajaran:** Siswa mampu mengonversi data mentah JSON menjadi objek model Dart yang *type-safe*, serta menyajikan antarmuka dengan 3 kondisi status (*Loading*, *Success*, *Error*).
* **Alokasi Waktu:**
  * 30 Menit: Konsep serialisasi/deserialisasi JSON (`fromJson` & `toJson`), bahaya tipe data dinamis.
  * 60 Menit: Pembuatan `ProductModel`, integrasi ke `ProductController`.
  * 75 Menit: Membangun UI reaktif dengan Shimmer (*Loading*), GridView (*Success*), dan Tombol Coba Lagi (*Error*).
  * 15 Menit: Simulasi skenario offline untuk menguji tampilan error.
* **Materi Teori:**
  * Membuat model Dart: Pemetaan properti `id`, `title`, `price`, `thumbnail`, `category`, `stock`.
  * State flag di controller: `isLoading = true.obs`, `errorMessage = ''.obs`, `productList = <ProductModel>[].obs`.
  * Penanganan kondisi: Menggunakan `shimmer` atau skeleton loading saat proses fetch berlangsung.
* **Praktik Master Project:**
  * Membuat file `app/data/models/product_model.dart`.
  * Mengganti kartu produk statis di halaman katalog dengan data asli dari DummyJSON.
  * Menambahkan visual state: jika internet mati, muncul ilustrasi koneksi terputus dan tombol "Coba Lagi".
* **Titik Kritis Siswa (Common Pitfalls):**
  * `TypeError: type 'Null' is not a subtype of type 'String'` akibat data JSON dari server bernilai null atau bertipe beda (misal harga int vs double). Solusi: gunakan parsing defensif `(json['price'] as num?)?.toDouble() ?? 0.0`.

---

### Sesi 06: Local Storage I (SharedPreferences & Inisialisasi Hive CE)
* **Git Checkpoint:** `git tag -a sesi-06 -m "Sesi 06: SharedPreferences theme toggle and Hive CE init"`
* **Tujuan Pembelajaran:** Siswa memahami perbedaan penyimpanan data primitif (*Key-Value*) vs database objek lokal, menguasai implementasi SharedPreferences untuk pengaturan tema, serta inisialisasi Hive CE.
* **Alokasi Waktu:**
  * 30 Menit: Konsep penyimpanan data lokal di perangkat mobile: kapan memakai SharedPreferences vs NoSQL DB.
  * 60 Menit: Praktik SharedPreferences untuk fitur Saklar Dark/Light Mode dan Flag Onboarding.
  * 75 Menit: Instalasi package `hive_ce`, `hive_ce_flutter`, inisialisasi box di `main.dart`.
  * 15 Menit: Pengujian persistensi data (tutup aplikasi dan buka kembali).
* **Materi Teori:**
  * `SharedPreferences`: method `getBool()`, `setBool()`, `getString()`, `setString()`.
  * Dinamika tema aplikasi via GetX: `Get.changeTheme(ThemeData.dark())`.
  * Pengenalan Hive CE (Community Edition): arsitektur penyimpanan NoSQL berbasis Box yang cepat dan ringan.
* **Praktik Master Project:**
  * Menambahkan saklar *Dark Mode* pada menu pengaturan/header.
  * Saat tema diubah, preferensi disimpan ke SharedPreferences sehingga tema tidak kembali ke awal saat aplikasi di-*restart*.
  * Menginisialisasi Hive CE di `main()` sebelum `runApp()` dijalankan.
* **Titik Kritis Siswa (Common Pitfalls):**
  * Lupa menambahkan `WidgetsFlutterBinding.ensureInitialized()` sebelum memanggil SharedPreferences atau Hive di fungsi `main()`.

---

### Sesi 07: Local Storage II (CRUD Wishlist Offline dengan Hive CE)
* **Git Checkpoint:** `git tag -a sesi-07 -m "Sesi 07: Full offline Wishlist CRUD using Hive CE"`
* **Tujuan Pembelajaran:** Siswa mampu menyusun model objek kustom dengan `TypeAdapter` pada Hive CE dan membangun fitur Wishlist / Favorit offline dengan operasi CRUD penuh.
* **Alokasi Waktu:**
  * 30 Menit: Konsep `TypeAdapter`, `TypeId`, dan peran code generator (`build_runner`).
  * 60 Menit: Live coding pembuatan `WishlistModel`, registrasi adapter, dan operasi box.
  * 75 Menit: Membangun tab antarmuka "Favorit / Wishlist" dengan integrasi GetX.
  * 15 Menit: Pengujian fitur dalam mode pesawat (*Airplane Mode*).
* **Materi Teori:**
  * Anotasi `@HiveType(typeId: 0)` dan `@HiveField(0)`.
  * Menjalankan build runner: `dart run build_runner build --delete-conflicting-outputs`.
  * Operasi CRUD pada Box Hive: `box.put()`, `box.get()`, `box.delete()`, dan `box.values`.
* **Praktik Master Project:**
  * Tombol ikon hati (*Love*) pada kartu produk: jika diklik, item disimpan ke Hive Box wishlist.
  * Tab khusus Wishlist: menampilkan semua barang favorit secara instan tanpa perlu koneksi internet.
  * Menghapus item dari wishlist dan UI langsung terbarui secara reaktif.
* **Titik Kritis Siswa (Common Pitfalls):**
  * `HiveError: Cannot read, unknown typeId`: Lupa memanggil `Hive.registerAdapter(WishlistModelAdapter())` sebelum membuka box.

---

### Sesi 08: Logika Bisnis Keranjang, Validasi Checkout & Route Guard
* **Git Checkpoint:** `git tag -a sesi-08 -m "Sesi 08: Cart calculations, checkout form, and route middleware"`
* **Tujuan Pembelajaran:** Siswa mampu menyusun kalkulasi alur transaksi keranjang belanja, memvalidasi formulir pengiriman pesanan, dan mengamankan rute halaman dengan GetX Middleware.
* **Alokasi Waktu:**
  * 30 Menit: Logika bisnis keranjang: akumulasi item duplikat, kalkulasi subtotal, diskon, dan grand total.
  * 60 Menit: Pembuatan halaman Checkout dan formulir pengiriman (nama, alamat, metode bayar).
  * 75 Menit: Implementasi `GetMiddleware` untuk mencegat akses ke halaman checkout jika user belum login.
  * 15 Menit: Simulasi skenario redirect halaman.
* **Materi Teori:**
  * Pengelolaan *Cart Item*: struktur data model keranjang (`productId`, `quantity`, `subtotal`).
  * Perhitungan kalkulasi otomatis melalui *getter* controller: `double get totalPrice => ...`.
  * Form validation: `TextFormField` dengan validator `validator: (value) => ...`.
  * Proteksi halaman dengan GetX Middleware (`redirect(String? route)`).
* **Praktik Master Project:**
  * Halaman Keranjang Belanja lengkap dengan ringkasan rincian total belanja.
  * Saat tombol "Lanjut ke Pembayaran" ditekan: jika pengguna belum login, diarahkan otomatis ke halaman Login (*Route Guard*).
* **Titik Kritis Siswa (Common Pitfalls):**
  * Infinite redirect loop pada middleware: Pastikan halaman tujuan redirect (misal `/login`) tidak dipasangi middleware yang sama.

---

### Sesi 09: Autentikasi Cloud dengan Firebase Auth
* **Git Checkpoint:** `git tag -a sesi-09 -m "Sesi 09: Firebase Auth registration, login, and auth state gate"`
* **Tujuan Pembelajaran:** Siswa mampu menghubungkan proyek Flutter dengan Google Firebase Console, mengonfigurasi Firebase CLI, serta mengimplementasikan pendaftaran dan login menggunakan Firebase Authentication.
* **Alokasi Waktu:**
  * 30 Menit: Pengenalan Google Firebase, konsep BaaS (*Backend as a Service*), dan persiapan akun.
  * 60 Menit: Eksekusi `flutterfire configure`, inisialisasi `Firebase.initializeApp()`.
  * 75 Menit: Membuat modul pendaftaran & login akun pembeli dengan email dan kata sandi.
  * 15 Menit: Pengujian pembuatan user di Firebase Console Authentication tab.
* **Materi Teori:**
  * Mengapa Firebase Auth: keamanan standar industri, enkripsi password otomatis, manajemen token otomatis.
  * Metode `createUserWithEmailAndPassword()` dan `signInWithEmailAndPassword()`.
  * Mendengarkan status sesi pengguna: Stream `FirebaseAuth.instance.authStateChanges()`.
  * `AuthController` terpusat untuk menyimpan info pengguna aktif (`user.value?.email`).
* **Praktik Master Project:**
  * Registrasi proyek di Firebase Console dan mengunduh konfigurasi via FlutterFire CLI.
  * Halaman Login dan Register yang ramah pengguna.
  * Begitu login berhasil, pengguna langsung diarahkan kembali ke proses Checkout yang sempat tertunda.
* **Titik Kritis Siswa (Common Pitfalls):**
  * `FirebaseAuthException: [auth/network-request-failed]` atau `[auth/invalid-email]`. Bimbing siswa menangani error code dengan pesan Snackbar yang informatif bagi orang awam.

---

### Sesi 10: Cloud Firestore (Riwayat Pesanan Real-time)
* **Git Checkpoint:** `git tag -a sesi-10 -m "Sesi 10: Realtime order placement and Firestore stream"`
* **Tujuan Pembelajaran:** Siswa memahami konsep database dokumen NoSQL di cloud, mampu menyimpan transaksi checkout ke Firestore, dan menampilkannya secara *real-time* di tab riwayat pesanan.
* **Alokasi Waktu:**
  * 30 Menit: Konsep Cloud Firestore: Collections, Documents, Fields, dan tipe data JSON-like.
  * 60 Menit: Menulis data transaksi pesanan (`orders.add({...})`) saat checkout selesai.
  * 75 Menit: Mengonsumsi data realtime menggunakan Firestore `Stream` / snapshot di controller.
  * 15 Menit: Uji coba pembaruan data pesanan langsung dari Firebase Console.
* **Materi Teori:**
  * Firestore CRUD: `collection('orders').add()`, `collection('orders').snapshots()`.
  * Binding Stream Firestore ke variabel reaktif GetX: `orderList.bindStream(...)`.
  * Struktur dokumen pesanan: `userId`, `items`, `totalAmount`, `status`, `timestamp`.
* **Praktik Master Project:**
  * Tombol "Bayar Sekarang / Buat Pesanan": mengosongkan keranjang belanja dan mengirimkan dokumen pesanan ke koleksi `orders` di Firestore.
  * Halaman "Riwayat Pesanan": menampilkan daftar transaksi lengkap dengan status pesanan (misal: "Diproses", "Dikirim", "Selesai").
* **Titik Kritis Siswa (Common Pitfalls):**
  * Firestore Security Rules memblokir akses (`permission-denied`). Solusi: atur mode uji coba (*test mode*) pada tahap pembelajaran atau batasi dengan `request.auth != null`.

---

### Sesi 11: Integrasi Lengkap, Fitur Pencarian & Polish UX
* **Git Checkpoint:** `git tag -a sesi-11 -m "Sesi 11: Search filter, category tabs, and UI polish"`
* **Tujuan Pembelajaran:** Siswa mampu menyatukan seluruh komponen sistem menjadi satu aplikasi yang kohesif, mengimplementasikan pencarian data, serta mempercantik visual antarmuka (*micro-interactions*).
* **Alokasi Waktu:**
  * 30 Menit: Alur integrasi end-to-end: Katalog $\rightarrow$ Detail $\rightarrow$ Wishlist $\rightarrow$ Keranjang $\rightarrow$ Auth $\rightarrow$ Checkout $\rightarrow$ Riwayat.
  * 60 Menit: Menambahkan kolom pencarian produk (*Search Bar*) dan filter kategori dinamis.
  * 75 Menit: Memperhalus UI: Dialog konfirmasi hapus, BottomSheet varian produk, dan Snackbar notifikasi.
  * 15 Menit: Audit kelengkapan fitur aplikasi oleh instruktur.
* **Materi Teori:**
  * Reaktif filter data lokal: `productList.where((item) => item.title.contains(query))`.
  * Parameter query API Dio: `dio.get('/products/search', queryParameters: {'q': query})`.
  * Notifikasi visual GetX: `Get.snackbar()`, `Get.defaultDialog()`, `Get.bottomSheet()`.
* **Praktik Master Project:**
  * Pengguna dapat mencari barang berdasarkan nama sepatu/produk.
  * Tab filter kategori (Sneakers, Formal, Sandal) yang langsung menyaring GridView.
  * Dialog konfirmasi saat pengguna ingin mengeluarkan akun (*Logout*).
* **Titik Kritis Siswa (Common Pitfalls):**
  * Fitur pencarian memicu lag karena memanggil API pada setiap ketikan karakter. Kenalkan teknik debounce sederhana pada GetX: `debounce(searchTerm, (_) => search(), time: Duration(milliseconds: 500))`.

---

### Sesi 12: Packaging, Build APK Rilis & Demo Showcase
* **Git Checkpoint:** `git tag -a sesi-12 -m "Sesi 12: Release APK build and project showcase"`
* **Tujuan Pembelajaran:** Siswa memahami alur distribusi aplikasi mobile Android, mampu mengganti identitas aplikasi, men-generate file APK rilis mandiri, dan mempresentasikan karya aplikasinya.
* **Alokasi Waktu:**
  * 30 Menit: Anatomi rilis aplikasi Android: App Icon, Package Name / Application ID, Signing Keystore, overview kebijakan Google Play Console (Closed Testing 14 hari).
  * 60 Menit: Konfigurasi ikon aplikasi via package `flutter_launcher_icons`, mengganti nama aplikasi di `AndroidManifest.xml`.
  * 45 Menit: Menjalankan build rilis: `flutter build apk --split-per-abi`. Memindahkan file APK ke smartphone fisik siswa.
  * 45 Menit: **Demo Showcase:** Setiap siswa mempresentasikan toko mereka di depan kelas.
* **Materi Teori:**
  * Mengapa `--split-per-abi`: menghasilkan ukuran APK yang ramping (15-20 MB) dibanding APK fat universal (50+ MB).
  * Alur sertifikat digital (Keystore SHA-256) untuk verifikasi rilis resmi.
  * Regulasi Google Play Store: syarat akun developer personal wajib closed testing minimal 20 orang selama 14 hari.
* **Praktik Master Project:**
  * Aplikasi memiliki logo toko kustom dan nama toko yang profesional di home screen smartphone.
  * File APK `app-arm64-v8a-release.apk` berhasil di-install dan berjalan mulus di HP masing-masing siswa.
* **Titik Kritis Siswa (Common Pitfalls):**
  * Build rilis gagal karena error shrinker / proguard atau kesalahan nama package. Solusi: pastikan `minSdkVersion` minimal 21 dan konfigurasi Gradle bersih.

---

## 5. Panduan Praktis Instruktur: Manajemen Checkpoint Git

Sebelum kelas dimulai, instruktur menyelesaikan pembuatan Master Project dan membuat penandaan commit (*Git Tags*) berikut:

```bash
# Sesi 01: Setup Proyek & Layout Katalog Statis
git commit -m "feat(catalog): static product card and grid view"
git tag -a sesi-01 -m "Checkpoint Sesi 01"

# Sesi 02: Reaktivitas State & Detail Page
git commit -m "feat(state): reactive quantity counter and cart badge"
git tag -a sesi-02 -m "Checkpoint Sesi 02"

# Sesi 03: Arsitektur MVVM & Bindings
git commit -m "refactor(arch): extract cart logic into CartController"
git tag -a sesi-03 -m "Checkpoint Sesi 03"

# Sesi 04: Integrasi REST API Dio
git commit -m "feat(api): setup dio client and fetch dummyjson products"
git tag -a sesi-04 -m "Checkpoint Sesi 04"

# Sesi 05: Model Parsing & UI States
git commit -m "feat(model): product model parsing with shimmer and error state"
git tag -a sesi-05 -m "Checkpoint Sesi 05"

# Sesi 06: SharedPreferences & Hive Init
git commit -m "feat(storage): shared preferences dark mode and hive init"
git tag -a sesi-06 -m "Checkpoint Sesi 06"

# Sesi 07: Hive CRUD Wishlist Offline
git commit -m "feat(wishlist): offline wishlist crud with hive type adapter"
git tag -a sesi-07 -m "Checkpoint Sesi 07"

# Sesi 08: Cart Logic & Route Guard Middleware
git commit -m "feat(cart): subtotal calculation and checkout route guard"
git tag -a sesi-08 -m "Checkpoint Sesi 08"

# Sesi 09: Firebase Auth Login/Register
git commit -m "feat(auth): firebase authentication with email and password"
git tag -a sesi-09 -m "Checkpoint Sesi 09"

# Sesi 10: Cloud Firestore Riwayat Transaksi
git commit -m "feat(firestore): realtime order placement and history stream"
git tag -a sesi-10 -m "Checkpoint Sesi 10"

# Sesi 11: Search, Filter Kategori & Polish
git commit -m "feat(polish): search filter, category chips, and dialogs"
git tag -a sesi-11 -m "Checkpoint Sesi 11"

# Sesi 12: Custom Icon & Build APK Rilis
git commit -m "chore(release): launcher icon and production apk build"
git tag -a sesi-12 -m "Checkpoint Sesi 12"
```

> **Prosedur Penyelamatan Siswa:**  
> Jika seorang siswa tertinggal parah atau komputernya mengalami *unresolved bug* di Sesi 05, instruktur cukup mengarahkan siswa untuk menyinkronkan repositori ke checkpoint yang relevan:  
> `git checkout -f tags/sesi-05`  
> Langkah ini memastikan seluruh siswa dapat mengikuti sesi berikutnya tanpa keputusasaan.

---

## 6. Rubrik Evaluasi & Standar Kelulusan Siswa SMK

| Komponen Penilaian | Bobot | Kriteria Capaian Maksimal |
| :--- | :---: | :--- |
| **Arsitektur & Kerapian Kode** | 25% | Mengikuti pola GetX Pattern MVVM secara konsisten. Controller bebas dari elemen UI, dan View tidak mengandung logika bisnis perhitungan. |
| **Integrasi Jaringan & State UI** | 25% | Fetch data REST API berhasil, data diparsing menggunakan Model, serta menampilkan 3 status UI (*Loading*, *Success*, *Error*) secara mulus. |
| **Penyimpanan Lokal & Cloud** | 25% | Fitur Wishlist berfungsi offline dengan Hive CE, status tema tersimpan via SharedPreferences, dan transaksi pesanan tercatat di Firebase. |
| **Penyelesaian Produk & Demo** | 25% | Aplikasi memiliki ikon dan nama kustom, berhasil di-*build* menjadi file APK rilis, dan siswa mampu mempraktikkan alur belanja dari katalog hingga riwayat pesanan. |
| **Total** | **100%** | **Ambang Batas Kelulusan (Passing Grade): 75%** |

---

## 7. Roadmap Pengerjaan Master Project Saat Ini (*Immediate Execution*)

Berikut tahapan konkret pengerjaan Master Project di dalam folder [e_commerce/](file:///Users/rafiyandi/Downloads/sanbercode/SMK/e_commerce/) sebelum kelas dimulai:

```
┌────────────────────────────────────────────────────────────────────────┐
│               ROADMAP PENYELESAIAN MASTER PROJECT (4 TAHAP)            │
├────────────────────┬────────────────────┬──────────────────────────────┤
│ TAHAP 1            │ TAHAP 2            │ TAHAP 3 & 4                  │
│ Fondasi & Locking  │ Eksekusi 7 Modul   │ Testing End-to-End,          │
│ Dependencies       │ Get CLI & Logika   │ Git Tagging Checkpoints, &   │
│ `pubspec.yaml`     │ Sesi 01 s.d. 12    │ Pembuatan Branch Starter UI  │
└────────────────────┴────────────────────┴──────────────────────────────┘
```

### Tahap 1: Kunci Dependencies & Desain Sistem Dasar
* Menambahkan seluruh dependensi yang sudah teruji kompatibilitasnya ke `e_commerce/pubspec.yaml`:
  * Core: `get: ^4.6.6`
  * Networking: `dio: ^5.7.0`
  * Storage: `shared_preferences: ^2.3.3`, `hive_ce: ^2.8.2`, `hive_ce_flutter: ^2.1.2`
  * Cloud: `firebase_core`, `firebase_auth`, `cloud_firestore`
  * UI Helper: `shimmer`, `flutter_launcher_icons`, `intl`
* Menyiapkan `AppTheme` (tema modern: Light & Dark Mode, font Inter/Google Fonts, palet warna primer indigo/blue yang elegan).

### Tahap 2: Pembangunan 7 Modul Bertahap via Get CLI
1. **Sesi 01 (`home`):** Tampilan katalog produk statis, GridView, Card, dan App Bar.
2. **Sesi 02 (`detail`):** Generate via `get create page:detail`. Reaktivitas kuantitas counter & navigasi parameter.
3. **Sesi 03 (`cart`):** Generate via `get create page:cart`. Logika perhitungan subtotal & grand total di `CartController`.
4. **Sesi 04 & 05 (Data Layer):** Pembuatan `ProductModel` dan `ApiService` (Dio). Hubungkan data online DummyJSON ke `home`.
5. **Sesi 06 (Storage):** Implementasi SharedPreferences untuk toggle Dark Mode & inisialisasi box Hive CE.
6. **Sesi 07 (`wishlist`):** Generate via `get create page:wishlist`. Hive TypeAdapter generator & operasi favorit offline.
7. **Sesi 08 (`checkout`):** Generate via `get create page:checkout`. Formulir pengiriman & GetX Middleware Route Guard.
8. **Sesi 09 (`login` & `register`):** Generate via `get create page:login` & `register`. Autentikasi Firebase Auth email & password.
9. **Sesi 10 (`orders`):** Generate via `get create page:orders`. Simpan transaksi pesanan dan Stream real-time Firestore.
10. **Sesi 11 (Finishing UI):** Search bar dengan debounce, filter kategori, dialog konfirmasi.
11. **Sesi 12 (Packaging):** Konfigurasi ikon aplikasi dan kompilasi APK rilis mandiri.

### Tahap 3: Pembuatan Git Tag Checkpoint (`sesi-01` s.d. `sesi-12`)
* Memberikan label Git Tag pada setiap titik checkpoint sesi di repositori agar instruktur memiliki acuan per sesi dan siswa memiliki jaring pengaman (*rescue checkout*).

### Tahap 4: Ekstraksi Branch `starter-ui` untuk Siswa
* Menyalin tampilan antarmuka yang sudah jadi ke branch `starter-ui`, mengosongkan fungsi controller dan menandainya dengan komentar instruksi praktikum (`// TODO: Implement Obx`, `// TODO: Call API via Dio`).


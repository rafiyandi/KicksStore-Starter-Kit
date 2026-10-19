# Rekonstruksi & Optimasi Silabus Flutter Bootcamp (12 Sesi)
**Sasaran:** Siswa SMK (Jurusan Rekayasa Perangkat Lunak / PPLG / SIJA)  
**Tema Proyek Akhir:** Mini E-Commerce (*Continuous Capstone Project*)  
**Metodologi:** *Code-First Curriculum* & *Project-Based Learning (PBL)*  
**Dokumen Acuan Asli:** `docs/Silabus_Flutter_12_Sesi (1).xlsx`

---

## 1. Latar Belakang & Analisis Kritis Silabus Asli

Silabus awal memiliki fondasi materi yang baik, namun terdapat 3 kendala teknis dan pedagogis mendasar jika diterapkan langsung ke siswa SMK dalam 12 kali pertemuan:

| Aspek | Silabus Asli (Lama) | Masalah / Risiko | Solusi Rekonstruksi (Baru) |
| :--- | :--- | :--- | :--- |
| **GetX CLI & MVVM** | Diajarkan di **Sesi 11** (menjelang akhir). | Siswa ngoding 10 sesi dengan struktur bebas (*spaghetti*). Di sesi 11 dipaksa *refactoring*, berisiko *broken imports* dan frustrasi massal. | **Dimajukan ke Sesi 3.** Sejak awal siswa sudah memakai struktur folder standar industri (`modules/`, `controllers/`, `views/`, `bindings/`). |
| **Sistem Autentikasi** | Diajarkan 2x: Sesi 8 (Dio + Token) lalu Sesi 9 (Firebase Auth). | Redundan dan membuang waktu. Alur token manual di Sesi 8 akan terbuang sia-sia saat Firebase Auth masuk di Sesi 9. | **Difokuskan.** Sesi 8 difokuskan pada *Cart Business Logic* & *Route Guard*, sementara autentikasi riil menggunakan Firebase Auth di Sesi 9. |
| **Beban Sesi 1** | CLI Setup + Dart OOP + Async/Await + Layouting dalam 1 sesi. | *Cognitive overload*. Waktu habis untuk troubleshooting laptop sekolah; konsep *async* terlalu dini tanpa konteks nyata. | Sesi 1 fokus murni ke visual layouting dasar. Konsep *Async/Await* dipindah ke Sesi 4 saat mulai fetch REST API. |
| **Karakter Proyek** | Materi harian dan proyek akhir berpotensi terpisah. | Proyek akhir tidak selesai tepat waktu karena waktu praktik siswa terbatas. | **1 Continuous App (Incremental):** Setiap sesi adalah penambahan fitur (*feature add-on*) pada 1 aplikasi yang sama. |

---

## 2. Strategi Proyek: Master Project vs Mirror Project

Untuk menjamin kelancaran belajar mengajar, diterapkan pendekatan *I Do, We Do, You Do*:

1. **Master Project (Instruktur):**
   * Diselesaikan penuh oleh instruktur sebelum kelas dimulai.
   * Menjadi acuan kode bebas bug, sumber tangkapan layar slide, dan *checkpoint* solusi jika siswa mentok.
   * **Contoh Tema:** *KicksStore* (Toko Sneakers Online) atau *TechMart* (Toko Gadget).
2. **Mirror Project (Siswa):**
   * Memiliki struktur data dan logika yang identik 100% (ada `id`, `title`, `price`, `image`, `category`, `description`).
   * Siswa mengimplementasikan konsep yang sama untuk tema domain yang mereka minati.
   * **Contoh Tema:** *Foodies/Cafe App*, *Distro Clothing Store*, *Bookstore*.
   * **Sumber Data API:** [DummyJSON Products Categories](https://dummyjson.com/docs/products) (Gratis, response cepat, dan data realistis).

---

## 3. Pemetaan Arsitektur Data E-Commerce

Agar seluruh teknologi di silabus terpakai secara proporsional dan masuk akal di dunia industri:

```
┌─────────────────────────────────────────────────────────────┐
│                 APLIKASI MINI E-COMMERCE                    │
├──────────────────────────────┬──────────────────────────────┤
│ Komponen / Fitur             │ Teknologi & Library          │
├──────────────────────────────┼──────────────────────────────┤
│ Katalog Produk & Kategori    │ REST API via Dio + JSON Model│
│ UI Reaktif, Cart, Navigasi   │ GetX (State, DI, Route)      │
│ Wishlist / Favorit Offline   │ Hive CE (Local NoSQL DB)     │
│ Dark Mode & Onboarding Flag  │ SharedPreferences            │
│ Akun & Registrasi Pembeli    │ Firebase Authentication      │
│ Riwayat Pesanan (Checkout)   │ Cloud Firestore (Real-time)  │
│ Arsitektur Folder            │ GetX Pattern MVVM (CLI)      │
└──────────────────────────────┴──────────────────────────────┘
```

---

## 4. Silabus Rekonstruksi & Rencana Pembelajaran 12 Sesi

### Sesi 1: Kickoff, Flutter UI & Layouting E-Commerce
* **Tujuan Kompetensi:** Siswa memahami widget tree dan mampu membuat tampilan katalog produk statis.
* **Materi:**
  * Pengenalan ekosistem Flutter & struktur dasar widget tree (`StatelessWidget`).
  * Layouting inti: `Scaffold`, `AppBar`, `Container`, `Row`, `Column`, `ListView`, dan `GridView`.
* **Praktik Proyek:** Membuat layout Card Produk (gambar produk, judul barang, harga, dan tombol "Beli").

---

### Sesi 2: Fundamental State & Reaktivitas GetX
* **Tujuan Kompetensi:** Siswa memahami konsep state dan mampu membuat UI reaktif tanpa `setState`.
* **Materi:**
  * Perbedaan `Stateless` vs `StatefulWidget` & keterbatasan `setState()`.
  * Pengenalan GetX: Reactive state (`.obs` dan `Obx`).
  * Navigasi halaman modern tanpa BuildContext (`Get.to()`, `Get.back()`).
* **Praktik Proyek:** Tombol tambah/kurang kuantitas item (+ / -), badge jumlah barang di icon keranjang belanja, dan navigasi dari katalog ke Halaman Detail Produk.

---

### Sesi 3: GetX CLI & Arsitektur MVVM Dasar *(Dimajukan)*
* **Tujuan Kompetensi:** Siswa mampu menginisialisasi arsitektur project standar industri sejak dini.
* **Materi:**
  * Pengenalan GetX CLI (`get create project` / struktur GetX Pattern).
  * Pemisahan layer: `View`, `Controller`, dan `Binding`.
  * Dependency Injection: `Get.put()`, `Get.lazyPut()`, `Get.find()`.
  * Siklus hidup controller (`onInit`, `onClose`).
* **Praktik Proyek:** Generate modul `home`, `detail`, dan `cart` menggunakan GetX CLI. Memindahkan logika perhitungan keranjang belanja ke `CartController`.

---

### Sesi 4: Asynchronous Dart & REST API dengan Dio Client
* **Tujuan Kompetensi:** Siswa memahami koneksi internet mobile dan mampu melakukan HTTP request.
* **Materi:**
  * Konsep Client-Server, HTTP Methods (GET, POST), status code, dan JSON format.
  * Asynchronous Dart: `Future`, `async`, dan `await`.
  * Setup library **Dio** vs HTTP bawaan.
  * Melakukan HTTP GET request ke Mock API ([DummyJSON](https://dummyjson.com/products)).
* **Praktik Proyek:** Menghubungkan aplikasi ke server online dan membaca raw JSON produk di debug console.

---

### Sesi 5: Model Parsing, Error Handling & UI State
* **Tujuan Kompetensi:** Siswa mampu menampilkan data API ke dalam tampilan aplikasi dengan penanganan state lengkap.
* **Materi:**
  * Konsep Serialization: Pembuatan `ProductModel` (`fromJson` & `toJson`).
  * Integrasi data service ke dalam `ProductController`.
  * Penanganan UI States:
    1. **Loading State:** Indikator loading / shimmer saat data di-fetch.
    2. **Success State:** Menampilkan daftar produk asli dari API ke GridView.
    3. **Empty & Error State:** Tampilan pesan jika koneksi putus atau timeout.
* **Praktik Proyek:** Katalog toko kini menampilkan foto dan harga produk asli dari server internet.

---

### Sesi 6: Local Storage I (SharedPreferences & Setup Hive CE)
* **Tujuan Kompetensi:** Siswa memahami penyimpanan data lokal di HP dan konsep database NoSQL.
* **Materi:**
  * Konsep Client Storage: Kapan pakai SharedPreferences vs Database.
  * **SharedPreferences:** Menyimpan nilai primitif (Switch Dark/Light Mode & Flag Onboarding).
  * Pengenalan **Hive CE** (Community Edition NoSQL local database).
  * Inisialisasi Hive, konsep Boxes, dan operasi write/read sederhana.
* **Praktik Proyek:** Membuat toggle tema aplikasi (Dark Mode) yang tetap tersimpan saat aplikasi ditutup, serta inisialisasi Hive box untuk data produk.

---

### Sesi 7: Local Storage II (CRUD Wishlist Offline dengan Hive CE)
* **Tujuan Kompetensi:** Siswa mampu mengimplementasikan operasi CRUD data lokal menggunakan model objek custom.
* **Materi:**
  * Pembuatan `TypeAdapter` pada Hive CE untuk `WishlistModel`.
  * Operasi CRUD lokal:
    * **Create:** Menyimpan produk ke daftar favorit.
    * **Read:** Menampilkan daftar favorit di tab Wishlist.
    * **Delete:** Menghapus barang dari favorit.
  * Reaktivitas Hive dengan GetX (UI otomatis terupdate saat wishlist bertambah/berkurang).
* **Praktik Proyek:** Fitur "Tandai Favorit / Wishlist" yang dapat dibuka secara instan meskipun smartphone dalam kondisi *Airplane Mode* (offline).

---

### Sesi 8: Cart Business Logic & Route Protection
* **Tujuan Kompetensi:** Siswa mampu menyusun alur bisnis transaksi keranjang belanja dan proteksi akses halaman.
* **Materi:**
  * Pengelolaan *Item Cart*: Menambah barang, mencegah duplikasi item (otomatis tambah qty), dan hapus item.
  * Perhitungan subtotal, kalkulasi diskon, dan grand total belanja secara reaktif.
  * Form validation pada halaman pengiriman / checkout.
  * Konsep **GetX Route Middleware:** Menjaga halaman agar pengguna wajib login sebelum bisa masuk ke halaman Checkout.
* **Praktik Proyek:** Layar Keranjang Belanja fungsional dengan ringkasan total bayar dan tombol Checkout terproteksi.

---

### Sesi 9: Firebase CLI Setup & Firebase Authentication
* **Tujuan Kompetensi:** Siswa mampu menghubungkan aplikasi Flutter dengan Firebase dan membuat sistem autentikasi cloud.
* **Materi:**
  * Setup FlutterFire CLI & registrasi proyek di Google Firebase Console.
  * Inisialisasi `Firebase.initializeApp()`.
  * **Firebase Auth:** Registrasi dan Login pengguna menggunakan Email & Password.
  * Stream listener status login (`authStateChanges`) untuk auto-login / auto-redirect.
* **Praktik Proyek:** Halaman Login & Register pembeli. Saat berhasil login, pengguna otomatis dialihkan ke halaman Checkout.

---

### Sesi 10: Cloud Firestore (Riwayat Pesanan / Real-time Orders)
* **Tujuan Kompetensi:** Siswa mampu menyimpan dan menyinkronkan data transaksi ke cloud database secara real-time.
* **Materi:**
  * Pengenalan Cloud Firestore: Collections & Documents.
  * Menulis data transaksi belanja ke Firestore: `orders.add({...})`.
  * Membaca data realtime menggunakan Firestore `Stream` / `Snapshot`.
  * Integrasi data Firestore ke dalam `OrderHistoryController`.
* **Praktik Proyek:** Saat tombol *"Bayar Sekarang"* ditekan, detail pesanan tersimpan ke cloud dan langsung muncul secara realtime di halaman "Riwayat Pesanan".

---

### Sesi 11: Integrasi Keseluruhan, Fitur Pencarian & Polish
* **Tujuan Kompetensi:** Siswa mampu menyatukan seluruh fitur aplikasi dan menambahkan fitur penunjang UX.
* **Materi:**
  * Menghubungkan seluruh modul: Home $\rightarrow$ Detail $\rightarrow$ Wishlist $\rightarrow$ Cart $\rightarrow$ Checkout $\rightarrow$ Order History.
  * Fitur Pencarian Produk & Filter Kategori (menggunakan query API / GetX reactive filter).
  * UI Refinement: Feedback visual (Snackbar, Dialog konfirmasi, BottomSheet).
* **Praktik Proyek:** Aplikasi e-commerce berfungsi penuh dari ujung ke ujung (*end-to-end flow*).

---

### Sesi 12: App Packaging, Build Release & Demo Showcase
* **Tujuan Kompetensi:** Siswa memahami alur distribusi aplikasi mobile dan mampu men-generate file APK rilis.
* **Materi:**
  * Konfigurasi aset rilis: Mengganti App Icon kustom (`flutter_launcher_icons`) dan nama aplikasi.
  * Mengatur Package Name / Application ID.
  * Penjelasan signing keystore dan overview publikasi ke Google Play Console (kebijakan closed testing 14 hari).
  * Build APK rilis mandiri: `flutter build apk --split-per-abi`.
* **Praktik Proyek:** Setiap siswa menginstal APK rilis toko mereka di smartphone masing-masing dan melakukan presentasi showcase hasil karya.

---

## 5. Rencana Eksekusi Instruktur (*Next Steps*)

1. **Tahap 1 (Koding Master Project):**
   * Menginisialisasi proyek Flutter master (`kicks_store` / `tech_mart`).
   * Menyiapkan `pubspec.yaml` dengan dependensi yang terkunci dan kompatibel.
   * Melakukan commit Git bertahap sesuai checkpoint Sesi 1 s.d. 12.
2. **Tahap 2 (Penyusunan Slide Presentasi):**
   * Mengambil screenshot nyata dari master project yang telah berjalan.
   * Menyusun deck slide per sesi (formula 6–8 slide: *Problem $\rightarrow$ Concept $\rightarrow$ Code Blueprint $\rightarrow$ Mission Target*).
3. **Tahap 3 (Persiapan Kelas Siswa):**
   * Menyiapkan repositori *starter-code* untuk siswa agar meminimalkan kendala setup environment.

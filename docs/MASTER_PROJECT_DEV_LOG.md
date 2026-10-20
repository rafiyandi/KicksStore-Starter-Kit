# MASTER PROJECT DEVELOPMENT LOG
## Project: Mini E-Commerce (*KicksStore*)
### Kurikulum Rekonstruksi Flutter SMK - 12 Sesi

> **Status Proyek**: Starter UI Complete (Light & Dark Mode Ready)  
> **Target Audiens**: Instruktur, Penguji Teknis, dan Siswa SMK  
> **Pola Arsitektur**: GetX Pattern (MVVM) via Get CLI  
> **Pendekatan Pedagogis**: *Full Starter UI First* (UI disiapkan penuh di awal agar sesi bootcamp fokus 100% pada logika bisnis, reactive state, API networking, local database, dan Firebase).

---

## 1. STRATEGI PEMBANGUNAN: "FULL UI FIRST"

### Mengapa Strategi Ini Dipilih?
Pada pembelajaran pemrograman mobile SMK dengan durasi intensif (12 Sesi):
- **Kendala Klasik**: Siswa sering kehabisan waktu di setiap sesi hanya untuk menyusun `Padding`, `Row`, `Column`, `BoxDecoration`, atau mencari aset visual, sehingga sesi materi inti seperti *State Management*, *Asynchronous Programming*, *Dio Interceptor*, dan *Local Caching* tidak tuntas.
- **Solusi Rekonstruksi**:
  1. Seluruh UI (8 Screen Utama + Komponen) dibangun dan diuji terlebih dahulu dengan standar industri (Clean UI, Responsive, Dukungan **Dark Mode & Light Mode**, Zero Compilation Error).
  2. Mulai Sesi 01 hingga Sesi 12, instruktur dan siswa melakukan *bedah kode* (code walkthrough) pada UI yang sudah ada, lalu menginjeksi reaktivitas (`Obx`, `Rx`), controller, data model, API service, Hive cache, dan Firebase bertahap.

---

## 2. POHON MODUL & KOMPONEN UI

| No | Modul / Route | File View & Path | Fitur UI Utama | Status UI |
|---|---|---|---|---|
| 1 | **Home** (`/home`) | `lib/app/modules/home/views/home_view.dart`<br>+ `components/promo_banner.dart`<br>+ `components/product_card.dart` | Header Profil, Search Bar, Carousel Banner Promo, Kategori Filter Horizontal (Chips), GridView Produk 2-Kolom, Bottom Navigation Bar |  Lengkap |
| 2 | **Detail** (`/detail`) | `lib/app/modules/detail/views/detail_view.dart` | Hero Image Banner, Title & Rating Badge, Price Tag, Color Selector, Size Selector (Chips 40-44), Deskripsi expandable, Bottom Bar (Wishlist Button + Add to Cart CTA) |  Lengkap |
| 3 | **Cart** (`/cart`) | `lib/app/modules/cart/views/cart_view.dart` | List Item Keranjang dengan Thumbnail, Nama, Ukuran, Harga, Quantity Stepper (`+`/`-`), Tombol Hapus/Trash, Ringkasan Belanja (Subtotal, Tax, Total), Checkout CTA |  Lengkap |
| 4 | **Wishlist** (`/wishlist`) | `lib/app/modules/wishlist/views/wishlist_view.dart` | Grid Card Produk Favorit, Tombol Quick Delete, Tombol Move to Cart, Empty State Ilustratif |  Lengkap |
| 5 | **Checkout** (`/checkout`) | `lib/app/modules/checkout/views/checkout_view.dart` | Alamat Pengiriman (Editable Card), Pemilihan Kurir Ekspedisi (JNE, SiCepat, GoSend), Pilihan Metode Pembayaran (BCA VA, Mandiri, QRIS, COD), Rincian Biaya, Tombol Bayar Sekarang |  Lengkap |
| 6 | **Login** (`/login`) | `lib/app/modules/login/views/login_view.dart` | Logo Branding, Form Email & Password (Toggle Visibility), Tombol Masuk, Divider Sosial / Demo Credentials Card, Link Navigasi Daftar Akun |  Lengkap |
| 7 | **Register** (`/register`) | `lib/app/modules/register/views/register_view.dart` | Form Nama Lengkap, Email, Password, Konfirmasi Password, Checkbox Persetujuan Syarat & Ketentuan, Tombol Daftar, Link Masuk Akun |  Lengkap |
| 8 | **Orders** (`/orders`) | `lib/app/modules/orders/views/orders_view.dart` | TabBar Status Pesanan (*Semua, Diproses, Dikirim, Selesai*), Card Riwayat Pesanan dengan Order ID, Tanggal, Item Summary, Badge Status Berwarna, Tombol Lacak Pesanan |  Lengkap |

---

## 3. DESAIN SISTEM & THEME ENGINE

Dua tema telah dikonfigurasi penuh dan terintegrasi di `lib/main.dart` melalui `GetMaterialApp`:

### Palette Warna (`lib/app/core/theme/app_colors.dart`)
- **Primary**: Deep Indigo (`#4F46E5`)
- **Secondary / Accent**: Coral Orange (`#F97316`)
- **Status Colors**: Success Emerald (`#10B981`), Warning Amber (`#F59E0B`), Error Rose (`#EF4444`)
- **Neutral Light**: Background `#F8FAFC`, Surface `#FFFFFF`, Border `#E2E8F0`, Text Primary `#0F172A`
- **Neutral Dark**: Background `#0F172A`, Surface `#1E293B`, Border `#334155`, Text Primary `#F8FAFC`

### Theme Data (`lib/app/core/theme/app_theme.dart`)
- **Typography**: Google Fonts Inter dengan skala `textTheme` Material 3 lengkap.
- **Card Styling**: `CardThemeData` terstandarisasi dengan `elevation: 0`, rounded border 16px, dan border color adaptive.
- **Input Decoration**: Rounded outline border 12px, focused primary color, hint text adaptive.
- **Elevated Button**: Stadium / Rounded 12px, tinggi 48–52px, full width responsive.

---

## 4. LOG RIWAYAT SETUP & MILESTONE (CHANGELOG)

### Milestone 0: Fondasi Kurikulum & PRD
- **Dokumen Dibuat**:
  - `docs/SILABUS_REKONSTRUKSI_FLUTTER_12_SESI.md`: Rekonstruksi 12 sesi dengan pemetaan 100% silabus SMK, rubrik penilaian, dan checkpoint git per sesi.
  - `docs/PRD_MINI_ECOMMERCE.md`: PRD lengkap dengan 8 fitur fungsional, arsitektur data Hive & Firestore, flowchart checkout, dan UI state matrix.
- **Setup Dependencies**:
  - `e_commerce/pubspec.yaml` dikonfigurasi dengan versi stabil untuk Flutter 3.27+ / Dart 3.11+:
    - `get: ^4.6.6`
    - `google_fonts: ^6.2.1`
    - `intl: ^0.20.2`
    - `dio: ^5.8.0+1`
    - `shimmer: ^3.0.0`
    - `shared_preferences: ^2.5.2`
    - `hive_ce: ^2.11.3` & `hive_ce_flutter: ^2.3.1`
    - Dev: `build_runner: ^2.4.15`, `hive_ce_generator: ^2.0.4`, `flutter_lints: ^5.0.0`
- **Verifikasi**: `dart pub get` berhasil (78 packages resolved).

### Milestone 1: Arsitektur Get CLI & Starter UI Lengkap
- **Struktur Folder Terstandarisasi Get CLI**:
  - Menginisialisasi 8 modul resmi: `home`, `detail`, `cart`, `wishlist`, `checkout`, `login`, `register`, `orders`.
  - Terdaftar otomatis di `lib/app/routes/app_pages.dart` dan `lib/app/routes/app_routes.dart`.
- **Implementasi Seluruh 8 Layar UI**:
  - Selesai 8 file view dan 2 sub-komponen home.
  - Menangani adaptasi warna Dark Mode dan Light Mode di seluruh layar.
  - Uji static analysis: `dart analyze lib` lulus dengan **0 Errors**.
- **Distribusi untuk Siswa**:
  - **Git Tag**: `v0.1-starter-ui`
  - **Dedicated Branch Siswa**: `starter-kit` (Siswa dapat meng-checkout branch ini untuk memulai pembelajaran dengan UI siap pakai tanpa boilerplate kosong).

### Milestone 2: Sesi 01 - Fondasi GetX (3 Pilar), GetX CLI & Onboarding Starter Kit
- **Master Outline & AI Prompt Presentation Suite**:
  - `docs/materi_presentasi/OUTLINE_SLIDE_SESI_01_AI_PROMPT.md` (Fondasi 3 Pilar GetX & GetX CLI).
  - `docs/materi_presentasi/OUTLINE_SLIDE_MVVM_GETX_AI_PROMPT.md` (Arsitektur MVVM & Pemisahan Logika).
  - `docs/materi_presentasi/OUTLINE_SLIDE_REST_API_DIO_AI_PROMPT.md` (Rest API Networking, Dio, JSON Serialization, Shimmer UI).
  - `docs/materi_presentasi/OUTLINE_SLIDE_LOCAL_STORAGE_HIVE_AI_PROMPT.md` (Local Storage: SharedPreferences vs Hive CE NoSQL).
  - `docs/materi_presentasi/OUTLINE_SLIDE_FIREBASE_AUTH_FIRESTORE_AI_PROMPT.md` (Firebase Auth & Cloud Firestore Realtime).
  - *Seluruh dokumen dilengkapi design directives (Clean Light Theme 16:9), layout spesifik per slide, kode Dart, analogi dunia nyata, speaker notes, kuis siswa, dan prompt siap salin untuk Claude, NotebookLM, Gamma.app, atau ChatGPT.*
- **Slide Deck Presentasi Lengkap (Tema Terang / Clean Light Theme)**:
  - **PowerPoint**: `docs/materi_presentasi/PPT_SESI_01_FONDASI_GETX_DAN_CLI.pptx` (Format Microsoft PowerPoint 16:9, typography proporsional, card styling, bersih & elegan).
  - **Web Interactive Slide**: `docs/materi_presentasi/PPT_SESI_01_FONDASI_GETX_DAN_CLI.html` (Bisa dibuka di browser apa pun dalam mode fullscreen presentation).
  - **Source Markdown**: `docs/materi_presentasi/PPT_SESI_01_FONDASI_GETX_DAN_CLI.md`.
- **Onboarding Proyek Siswa**:
  - Siswa siap meng-clone dan checkout ke branch `starter-kit`.
- **Git Checkpoint**: `sesi-01`





---

## 5. RENCANA EKSEKUSI SESI 01 s/d SESI 12

Status dan rencana eksekusi modular:

| Sesi | Topik Utama | Rencana Aksi Master Project | Status / Checkpoint Tag |
|---|---|---|---|
| **Sesi 01** | Fondasi GetX (3 Pilar) & GetX CLI | Penyusunan slide PPT komprehensif, analogi arsitektur, kuis interaktif, onboarding `starter-kit` |  **Selesai** (`sesi-01`) |
| **Sesi 02** | Layouting & State Management Dasar | Bedah `Row`, `Column`, `GridView` pada katalog produk, implementasi reaktivitas GetX pertama (`RxInt` cart badge, `RxBool` favorite) | `sesi-02` |
| **Sesi 03** | Advanced State Management GetX | Refactor logika ke `HomeController` & `DetailController`, pemisahan logic dari view, navigation `Get.toNamed` berargumen | `sesi-03` |
| **Sesi 04** | Form Handling & Validasi Input | Form validasi `login_view` & `register_view`, validasi email regex & password, `TextEditingController` via GetX | `sesi-04` |
| **Sesi 05** | Networking: Rest API & JSON Serializer | Setup `DioService`, `ProductModel` (fromJson/toJson), fetching katalog produk dummy API, error handling snackbar | `sesi-05` |
| **Sesi 06** | Dio Interceptor & State UI | Dio interceptor (logging & auth token), Shimmer loading skeleton pada `home_view`, state empty & error retry | `sesi-06` |
| **Sesi 07** | Local Storage: Shared Preferences | Simpan status session auth (token/isLoggedIn) dan preferensi tema (Light/Dark switch) via SharedPreferences | `sesi-07` |
| **Sesi 08** | NoSQL Offline Database: Hive CE | Setup Hive CE box, `CartItemModel` TypeAdapter, operasi CRUD offline keranjang belanja dan wishlist | `sesi-08` |
| **Sesi 09** | Firebase Setup & Authentication | Integrasi Firebase Core & Auth, fungsi Login/Register real dengan Firebase, route guard middleware | `sesi-09` |
| **Sesi 10** | Cloud Firestore Real-time | Simpan transaksi checkout ke Cloud Firestore (`orders` collection), query real-time riwayat transaksi | `sesi-10` |
| **Sesi 11** | Polish UI, Testing & Error Handling | Optimasi animasi transisi, snackbar feedback, dialog konfirmasi, unit test model & controller, widget test | `sesi-11` |
| **Sesi 12** | Build, Deployment & Showcase | Konfigurasi app icon & splash screen, build release APK (`flutter build apk --release`), presentasi proyek akhir | `sesi-12` |

---
*Log ini akan selalu diperbarui secara berkala pada setiap penyelesaian tahapan dan sesi.*


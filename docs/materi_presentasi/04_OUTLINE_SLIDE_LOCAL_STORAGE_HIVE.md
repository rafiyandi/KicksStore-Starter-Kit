# BRIEF & SPESIFIKASI SLIDE PRESENTASI: LOCAL STORAGE & DATABASE
## Materi: Penyimpanan Data Lokal Offline dengan SharedPreferences & Hive CE (NoSQL)
> **Panduan Penggunaan**: File ini merupakan *Source Document & Master Prompt* untuk AI generator presentasi (**Claude, NotebookLM, Gamma.app, ChatGPT**) bertema *Clean Light Theme* (16:9).

---

## 1. PANDUAN DESAIN UNTUK AI (DESIGN DIRECTIVES)
* **Tema Visual**: Clean Light Theme (Latar `#FFFFFF`, kartu Slate `#F8FAFC`, aksen database modern).
* **Palet Warna**:
  * *Primary*: Amber Bronze (`#D97706`) & Deep Indigo (`#4F46E5`)
  * *Storage Accent*: Purple Indigo (`#7C3AED`)
  * *Status*: Emerald Green (`#059669`)
* **Tipografi**: Sans-serif modern (Plus Jakarta Sans / Inter). Hirarki seimbang (Title 26–28pt, Code 12pt).
* **Rasio**: Widescreen 16:9.

---

## 2. SPESIFIKASI KONTEN SLIDE-BY-SLIDE

### SLIDE 1: COVER PRESENTASI
* **Badge**: `FLUTTER LOCAL STORAGE • SESI 07 & 08`
* **Judul Utama**: Strategi Penyimpanan Data Lokal: SharedPreferences vs Hive CE NoSQL
* **Sub-Judul**: Membangun Aplikasi E-Commerce yang Cepat, Tahan Offline, dan Menyimpan Preferensi Pengguna
* **Metadata**: Studi Kasus: Keranjang Offline & Preferensi Dark/Light Mode di *KicksStore*.

### SLIDE 2: MENGAPA APLIKASI MEMBUTUHKAN PENYIMPANAN LOKAL?
* **Tipe**: Problem & Use-Case Card.
* **Judul**: Jangan Buat Pengguna Mengambil Data Berulang-ulang!
* **Dampak Tanpa Local Storage**:
  * ❌ Setiap kali aplikasi ditutup, user harus login ulang memasukkan email dan password.
  * ❌ Jika koneksi internet mati di MRT atau lift, keranjang belanja user hilang dan layar menjadi kosong (*Blank*).
  * ❌ Pengaturan tema (Dark Mode/Light Mode) kembali ke default setiap aplikasi dibuka.
* **Solusi Industri**: **Offline-First Strategy** — simpan data penting di penyimpanan internal HP!

### SLIDE 3: PERBANDINGAN DUA METODE PENYIMPANAN
* **Tipe**: 2-Column Comparison Table.
* **Judul**: Kapan Menggunakan SharedPreferences vs Kapan Memakai Hive CE?
| Parameter | SharedPreferences (Sesi 07) | Hive CE NoSQL (Sesi 08) |
|---|---|---|
| **Kategori Data** | Data Sederhana (Key-Value) | Data Kompleks (Objek / List) |
| **Tipe Data** | `bool`, `int`, `double`, `String` | Objek Kustom (`CartItem`, `OrderModel`) |
| **Kecepatan** | Sedang (Disk I/O) | **Super Cepat** (In-Memory Key-Value NoSQL) |
| **Kasus di KicksStore**| Simpan Status Login (`isLoggedIn: true`) & Theme Mode | Simpan Item Keranjang Belanja & Wishlist Offline |

### SLIDE 4: IMPLEMENTASI SHAREDPREFERENCES (SESI 07)
* **Tipe**: Code Box & Explanation.
* **Judul**: Menyimpan Preferensi Sederhana: Token & Tema
* **Kode Simpan Data**:
```dart
final prefs = await SharedPreferences.getInstance();
// 1. Simpan Token Auth
await prefs.setString('auth_token', 'jwt_secret_token_123');
// 2. Simpan Preferensi Tema Gelap
await prefs.setBool('is_dark_mode', true);
```
* **Kode Baca Data Saat Aplikasi Terbuka (main.dart)**:
```dart
final token = prefs.getString('auth_token');
if (token != null) {
  Get.offAllNamed('/home'); // Otomatis bypass login!
}
```

### SLIDE 5: MENGENAL HIVE CE: DATABASE NOSQL TERCEPAT UNTUK DART
* **Tipe**: Feature Highlights (3 Cards).
* **Judul**: Mengapa Hive Community Edition (Hive CE) Jadi Primadona?
* **1. Murni Bahasa Dart**: Tidak membutuhkan driver C++ atau bridging SQLite lambat.
* **2. Kecepatan Kilat**: Operasi Read/Write berjalan dalam hitungan milidetik karena berbasis memory cache.
* **3. Enkripsi Kuat**: Mendukung enkripsi AES-256 untuk keamanan data finansial/keranjang.

### SLIDE 6: ANATOMI HIVE: BOX & TYPEADAPTER
* **Tipe**: Concept & Code Box.
* **Judul**: Menyimpan Objek Kompleks dengan TypeAdapter
* **Konsep**: Hive menyimpan data di dalam wadah yang disebut **"Box"** (seperti tabel atau map).
* **Membuat Model Hive dengan Generator**:
```dart
@HiveType(typeId: 0)
class CartItemModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int price;

  @HiveField(3)
  int quantity;

  CartItemModel({required this.id, required this.name, required this.price, required this.quantity});
}
```
> Menggunakan `build_runner` untuk meng-generate adapter secara otomatis!

### SLIDE 7: OPERASI CRUD PADA HIVE BOX (KERANJANG BELANJA)
* **Tipe**: 4 Operations Grid.
* **Judul**: Operasi CRUD Keranjang Belanja di KicksStore
* **1. Create (Tambah ke Keranjang)**:
  `cartBox.put(item.id, item);`
* **2. Read (Menampilkan Semua Barang)**:
  `List<CartItemModel> items = cartBox.values.toList();`
* **3. Update (Ubah Jumlah Sepatu)**:
  `item.quantity += 1; item.save();`
* **4. Delete (Hapus Barang / Kosongkan Keranjang)**:
  `cartBox.delete(itemId);` atau `cartBox.clear();`

### SLIDE 8: ARSITEKTUR SYNC: DARI LOKAL HIVE KE REST API / CLOUD
* **Tipe**: Sync Architecture Flow.
* **Judul**: Bagaimana Data Lokal Berintegrasi dengan Server?
* **Alur**:
  1. User menambah barang ke keranjang ➔ Disimpan instan di **Hive Box lokal** (Responsif 0 detik!).
  2. Saat user menekan tombol "Checkout" dan ada koneksi internet ➔ Data dikirim ke **Server API / Firebase**.
  3. Jika berhasil dibayar ➔ Hapus item di Hive lokal dan update status pesanan.

### SLIDE 9: KUIS PEMAHAMAN LOCAL STORAGE
* **Tipe**: 2 Quiz Cards.
* **Kuis 1**: Manakah pilihan terbaik untuk menyimpan status apakah pengguna sudah login atau belum?  
  *(A) SharedPreferences, (B) Mengetik di Text file, (C) SQLite ribuan baris)* ➔ **Jawaban: A**
* **Kuis 2**: Apa keuntungan utama database Hive CE dibanding SQLite biasa?  
  *(A) Ditulis murni dalam Dart dan jauh lebih cepat tanpa overhead bridge, (B) Membuat ukuran APK jadi 1 GB, (C) Menghapus data saat baterai habis)* ➔ **Jawaban: A**

### SLIDE 10: RANGKUMAN & STRATEGI OFFLINE-FIRST
* **Golden Rules**:
  1. Gunakan *SharedPreferences* HANYA untuk konfigurasi mini (token, status on/off, tema).
  2. Gunakan *Hive CE* untuk koleksi data transaksi, katalog offline, atau keranjang.
  3. Selalu bersihkan cache local storage saat pengguna melakukan **Logout** demi keamanan data.

---

## 3. MASTER PROMPT UNTUK AI
```text
Buatkan presentasi visual 10 slide mengenai "Local Storage di Flutter: SharedPreferences vs Hive CE NoSQL" berdasarkan brief di atas. Gunakan tema Clean Light Theme (16:9), diagram perbandingan tabel, konsep Box & TypeAdapter, dan studi kasus keranjang belanja offline KicksStore.
```

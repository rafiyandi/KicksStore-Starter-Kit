---
marp: true
theme: default
size: 16:9
paginate: true
style: |
  @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500&display=swap');

  section {
    font-family: 'Plus Jakarta Sans', -apple-system, sans-serif;
    font-size: 15px;
    line-height: 1.5;
    color: #334155;
    background: #FFFFFF;
    padding: 36px 52px;
  }

  h1 {
    font-size: 26px;
    font-weight: 800;
    color: #0F172A;
    letter-spacing: -0.02em;
    margin: 0 0 8px 0;
  }

  h2 {
    font-size: 20px;
    font-weight: 700;
    color: #1E293B;
    letter-spacing: -0.01em;
    margin: 0 0 14px 0;
  }

  h3 {
    font-size: 15px;
    font-weight: 700;
    color: #4F46E5;
    margin: 0 0 6px 0;
  }

  p, li {
    font-size: 14px;
    color: #475569;
    margin-bottom: 6px;
  }

  code {
    font-family: 'JetBrains Mono', monospace;
    font-size: 12.5px;
    background: #F1F5F9;
    color: #4F46E5;
    padding: 2px 6px;
    border-radius: 4px;
    border: 1px solid #E2E8F0;
  }

  pre {
    background: #F8FAFC !important;
    border: 1px solid #E2E8F0;
    border-radius: 8px;
    padding: 10px 14px;
    margin: 6px 0;
  }

  pre code {
    background: transparent !important;
    border: none;
    padding: 0;
    font-size: 12px;
    color: #0F172A;
    line-height: 1.45;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
    margin: 8px 0;
  }

  th {
    background: #F1F5F9;
    color: #0F172A;
    font-weight: 700;
    text-align: left;
    padding: 8px 12px;
    border-bottom: 2px solid #CBD5E1;
  }

  td {
    padding: 8px 12px;
    border-bottom: 1px solid #E2E8F0;
    color: #334155;
  }

  .tag {
    display: inline-block;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    background: #EEF2FF;
    color: #4F46E5;
    padding: 3px 10px;
    border-radius: 100px;
    border: 1px solid #C7D2FE;
    margin-bottom: 8px;
  }

  .tag-orange {
    background: #FFF7ED;
    color: #EA580C;
    border-color: #FFEDD5;
  }

  .grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
    margin-top: 8px;
  }

  .grid-3 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 14px;
    margin-top: 8px;
  }

  .grid-4 {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    gap: 12px;
    margin-top: 8px;
  }

  .card {
    background: #F8FAFC;
    border: 1px solid #E2E8F0;
    border-radius: 10px;
    padding: 14px;
  }

  .card-highlight {
    background: #EEF2FF;
    border: 1px solid #C7D2FE;
    border-radius: 10px;
    padding: 14px;
  }

  .card-danger {
    background: #FEF2F2;
    border: 1px solid #FECACA;
    border-radius: 10px;
    padding: 14px;
  }

  .card-success {
    background: #F0FDF4;
    border: 1px solid #BBF7D0;
    border-radius: 10px;
    padding: 14px;
  }

  footer {
    font-size: 11px;
    color: #94A3B8;
  }
---

<!-- Slide 1: Cover -->
<span class="tag">FLUTTER BOOTCAMP SMK • SESI 01</span>

# Menguasai Fondasi Arsitektur GetX & GetX CLI
## Membedah 3 Pilar: State Management, Route, & Dependency Management

<div class="grid-2" style="margin-top: 24px;">
  <div class="card-highlight">
    <h3 style="color: #4F46E5; margin-bottom: 4px;">🎯 Tujuan Pembelajaran</h3>
    <p style="margin: 0; font-size: 13px;">Siswa memahami kelemahan arsitektur monolitik dasar Flutter dan mampu mengimplementasikan pola GetX Pattern modular secara profesional.</p>
  </div>
  <div class="card">
    <h3 style="color: #0F172A; margin-bottom: 4px;">📱 Studi Kasus Proyek</h3>
    <p style="margin: 0; font-size: 13px;"><strong>KicksStore</strong> (Aplikasi Mini E-Commerce Sepatu Berstandar Industri, Clean UI & Theme Ready).</p>
  </div>
</div>

<div style="margin-top: 24px; font-size: 12px; color: #64748B;">
  <strong>Instruktur:</strong> Sanbercode Flutter SMK Specialist &nbsp;•&nbsp; <strong>Prasyarat:</strong> Flutter SDK & Dart Fundamental
</div>

---

<!-- Slide 2: Agenda -->
<span class="tag">AGENDA SESI</span>
## Apa yang Akan Kita Pelajari Hari Ini?

<div class="grid-3">
  <div class="card">
    <div style="font-size: 20px; margin-bottom: 4px;">⚠️</div>
    <h3 style="color: #0F172A;">1. Problem Statement</h3>
    <p style="font-size: 12.5px;">Kelemahan <code>setState()</code> dan ketergantungan <code>BuildContext</code> pada Flutter konvensional.</p>
  </div>
  <div class="card">
    <div style="font-size: 20px; margin-bottom: 4px;">🏛️</div>
    <h3 style="color: #4F46E5;">2. Tiga Pilar GetX</h3>
    <p style="font-size: 12.5px;">Reaktivitas State (<code>.obs</code>/<code>Obx</code>), Route decoupled, dan Dependency Injection hemat RAM.</p>
  </div>
  <div class="card">
    <div style="font-size: 20px; margin-bottom: 4px;">⚡</div>
    <h3 style="color: #EA580C;">3. GetX CLI & Starter Kit</h3>
    <p style="font-size: 12.5px;">Standarisasi struktur folder modular dan onboarding repositori proyek <strong>KicksStore</strong>.</p>
  </div>
</div>

<div class="card-highlight" style="margin-top: 18px; padding: 10px 16px;">
  <p style="margin: 0; font-size: 13px;">💡 <strong>Metode Belajar:</strong> 40% Konsep Visual & Analogi + 40% Live Code Walkthrough + 20% Interactive Quiz.</p>
</div>

---

<!-- Slide 3: Masalah Flutter Standar -->
<span class="tag tag-orange">LATAR BELAKANG</span>
## Mengapa Industri Beralih dari Flutter Standar ke GetX?

<div class="grid-2">
  <div class="card-danger">
    <h3 style="color: #DC2626;">❌ Kendala di Flutter Standar</h3>
    <ul style="padding-left: 18px; margin: 4px 0; font-size: 13px;">
      <li><strong>Rebuild Boros:</strong> <code>setState()</code> merender ulang seluruh pohon widget Scaffold.</li>
      <li><strong>Tergantung BuildContext:</strong> Pindah halaman dan menampilkan snackbar membutuhkan context yang dalam.</li>
      <li><strong>Boilerplate Rumit:</strong> State management lain (Bloc/Provider) butuh file event & state yang bertele-tele.</li>
      <li><strong>Kebocoran Memori:</strong> Controller manual rawan lupa di-dispose.</li>
    </ul>
  </div>

  <div class="card-success">
    <h3 style="color: #16A34A;">✅ Solusi Bersih GetX</h3>
    <ul style="padding-left: 18px; margin: 4px 0; font-size: 13px;">
      <li><strong>Rebuild Presisi:</strong> Hanya widget dalam <code>Obx</code> yang diperbarui secara selektif.</li>
      <li><strong>Bebas BuildContext:</strong> Navigasi dan dialog dapat dipanggil dari layer bisnis mana pun.</li>
      <li><strong>Sangat Ringkas:</strong> Cukup beri ekstensi <code>.obs</code> tanpa kode boilerplate.</li>
      <li><strong>Otomatisasi Memori:</strong> Controller di-dispose otomatis begitu halaman ditutup.</li>
    </ul>
  </div>
</div>

---

<!-- Slide 4: Tiga Pilar GetX -->
<span class="tag">ARSITEKTUR UTAMA</span>
## Mengenal Tiga Pilar Fondasi GetX

GetX dibangun di atas 3 pilar independen yang bekerja secara harmonis:

<div class="grid-3">
  <div class="card-highlight">
    <span class="tag">PILAR 1</span>
    <h3 style="color: #1E293B;">State Management</h3>
    <p style="font-size: 12.5px; margin-bottom: 8px;">Mengelola data yang berubah secara reaktif tanpa merender ulang seluruh layar.</p>
    <code>var qty = 1.obs;</code><br>
    <code>Obx(() => Text(...));</code>
  </div>

  <div class="card-highlight">
    <span class="tag">PILAR 2</span>
    <h3 style="color: #1E293B;">Route Management</h3>
    <p style="font-size: 12.5px; margin-bottom: 8px;">Navigasi antar layar, parsing argumen, dan transition effect tanpa BuildContext.</p>
    <code>Get.toNamed('/cart');</code><br>
    <code>Get.back();</code>
  </div>

  <div class="card-highlight">
    <span class="tag">PILAR 3</span>
    <h3 style="color: #1E293B;">Dependency Management</h3>
    <p style="font-size: 12.5px; margin-bottom: 8px;">Injeksi instansiasi controller ke memori secara lazy dan auto-dispose via Binding.</p>
    <code>Get.lazyPut(() => Ctr());</code><br>
    <code>Get.find<Ctr>();</code>
  </div>
</div>

---

<!-- Slide 5: Analogi Restoran -->
<span class="tag">ANALOGI DUNIA NYATA</span>
## Memahami GetX Seperti Operasional Restoran Modern

<div class="grid-4">
  <div class="card">
    <div style="font-size: 22px;">👤</div>
    <h3 style="color: #0F172A;">1. User</h3>
    <p style="font-size: 12px; margin: 0;">Pembeli sepatu yang berinteraksi menekan tombol dan melihat produk di layar.</p>
  </div>
  <div class="card">
    <div style="font-size: 22px;">📋</div>
    <h3 style="color: #0F172A;">2. View (UI)</h3>
    <p style="font-size: 12px; margin: 0;"><strong>Buku Menu & Meja.</strong> Hanya menampilkan data dan meneruskan klik user ke Controller.</p>
  </div>
  <div class="card card-highlight">
    <div style="font-size: 22px;">👨‍🍳</div>
    <h3 style="color: #4F46E5;">3. Controller</h3>
    <p style="font-size: 12px; margin: 0;"><strong>Koki Dapur.</strong> Memproses data, menghitung diskon/kuantitas, dan mengelola state reaktif.</p>
  </div>
  <div class="card">
    <div style="font-size: 22px;">🚚</div>
    <h3 style="color: #0F172A;">4. Binding</h3>
    <p style="font-size: 12px; margin: 0;"><strong>Distributor Bahan.</strong> Menyiapkan koki & bahan tepat saat pesanan tiba, lalu membereskan saat selesai.</p>
  </div>
</div>

<div class="card" style="margin-top: 14px; background: #F8FAFC;">
  <p style="margin: 0; font-size: 12.5px;">💡 <strong>Aturan Emas:</strong> View tidak boleh memproses logika matematika/API! Semua logika wajib ada di dalam Controller.</p>
</div>

---

<!-- Slide 6: Deep Dive State Management -->
<span class="tag">PILAR 1: STATE MANAGEMENT</span>
## Reaktivitas Presisi: Perbandingan Kode

<div class="grid-2">
  <div class="card">
    <h3 style="color: #DC2626;">❌ Pola Tradisional (Boros Rebuild)</h3>
```dart
class _CounterState extends State<CounterPage> {
  int counter = 0;

  void add() {
    setState(() {
      counter++; // Seluruh Scaffold di-rebuild!
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
  </div>

  <div class="card card-highlight">
    <h3 style="color: #16A34A;">✅ Pola Reaktif GetX (Presisi Tinggi)</h3>
```dart
// Controller (Logika)
class CartController extends GetxController {
  var counter = 0.obs; // Cukup tambah .obs
  void add() => counter.value++;
}

// View (Tampilan)
class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HANYA Text ini yang dirender ulang!
      body: Center(child: Obx(() => Text("${controller.counter}"))),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.add,
      ),
    );
  }
}
```
  </div>
</div>

---

<!-- Slide 7: Tipe Data Reaktif -->
<span class="tag">PILAR 1: TIPE DATA REAKTIF</span>
## Tipe Data `.obs` yang Sering Dipakai di E-Commerce

Tipe data dasar Dart dapat diubah menjadi reaktif secara instan:

| Tipe Data Asli | Tipe Data Reaktif GetX | Contoh Deklarasi | Studi Kasus di KicksStore |
|---|---|---|---|
| `int` | `RxInt` | `var quantity = 1.obs;` | Jumlah kuantitas checkout sepatu |
| `double` | `RxDouble` | `var totalPrice = 0.0.obs;` | Total tagihan belanja di keranjang |
| `String` | `RxString` | `var selectedSize = '42'.obs;` | Ukuran sepatu yang dipilih pembeli |
| `bool` | `RxBool` | `var isFavorite = false.obs;` | Status icon love wishlist produk |
| `List<T>` | `RxList<T>` | `var cartList = <Item>[].obs;` | Daftar barang di keranjang belanja |

<div class="card-danger" style="margin-top: 12px; padding: 8px 14px;">
  <p style="margin: 0; font-size: 12.5px;">⚠️ <strong>Peringatan Umum:</strong> Jangan membungkus widget dengan <code>Obx</code> jika di dalamnya tidak ada variabel <code>.obs</code>, karena akan menyebabkan runtime exception!</p>
</div>

---

<!-- Slide 8: Route Management -->
<span class="tag">PILAR 2: ROUTE MANAGEMENT</span>
## Navigasi Bersih Tanpa Ketergantungan BuildContext

Navigasi di GetX berbasis nama rute (*Named Routing*) yang terpusat di `app_routes.dart`:

<div class="grid-2">
  <div class="card">
    <h3 style="color: #0F172A;">Perintah Navigasi Utama</h3>
    <ul style="padding-left: 18px; font-size: 13px;">
      <li><code>Get.toNamed('/detail');</code><br><span style="font-size: 11.5px; color: #64748B;">Pindah ke halaman detail (menumpuk di stack).</span></li>
      <li><code>Get.back();</code><br><span style="font-size: 11.5px; color: #64748B;">Kembali ke halaman sebelumnya (pop stack).</span></li>
      <li><code>Get.offNamed('/home');</code><br><span style="font-size: 11.5px; color: #64748B;">Pindah dan tutup halaman saat ini.</span></li>
      <li><code>Get.offAllNamed('/login');</code><br><span style="font-size: 11.5px; color: #64748B;">Hapus seluruh riwayat layar (misal saat Logout).</span></li>
    </ul>
  </div>

  <div class="card card-highlight">
    <h3 style="color: #4F46E5;">Mengirim & Menerima Data (Arguments)</h3>
```dart
// 1. Mengirim dari HomeView
Get.toNamed('/detail', arguments: {
  'id': 'shoe-01',
  'name': 'Nike Air Jordan',
  'price': 2499000,
});

// 2. Menerima di DetailController
class DetailController extends GetxController {
  late Map<String, dynamic> item;

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments; // Langsung tangkap!
  }
}
```
  </div>
</div>

---

<!-- Slide 9: Dependency Management -->
<span class="tag">PILAR 3: DEPENDENCY MANAGEMENT</span>
## Injeksi Dependensi: Hemat Memori & Otomatisasi Siklus Hidup

Mengapa kita tidak boleh menulis `final controller = CartController();` di dalam widget View?
Karena setiap kali widget di-build ulang, objek baru akan tercipta dan memori membengkak.

<div class="grid-2">
  <div class="card">
    <h3 style="color: #0F172A;">Pola Injeksi via GetX</h3>
    <ul style="padding-left: 18px; font-size: 13px;">
      <li><code>Get.put(Controller());</code><br><span style="font-size: 11.5px; color: #64748B;">Langsung dimuat ke RAM saat itu juga.</span></li>
      <li><code>Get.lazyPut(() => Controller());</code><br><span style="font-size: 11.5px; color: #64748B;"><strong>Sangat Dianjurkan!</strong> Objek baru dimuat saat pertama kali diakses.</span></li>
      <li><code>Get.find<Controller>();</code><br><span style="font-size: 11.5px; color: #64748B;">Mengambil objek singleton yang sudah terdaftar.</span></li>
    </ul>
  </div>

  <div class="card card-highlight">
    <h3 style="color: #4F46E5;">Peran Sakti File Binding</h3>
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
    <p style="font-size: 11.5px; margin: 4px 0 0 0; color: #334155;">Saat user keluar dari layar keranjang, <code>CartController</code> otomatis dihapus dari memori secara higienis!</p>
  </div>
</div>

---

<!-- Slide 10: GetX CLI -->
<span class="tag">STANDARISASI INDUSTRI</span>
## Mengapa Wajib Menggunakan GetX CLI?

**GetX CLI** adalah alat baris perintah resmi untuk mengotomatisasi pembuatan struktur arsitektur:

<div class="grid-3">
  <div class="card">
    <div style="font-size: 20px;">⚡</div>
    <h3 style="color: #0F172A;">Super Cepat</h3>
    <p style="font-size: 12px; margin: 0;">Membuat 1 modul lengkap (View, Controller, Binding, dan Route terdaftar) hanya dengan 1 baris perintah dalam 2 detik.</p>
  </div>
  <div class="card">
    <div style="font-size: 20px;">🛡️</div>
    <h3 style="color: #0F172A;">Bebas Typo</h3>
    <p style="font-size: 12px; margin: 0;">Tidak ada lagi rute salah ketik atau lupa mendaftarkan controller ke <code>app_pages.dart</code>.</p>
  </div>
  <div class="card">
    <div style="font-size: 20px;">🏢</div>
    <h3 style="color: #0F172A;">Standar Industri</h3>
    <p style="font-size: 12px; margin: 0;">Seluruh 30+ siswa di laboratorium memiliki struktur folder 100% konsisten dan mudah dinilai.</p>
  </div>
</div>

<div class="card-highlight" style="margin-top: 14px;">
  <h3 style="color: #4F46E5; margin-bottom: 4px;">Perintah Utama GetX CLI:</h3>
  <code style="font-size: 12px;">get create project:e_commerce</code> &nbsp;|&nbsp; 
  <code style="font-size: 12px;">get create page:home</code> &nbsp;|&nbsp; 
  <code style="font-size: 12px;">get create page:detail</code> &nbsp;|&nbsp; 
  <code style="font-size: 12px;">get create page:cart</code>
</div>

---

<!-- Slide 11: Anatomi Folder -->
<span class="tag">STRUKTUR PROYEK</span>
## Anatomi Folder Resmi GetX Pattern pada KicksStore

```
lib/
├── app/
│   ├── core/theme/         --> AppColors & AppTheme (Mendukung Dark & Light Mode)
│   ├── data/               --> Models, Dio ApiService, Hive Box (Mulai Sesi 05)
│   ├── modules/            --> Modular per Fitur Aplikasi
│   │   ├── home/           --> bindings/, controllers/, views/ & components/
│   │   ├── detail/         --> Detail Produk, Size Selector, Add to Cart
│   │   ├── cart/           --> Keranjang Belanja, Qty Stepper, Total Biaya
│   │   ├── wishlist/       --> Koleksi Produk Favorit
│   │   ├── checkout/       --> Kurir, Alamat, Metode Pembayaran
│   │   ├── login/          --> Autentikasi Pengguna
│   │   ├── register/       --> Pendaftaran Akun Baru
│   │   └── orders/         --> Riwayat Transaksi & Status Pesanan
│   └── routes/
│       ├── app_pages.dart  --> Pendaftaran Route + Binding Resmi
│       └── app_routes.dart --> Konstanta Path String (/home, /detail, dll)
└── main.dart               --> Inisialisasi GetMaterialApp & Global Theme
```

---

<!-- Slide 12: Starter Kit Onboarding -->
<span class="tag tag-orange">STRATEGI PEMBELAJARAN</span>
## Starter Kit KicksStore: Mengapa UI Disiapkan Penuh?

Di branch **`starter-kit`**, seluruh tampilan antarmuka (8 Modul) sudah dibuatkan dengan rapi:

<div class="grid-2">
  <div class="card">
    <h3 style="color: #0F172A;">Keuntungan bagi Siswa SMK</h3>
    <ul style="padding-left: 18px; font-size: 13px;">
      <li><strong>Fokus pada Logika Bisnis:</strong> Tidak habis waktu 2 jam hanya untuk membetulkan <code>RenderFlex overflowed</code>.</li>
      <li><strong>Estetika Profesional:</strong> Desain sudah setara aplikasi retail komersial modern.</li>
      <li><strong>Light & Dark Mode:</strong> Seluruh layar otomatis adaptif terhadap tema sistem.</li>
    </ul>
  </div>

  <div class="card card-highlight">
    <h3 style="color: #4F46E5;">Alur Belajar Sesi 02 s.d. Sesi 12</h3>
    <p style="font-size: 12.5px;">Di sesi-sesi berikutnya, kita akan fokus menyuntikkan:</p>
    <ol style="padding-left: 18px; font-size: 12px; margin: 0;">
      <li>Logika Reaktivitas State & Counter (Sesi 02–03)</li>
      <li>Form Validation & Regex (Sesi 04)</li>
      <li>Dio Rest API & Shimmer (Sesi 05–06)</li>
      <li>SharedPreferences & Hive NoSQL (Sesi 07–08)</li>
      <li>Firebase Auth & Cloud Firestore (Sesi 09–10)</li>
    </ol>
  </div>
</div>

---

<!-- Slide 13: Kuis Interaktif -->
<span class="tag">KUIS INTERAKTIF</span>
## Uji Pemahaman Cepat (Check for Understanding)

<div class="grid-3">
  <div class="card">
    <span class="tag">KUIS 1</span>
    <p style="font-size: 13px; font-weight: 600; color: #0F172A;">Apa yang terjadi saat nilai variabel <code>.obs</code> diubah?</p>
    <p style="font-size: 12px; color: #64748B;">
      A. Seluruh halaman Scaffold rebuild.<br>
      <strong>B. Hanya widget dalam <code>Obx</code> yang diperbarui secara efisien.</strong><br>
      C. Aplikasi berhenti/freeze.
    </p>
  </div>

  <div class="card">
    <span class="tag">KUIS 2</span>
    <p style="font-size: 13px; font-weight: 600; color: #0F172A;">Perintah apa untuk pindah ke halaman keranjang?</p>
    <p style="font-size: 12px; color: #64748B;">
      A. <code>Navigator.jump('/cart');</code><br>
      <strong>B. <code>Get.toNamed('/cart');</code></strong><br>
      C. <code>Route.open('/cart');</code>
    </p>
  </div>

  <div class="card">
    <span class="tag">KUIS 3</span>
    <p style="font-size: 13px; font-weight: 600; color: #0F172A;">Apa tugas utama dari file <code>Binding</code>?</p>
    <p style="font-size: 12px; color: #64748B;">
      A. Mengatur background warna layar.<br>
      <strong>B. Menyuntikkan Controller ke memori via Dependency Injection.</strong><br>
      C. Menyimpan password akun user.
    </p>
  </div>
</div>

---

<!-- Slide 14: Penutup & Checklist -->
<span class="tag">RANGKUMAN & PERSIAPAN</span>
## Langkah Selanjutnya: Memulai Sesi 02

<div class="grid-2">
  <div class="card-success">
    <h3 style="color: #16A34A;">🎯 Pencapaian Hari Ini</h3>
    <ul style="padding-left: 18px; font-size: 13px; margin: 0;">
      <li>Memahami 3 Pilar GetX: State, Route, dan Dependency Management.</li>
      <li>Memahami efisiensi reaktivitas <code>.obs</code> dan <code>Obx</code> dibanding <code>setState()</code>.</li>
      <li>Mengenal struktur modular GetX CLI dan peran file Binding.</li>
    </ul>
  </div>

  <div class="card-highlight">
    <h3 style="color: #4F46E5;"> Checklist Persiapan Siswa Sesi 02</h3>
    <ul style="padding-left: 18px; font-size: 13px; margin: 0;">
      <li>Pastikan repositori telah di-clone ke laptop masing-masing.</li>
      <li>Jalankan perintah: <code>git checkout starter-kit</code></li>
      <li>Jalankan <code>flutter run</code> untuk memverifikasi aplikasi berjalan mulus di emulator.</li>
    </ul>
  </div>
</div>

<div style="text-align: center; margin-top: 30px;">
  <h2 style="color: #4F46E5; margin: 0;">Terima Kasih! Sampai Jumpa di Sesi 02 🚀</h2>
  <p style="font-size: 13px; color: #64748B; margin-top: 4px;">Sesi 02: Memulai Reaktivitas State & Navigasi Interaktif pada Katalog KicksStore</p>
</div>

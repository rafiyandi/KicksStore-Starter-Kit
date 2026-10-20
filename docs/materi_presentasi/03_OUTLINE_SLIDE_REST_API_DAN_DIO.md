# BRIEF & SPESIFIKASI SLIDE PRESENTASI: REST API & NETWORKING
## Materi: Mengambil Data Server dengan Dio HTTP, JSON Serialization, & Shimmer Loading
> **Panduan Penggunaan**: File ini merupakan *Source Document & Master Prompt* untuk AI generator presentasi (**Claude, NotebookLM, Gamma.app, ChatGPT**) bertema *Clean Light Theme* (16:9).

---

## 1. PANDUAN DESAIN UNTUK AI (DESIGN DIRECTIVES)
* **Tema Visual**: Clean Light Theme (Latar `#FFFFFF`, kartu Slate `#F8FAFC`, aksen status modern).
* **Palet Warna**:
  * *Primary*: Royal Blue (`#2563EB`)
  * *Success/API OK*: Emerald Green (`#16A34A`)
  * *Error/Timeout*: Rose Red (`#E11D48`)
  * *Loading/Skeleton*: Neutral Slate (`#E2E8F0`)
* **Tipografi**: Sans-serif modern (Plus Jakarta Sans / Inter). Hirarki seimbang (Title 26–28pt, Code 12pt).
* **Rasio**: Widescreen 16:9.

---

## 2. SPESIFIKASI KONTEN SLIDE-BY-SLIDE

### SLIDE 1: COVER PRESENTASI
* **Badge**: `FLUTTER NETWORKING • SESI 05 & 06`
* **Judul Utama**: Menghubungkan Aplikasi Mobile ke Internet dengan Rest API & Dio
* **Sub-Judul**: Client Networking, JSON Parsing Otomatis, Interceptor Auth, dan Shimmer Loading Skeleton
* **Metadata**: Studi Kasus: Mengambil Katalog Sepatu Online di *KicksStore*.

### SLIDE 2: APA ITU REST API? (ANALOGI KURIR & PELAYAN)
* **Tipe**: Flow Illustration Cards.
* **Judul**: Bagaimana Aplikasi Mobile Berbicara dengan Server?
* **Analogi Restoran**:
  * 📱 **Aplikasi Mobile (Pelanggan)**: Duduk memesan makanan (Request).
  * 🌐 **Rest API (Pelayan / Kurir)**: Mengantarkan pesanan ke dapur dan membawakan makanan ke meja (Response JSON).
  * 🖥️ **Backend Server & Database (Dapur)**: Memasak dan mengambil bahan makanan dari gudang.
* **Format Data Standar**: JSON (*JavaScript Object Notation*) — format teks universal yang dipahami semua bahasa.

### SLIDE 3: MENGAPA MEMILIH DIO DIBANDING HTTP BAWAAN FLUTTER?
* **Tipe**: 2-Column Comparison.
* **Judul**: Dio HTTP Client: Standar Emas Industri
| Fitur | Package `http` Standar | Package `dio` Modern |
|---|---|---|
| **JSON Auto-Decode** | Harus panggil `jsonDecode()` manual | Otomatis mengubah JSON menjadi Map |
| **Interceptors** | Tidak ada bawaan | Logging otomatis & injeksi token Auth |
| **Global Base URL** | Harus ketik URL lengkap berulang kali | `BaseOptions(baseUrl: 'https://api...')` |
| **Timeout Handling** | Konfigurasi rumit | Otomatis throw timeout error jika koneksi lelet |
| **File Upload / Download** | Repot | Sangat mudah via `FormData` |

### SLIDE 4: ARSITEKTUR NETWORKING DI GETX
* **Tipe**: 4-Layer Architecture Diagram.
* **Judul**: Jalur Aliran Data dari Server ke Layar HP
* **Alur**:
  ```
  [ Cloud Rest API ] 
         │ (JSON String)
         ▼
  [ DioService / ApiProvider ]  <-- Handle BaseURL, Header, Interceptor
         │ (Map Data)
         ▼
  [ ProductModel.fromJson() ]   <-- Mengubah JSON ke Objek Dart Type-Safe
         │ (List<ProductModel>)
         ▼
  [ HomeController (ViewModel) ]<-- Menyimpan ke RxList<ProductModel>
         │ (Data Reaktif)
         ▼
  [ HomeView (Obx GridView) ]   <-- Menampilkan Katalog Produk
  ```

### SLIDE 5: JSON SERIALIZATION (DARI JSON KE MODEL DART)
* **Tipe**: Side-by-Side Code Box (Raw JSON vs Model Dart).
* **Judul**: Serialisasi Data: Mencegah Error Salah Ketik Key
* **JSON dari Server**:
```json
{
  "id": "shoe-101",
  "name": "Air Jordan High Retro",
  "price": 2899000,
  "in_stock": true
}
```
* **Dart Model**:
```dart
class ProductModel {
  final String id;
  final String name;
  final int price;
  final bool inStock;

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        inStock = json['in_stock'];
}
```

### SLIDE 6: KEKUATAN DIO INTERCEPTORS
* **Tipe**: Concept Card + Flow.
* **Judul**: Interceptor: "Satpam Pemeriksa" di Gerbang Request & Response
* **Fungsi Utama Interceptor**:
  1. **Otomasi Auth Token**: Menempelkan `Authorization: Bearer <TOKEN>` secara otomatis di setiap request tanpa repot mengetik ulang.
  2. **Logging Debugger**: Mencetak URL request dan response code ke console terminal.
  3. **Global Error Catching**: Jika server mengembalikan `401 Unauthorized` (Token kadaluarsa), interceptor langsung otomatis logout ke layar login!

### SLIDE 7: STATE HANDLING (LOADING, EMPTY, ERROR, SUCCESS)
* **Tipe**: 4 UI State Badges.
* **Judul**: 4 Kondisi Antarmuka yang Wajib Dibuat Developer Pro
* **State 1: Loading** ➔ Tampilkan skeleton shimmer (bukan layar hitam!).
* **State 2: Empty** ➔ Tampilkan ilustrasi kosong jika produk belum ada.
* **State 3: Error** ➔ Tampilkan tombol "Coba Lagi" jika internet mati.
* **State 4: Success** ➔ Tampilkan Grid produk secara estetik.

### SLIDE 8: SHIMMER SKELETON: USER EXPERIENCE KELAS ATAS
* **Tipe**: Visual Showcase & Code Snippet.
* **Judul**: Shimmer Loading: Mengapa Tidak Pakai CircularProgressIndicator Biasa?
* **Alasan UX**:
  * Circular spinner biasa membuat user merasa menunggu lama dan bosan.
  * *Skeleton Shimmer* memberikan bayangan ilusi tata letak layout yang akan muncul, sehingga aplikasi terasa 2x lebih cepat dan responsif!
* **Implementasi di KicksStore**:
```dart
Obx(() {
  if (controller.isLoading.value) {
    return const ProductCardShimmer(); // Efek berkilau abu-abu
  }
  return GridView.builder(...); // Tampilan produk asli
});
```

### SLIDE 9: KUIS PEMAHAMAN REST API & DIO
* **Tipe**: 2 Quiz Cards.
* **Kuis 1**: Apa peran method `ProductModel.fromJson()`?  
  *(A) Mengirim email ke server, (B) Mengubah teks JSON dari API menjadi objek Dart yang aman, (C) Menghapus data di database)* ➔ **Jawaban: B**
* **Kuis 2**: Apa fungsi utama Dio Interceptor?  
  *(A) Menghiasi border tombol, (B) Mencegat dan menyisipkan token/log pada request HTTP secara otomatis, (C) Mematikan koneksi internet)* ➔ **Jawaban: B**

### SLIDE 10: RANGKUMAN & BEST PRACTICES NETWORKING
* **Prinsip Utama**:
  1. Selalu gunakan Model Dart ber-type kuat, hindari mengakses raw `json['key']` di dalam View.
  2. Gunakan `try-catch` atau interceptor untuk menangani kondisi koneksi putus (*offline/timeout*).
  3. Berikan feedback visual yang halus dengan Shimmer Loading.

---

## 3. MASTER PROMPT UNTUK AI
```text
Buatkan presentasi visual 10 slide mengenai "Rest API & Networking di Flutter dengan Dio & GetX" berdasarkan brief di atas. Gunakan tema Clean Light Theme (16:9), diagram aliran data 4-layer, analogi pelayan restoran, perbandingan Dio vs http, dan arsitektur Shimmer loading.
```

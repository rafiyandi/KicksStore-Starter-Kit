# BRIEF & SPESIFIKASI SLIDE PRESENTASI: ARSITEKTUR MVVM
## Materi: Model-View-ViewModel (MVVM) Pattern pada Flutter & GetX
> **Panduan Penggunaan**: File ini merupakan *Source Document & Master Prompt* untuk AI generator presentasi (**Claude, NotebookLM, Gamma.app, ChatGPT**) guna menghasilkan presentasi visual profesional bertema *Clean Light Theme* (16:9).

---

## 1. PANDUAN DESAIN UNTUK AI (DESIGN DIRECTIVES)
* **Tema Visual**: Clean Light Theme (Latar `#FFFFFF`, kartu Slate `#F8FAFC`, border tipis `#E2E8F0`).
* **Warna Aksen**: Primary Indigo (`#4F46E5`), Accent Teal (`#0D9488`), Warning Rose (`#E11D48`).
* **Tipografi**: Sans-serif modern (Plus Jakarta Sans / Inter). Hirarki proporsional (Title 26–28pt, Body 14pt, Code 12pt).
* **Rasio**: Widescreen 16:9.
* **Target Audiens**: Siswa SMK RPL / Mobile Developer Pemula.

---

## 2. SPESIFIKASI KONTEN SLIDE-BY-SLIDE

### SLIDE 1: COVER PRESENTASI
* **Badge**: `FLUTTER ARSITEKTUR • SESI 03`
* **Judul Utama**: Membangun Aplikasi Skala Industri dengan Arsitektur MVVM
* **Sub-Judul**: Pemisahan Tanggung Jawab Antara Data (Model), Tampilan (View), dan Logika (ViewModel)
* **Metadata**: Studi Kasus: Modul Katalog & Detail Sepatu *KicksStore*.

### SLIDE 2: MENGAPA PERLU ARSITEKTUR SOFTWARE?
* **Tipe**: Problem Statement Card.
* **Judul**: Bahaya "Spaghetti Code" di File View
* **Masalah**:
  * 🍝 Menulis logika hitung diskon, validasi form, dan panggilan API di dalam method `build()` widget.
  * 💥 Kode sulit diuji (*untestable*), rawan bug saat fitur bertambah.
  * 👥 Kolaborasi tim berantakan karena semua orang mengedit satu file yang sama ribuan baris.
* **Solusi**: Prinsip **Separation of Concerns (SoC)** — setiap layer hanya punya 1 tanggung jawab!

### SLIDE 3: DIAGRAM SEGITIGA ARSITEKTUR MVVM
* **Tipe**: 3-Box Flow Diagram.
* **Judul**: Bagaimana Tiga Komponen MVVM Bekerja Bersama?
* **Alur**:
  ```
  [ MODEL (Data) ] <==== Mengambil Data ====> [ VIEWMODEL / CONTROLLER ]
                                                          ||
                                              Data Reaktif (.obs) & Aksi
                                                          ||
                                                   [ VIEW (UI) ]
  ```
* **Keterangan**:
  1. **Model**: Struktur data murni (`ProductModel`, `ShoeItem`).
  2. **ViewModel (GetxController)**: Otak aplikasi, mengolah state dan logika.
  3. **View (`GetView<T>`)**: Wajah aplikasi, murni menampilkan data visual.

### SLIDE 4: ANALOGI DUNIA NYATA: STUDIO FOTOGRAFI & DAPUR
* **Tipe**: 3 Real-World Analogy Cards.
* **1. Model (Bahan Baku / Objek Foto)**: Kumpulan sepatu asli di gudang. Tidak punya logika, hanya entitas fisik yang punya nama, harga, dan ukuran.
* **2. ViewModel (Koki / Fotografer Pro)**: Mengatur bagaimana produk ditata, memfilter ukuran yang tersedia, dan menghitung total harga saat dipesan.
* **3. View (Galeri Display / Etalase Toko)**: Etalase kaca yang dilihat pengunjung. Etalase tidak memikirkan cara sepatu dijahit, hanya menampilkannya secara rapi.

### SLIDE 5: MODEL (DATA ENTITY DI DART)
* **Tipe**: Code Box & Explanation.
* **Judul**: Model: Cetak Biru Data yang Kuat (*Type-Safe*)
* **Kode**:
```dart
class ProductModel {
  final String id;
  final String name;
  final int price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
```
* **Poin Kunci**: Model tidak boleh mengimpor widget Flutter (seperti `BuildContext` atau `Widget`). Model murni kode Dart!

### SLIDE 6: VIEWMODEL (GETXCONTROLLER)
* **Tipe**: Code Box & Explanation.
* **Judul**: ViewModel: Tempat Logika dan Reaktivitas Hidup
* **Kode**:
```dart
class DetailController extends GetxController {
  // 1. State Reaktif
  var selectedSize = '42'.obs;
  var quantity = 1.obs;

  // 2. Logika Bisnis
  void changeSize(String newSize) => selectedSize.value = newSize;
  void increment() => quantity.value++;
  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }
}
```
* **Poin Kunci**: ViewModel tidak tahu tombol apa yang ditekan user. Ia hanya menyediakan variabel state dan fungsi.

### SLIDE 7: VIEW (UI PRESENTER MENGGUNAKAN GETVIEW)
* **Tipe**: Code Box & Explanation.
* **Judul**: View: Tampilan Bersih Menggunakan `GetView<T>`
* **Kode**:
```dart
class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Sepatu')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("Ukuran: ${controller.selectedSize}")),
            ElevatedButton(
              onPressed: () => controller.changeSize('43'),
              child: const Text('Pilih Ukuran 43'),
            ),
          ],
        ),
      ),
    );
  }
}
```
* **Poin Kunci**: `GetView` otomatis menyediakan getter `controller` tanpa perlu `Get.find()` manual!

### SLIDE 8: PERBANDINGAN: SEBELUM VS SESUDAH MVVM
* **Tipe**: Comparison Table.
| Aspek | Tanpa MVVM (Monolitik) | Dengan MVVM (GetX Pattern) |
|---|---|---|
| **Lokasi Logika** | Tercampur di dalam widget `build()` | Terpisah di `Controller` |
| **Testing** | Harus menjalankan UI/Emulator | Unit test logic tanpa butuh UI |
| **Kerapian Kode** | File bisa mencapai 1000+ baris | View ringkas (~150 baris), Controller fokus |
| **Kerja Tim** | Sering terjadi Git Conflict | Frontend UI & Backend Logic bisa paralel |

### SLIDE 9: KUIS PEMAHAMAN ARSITEKTUR
* **Tipe**: 2 Quiz Cards.
* **Kuis 1**: Di mana kita harus meletakkan fungsi untuk menghitung total belanja setelah diskon voucher?  
  *(A) Di dalam widget Text, (B) Di dalam Controller, (C) Di dalam file main.dart)* ➔ **Jawaban: B**
* **Kuis 2**: Apa keuntungan utama menggunakan `GetView<MyController>` dibanding `StatelessWidget` biasa?  
  *(A) Tidak perlu memanggil Get.find manual, (B) Membuat aplikasi lebih lambat, (C) Mengubah nama icon)* ➔ **Jawaban: A**

### SLIDE 10: RANGKUMAN & GOLDEN RULES MVVM
* **Checklist Emas**:
  1. *View* HANYA boleh menampilkan data dan meneruskan event klik ke controller.
  2. *Controller* HANYA mengurus data reaktif dan fungsi logika bisnis.
  3. *Model* HANYA mendefinisikan struktur data murni.

---

## 3. MASTER PROMPT UNTUK AI
```text
Buatkan presentasi visual 10 slide mengenai "Arsitektur MVVM di Flutter dengan GetX" berdasarkan brief di atas. Gunakan tema Clean Light Theme (16:9), kartu modern, diagram segitiga MVVM, dan contoh kode Dart yang presisi.
```

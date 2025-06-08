**Langkah 6: Dokumentasi (`README.md`)** ✅

----

```markdown
# Todo MVVM App (Flutter)

Aplikasi Todo sederhana menggunakan pola desain **MVVM (Model-View-ViewModel)** dalam Flutter, serta menggunakan paket `provider` untuk manajemen state.

## 🧠 Apa itu MVVM?

**MVVM** adalah arsitektur yang memisahkan logika aplikasi ke dalam tiga komponen utama:

- **Model**: Representasi data, seperti class `Task`.
- **ViewModel**: Mengatur logika dan state, menghubungkan View dengan Model.
- **View**: Antarmuka pengguna, hanya bertugas menampilkan data dan menerima input.

Struktur ini membuat kode lebih **terorganisir**, **mudah dipelihara**, dan **mudah diuji**.

## 📁 Struktur Folder

```

lib/
├── models/             # Data model (Task)
├── repositories/       # Pengelolaan data (TaskRepository)
├── viewmodels/         # Logika aplikasi (TaskViewModel)
├── views/              # Antarmuka pengguna (UI)
└── main.dart           # Entry point

````

## ▶️ Cara Menjalankan Aplikasi

1. Clone atau download proyek ini
2. Buka terminal dan arahkan ke folder proyek
3. Jalankan perintah:

```bash
flutter pub get
flutter run
````

Pastikan menggunakan **Flutter SDK versi 3.7.2 atau kompatibel**.

## 🔄 Fitur Aplikasi

* Tambah tugas baru
* Hapus tugas
* Tandai tugas sebagai selesai
* State dikelola menggunakan ViewModel dan Provider

## ✍️ Refleksi

> Dari tugas ini saya memahami pentingnya pemisahan antara UI dan logika bisnis. MVVM membuat kode lebih terstruktur dan mudah dipelihara. Tantangan utamanya adalah memahami kapan harus menggunakan `notifyListeners()` dan bagaimana data mengalir antar ViewModel dan View.

---

## ✅ Unit Testing: Validasi Input Todo

Sebagai bagian dari pengembangan aplikasi ini, saya menambahkan fungsi validasi input task untuk memastikan pengguna tidak dapat memasukkan tugas yang kosong atau kurang dari 3 karakter.

### Fungsi Validasi

Fungsi `isValidTask` melakukan hal berikut:
- Menghapus spasi di awal dan akhir input (`trim()`).
- Memastikan input tidak kosong.
- Memastikan input memiliki panjang minimal 3 karakter.

### Pengujian Unit

Pengujian unit ditulis dengan paket `flutter_test` untuk menguji berbagai skenario:

- Input kosong → validasi gagal (false).
- Input hanya berisi spasi → validasi gagal (false).
- Input kurang dari 3 karakter → validasi gagal (false).
- Input valid (3 karakter atau lebih) → validasi berhasil (true).

Pengujian mengikuti pola *Arrange-Act-Assert* agar mudah dipahami dan terstruktur dengan baik.

### Cara Menjalankan Tes

Jalankan perintah berikut di terminal proyek:

```bash
flutter test

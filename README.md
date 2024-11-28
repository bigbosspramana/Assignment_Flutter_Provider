# Aplikasi Penghitung

Aplikasi ini adalah sebuah aplikasi penghitung multi-pengguna yang memungkinkan pengguna untuk membuat, mengelola, dan mengedit beberapa penghitung. Aplikasi ini dibuat menggunakan Flutter dengan manajemen status global menggunakan paket Provider.

## 🎯 Fitur Utama

- **Penghitung Global**: Kelola daftar penghitung secara terpusat dengan **Provider**.
- **Penghitung Lokal**: Contoh penghitung sederhana untuk memahami perbedaan status lokal dan global.
- **Edit Warna dan Label**: Ubah warna dan label penghitung dengan mudah melalui dialog interaktif.
- **Drag-and-Drop**: Urutkan penghitung dengan cara menyeret dan melepas elemen daftar.
- **Tema Global**: Tampilan aplikasi dapat disesuaikan menggunakan tema yang terintegrasi.

---

## 📁 Struktur Proyek

### **`main.dart`**
- Entry point aplikasi.
- Mengatur tema aplikasi.
- Mendefinisikan `MultiProvider` untuk manajemen status global.

### **`advanced_counter.dart`**
- Widget utama untuk daftar penghitung global.
- Mendukung:
  - Pengeditan label.
  - Pemilihan warna.
  - Pengelolaan nilai penghitung (tambah/kurang).
  - Drag-and-drop dengan **ReorderableListView**.

### **`global_state.dart`**
- Model status global untuk penghitung.
- Mengelola daftar penghitung (`_counters`) dan menyediakan fungsi untuk:
  - Menambah/menghapus penghitung.
  - Mengubah label dan warna penghitung.
  - Menambah/mengurangi nilai penghitung.

### **`local_counter.dart`**
- Contoh implementasi penghitung lokal.
- Berguna untuk membandingkan pendekatan status global vs lokal.

---

## 🔧 Pendekatan yang Digunakan

### 1. **Manajemen Status Global dengan Provider**
- Menggunakan **ChangeNotifier** untuk mengelola status aplikasi secara reaktif.
- Membuat seluruh komponen dapat berbagi status tanpa perlu mengoper data antar-widget.

### 2. **Widget Reusable**
- `AdvancedCounter` sebagai widget utama untuk menampilkan dan mengelola daftar penghitung.
- `LocalCounter` sebagai widget independen untuk penghitung lokal.

### 3. **Penggunaan Tema Global**
- **`ThemeData`** mengatur:
  - Warna utama aplikasi.
  - Warna tombol dan gaya teks.
  - Bentuk kartu penghitung.

### 4. **Dialog Interaktif**
- Menggunakan **AlertDialog** untuk pengeditan properti penghitung (label dan warna).
- Memberikan pengalaman pengguna yang lebih dinamis dan responsif.

---

## 🚀 Cara Menjalankan Aplikasi

1. **Clone repositori ini**:
   ```bash
   git clone https://github.com/username/project-name.git

2. **Navigasi ke direktori proyek**:
   ```bash
   gcd project-name

3. **Instal dependensi**:
   ```bash
   flutter pub get

4. **Jalankan aplikasi**:
   ```bash
   flutter run

## 🛠 Teknologi yang Digunakan
- **Flutter** : Framework untuk pengembangan aplikasi lintas platform.
- **Provider** : Library untuk manajemen status reaktif.

## 🤝 Credited by
Proyek ini dikembangkan oleh **Alvin Yuga Pramana**.
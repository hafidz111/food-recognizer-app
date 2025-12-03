# 🍔 Food Recognizer App
Aplikasi Flutter yang dapat mengambil gambar dari galeri, memotong gambar (crop), melakukan identifikasi makanan menggunakan model Machine Learning **TensorFlow Lite**, serta menampilkan hasil prediksi beserta confidence score dan informasi makanan dari sumber eksternal.

---

## 🖼️ Tampilan Aplikasi
Food Recognizer App
![Food Recognizer App](https://github.com/user-attachments/assets/646733d8-d6f6-4e72-a30f-b8df5e461870)

---

# 📱 Fitur Utama

## 1️⃣ Fitur Pengambilan Gambar  
Aplikasi menyediakan fitur untuk mengambil dan memilih gambar menggunakan **image_picker**.

### ✔ Implementasi:
- Mengambil gambar dari **kamera**.
- Memilih gambar dari **galeri**.
- Menampilkan gambar terpilih pada halaman aplikasi.
- Memotong gambar menggunakan **image_cropper** untuk fokus pada objek makanan.
- UI menampilkan preview gambar sebelum diproses.

### 🔧 Teknologi:
- `image_picker`
- `image_cropper`

---

## 2️⃣ Fitur Machine Learning (ML Integration)

Aplikasi mampu melakukan klasifikasi makanan berdasarkan gambar menggunakan model **TensorFlow Lite** (TFLite) dan framework **LiteRT**.

### ✔ Implementasi:
- Menggunakan model *food classifier* yang telah disediakan.
- Melakukan inferensi gambar menggunakan **TensorFlow Lite**.
- Inferensi dapat:
  - dilakukan setelah gambar dipilih, atau  
  - dilakukan secara **real-time** menggunakan camera feed.
- Proses inferensi dijalankan menggunakan **Isolate**, agar UI tetap smooth dan tidak freeze.
- Output inferensi berupa:
  - **Nama makanan**
  - **Confidence score (dalam persen)**

### 🔧 Teknologi:
- `tflite_flutter` / LiteRT
- `tflite_flutter_helper`
- Dart `Isolate`  
- TensorFlow Lite model (.tflite)

---

## 3️⃣ Halaman Prediksi (Detail Information Page)

Setelah gambar berhasil diproses oleh ML model, pengguna diarahkan ke halaman detail prediksi.

### ✔ Informasi yang ditampilkan:
- 📷 Gambar makanan dari pengguna (hasil kamera/galeri/crop)
- 🍽 Nama makanan hasil inferensi
- 🎯 Confidence score hasil prediksi
- 🌐 Informasi makanan dari **API eksternal**, seperti:
  - deskripsi
  - asal makanan
  - kalori / nutrisi (jika tersedia)
  - fakta menarik

### 🎨 Kriteria desain:
- Layout sederhana dan mudah dibaca.
- Menampilkan data dengan jelas dalam bentuk card atau section rapi.
- Menggunakan loading indicator saat API dipanggil.

---

# 🚀 Instalasi & Menjalankan Aplikasi

## 1. Clone Repository
```bash
git clone https://github.com/hafidz111/food-recognizer-app.git
cd food-recognizer-app
```

### 2. Jalankan Aplikasi
```bash
flutter pub get
flutter run
```

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koperasi Sekolah',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ==========================
    // DATA BARANG
    // ==========================
    String namaBarang = "Buku Tulis";
    String kategori = "makanan";

    double hargaAnggota = 3000;
    double hargaUmum = 3500;

    // ==========================
    // UBAH NILAI INI UNTUK UJI
    // ==========================
    bool anggota = true;
    double totalBelanja = 250000;

    // Menentukan harga
    String jenisHarga;
    double harga;

    if (anggota) {
      harga = hargaAnggota;
      jenisHarga = "Anggota";
    } else {
      harga = hargaUmum;
      jenisHarga = "Umum";
    }

    // Menentukan potongan
    double persenPotongan = 0;

    if (totalBelanja > 200000) {
      persenPotongan = 10;
    } else if (totalBelanja > 100000) {
      persenPotongan = 5;
    } else {
      persenPotongan = 0;
    }

    double potongan = totalBelanja * persenPotongan / 100;
    double hargaAkhir = totalBelanja - potongan;

    // Menentukan rak
    String rak;

    switch (kategori) {
      case "atk":
        rak = "Rak 1";
        break;
      case "makanan":
        rak = "Rak 2";
        break;
      case "minuman":
        rak = "Rak 3";
        break;
      default:
        rak = "Rak lain";
    }

    // Output ke Debug Console
    print("=== TRANSAKSI KOPERASI ===");
    print("Harga : $jenisHarga");
    print("Total : Rp$totalBelanja");
    print("Potongan : $persenPotongan%");
    print("Harga Akhir : Rp$hargaAkhir");
    print("Kategori : $rak");

// ==========================
// DAFTAR BARANG
// ==========================
List<String> daftarBarang = [
  "Buku Tulis",
  "Pulpen",
  "Penghapus",
  "Roti",
];

List<int> daftarHarga = [
  3000,
  2500,
  1500,
  5000,
];

print("=== DAFTAR BARANG ===");

for (int i = 0; i < daftarBarang.length; i++) {
  print("${i + 1}. ${daftarBarang[i]} - Rp. ${daftarHarga[i]}");
}

// ==========================
// PENJUALAN BUKU TULIS
// ==========================
int stok = 3;

print("--- Penjualan Buku Tulis ---");

while (stok > 0) {
  stok--;
  print("Terjual 1, sisa stok: $stok");
}

     return Scaffold(
      appBar: AppBar(
        title: const Text("Koperasi Sekolah"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "=== TRANSAKSI KOPERASI ===",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Text("Nama Barang : $namaBarang"),
            Text("Kategori : $kategori"),
            Text("Lokasi Rak : $rak"),
            Text("Status Anggota : ${anggota ? "Ya" : "Tidak"}"),
            Text("Harga Satuan : Rp${harga.toStringAsFixed(0)}"),
            Text("Total Belanja : Rp${totalBelanja.toStringAsFixed(0)}"),
            Text("Potongan : ${persenPotongan.toStringAsFixed(0)}%"),
            Text(
              "Harga Akhir : Rp${hargaAkhir.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Menggunakan switch lebih rapi daripada banyak if karena
// hanya memeriksa satu variabel (kategori), sehingga kode
// lebih mudah dibaca dan mudah ditambah jika ada kategori baru.

//"Bahaya apa yang muncul bila kondisi berhenti pada while keliru, dan bagaimana cara untuk memastikan koperasi tidak menjual melebihi stok?"
// Bahaya jika kondisi berhenti pada while keliru adalah perulangan dapat
// terus berjalan atau stok menjadi minus sehingga koperasi menjual barang
// melebihi jumlah yang tersedia. Untuk mencegahnya, gunakan kondisi
// while (stok > 0) agar penjualan berhenti tepat saat stok mencapai 0.

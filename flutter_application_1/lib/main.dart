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
    // Data barang
    String namaBarang = "Buku Tulis";
    String kategori = "atk";
    double hargaAnggota = 3000.0;
    double hargaUmum = 3500.0;

    // Data pembelian
    bool anggota = true;
    int jumlah = 70;

    // Menentukan harga
    double harga;
    if (anggota) {
      harga = hargaAnggota;
    } else {
      harga = hargaUmum;
    }

    // Menghitung total
    double total = harga * jumlah;

    // Potongan
    double potongan = 0;

    if (total > 200000) {
      potongan = total * 0.10;
    } else if (total > 100000) {
      potongan = total * 0.05;
    }

    double hargaAkhir = total - potongan;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi Koperasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "=== TRANSAKSI KOPERASI ===",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text("Nama Barang : $namaBarang"),
            Text("Kategori : $kategori"),
            Text("Lokasi Rak : $rak"),
            Text("Status Anggota : $anggota"),
            Text("Harga Satuan : Rp${harga.toStringAsFixed(1)}"),
            Text("Jumlah : $jumlah"),
            Text("Total : Rp${total.toStringAsFixed(1)}"),
            Text("Potongan : Rp${potongan.toStringAsFixed(1)}"),
            Text("Harga Akhir : Rp${hargaAkhir.toStringAsFixed(1)}"),
          ],
        ),
      ),
    );
  }
}

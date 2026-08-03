import 'package:flutter/material.dart';

void main() {
  // Data barang
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int stok = 40;
  bool tersedia = true;

  // Jumlah yang dibeli
  int jumlah = 3;

  // Perhitungan
  double totalAnggota = jumlah * hargaAnggota;
  double totalUmum = jumlah * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  // Output
  print("=== KARTU DATA BARANG ===");
  print("Nama : $namaBarang");
  print("Harga Anggota : Rp${hargaAnggota.toStringAsFixed(1)}");
  print("Harga Umum : Rp${hargaUmum.toStringAsFixed(1)}");
  print("Stok : $stok");
  print("Tersedia : $tersedia");
  print("Total (anggota) $jumlah pcs: Rp${totalAnggota.toStringAsFixed(1)}");
  print("Selisih vs umum : Rp${selisih.toStringAsFixed(1)}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Barang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String namaBarang = 'Buku Tulis';
    const double hargaAnggota = 3000.0;
    const double hargaUmum = 3500.0;
    const int stok = 40;
    const bool tersedia = true;
    const int jumlah = 3;
    final double totalAnggota = jumlah * hargaAnggota;
    final double totalUmum = jumlah * hargaUmum;
    final double selisih = totalUmum - totalAnggota;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartu Data Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Barang',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('Nama: $namaBarang'),
            Text('Harga Anggota: Rp${hargaAnggota.toStringAsFixed(1)}'),
            Text('Harga Umum: Rp${hargaUmum.toStringAsFixed(1)}'),
            Text('Stok: $stok'),
            Text('Tersedia: $tersedia'),
            const SizedBox(height: 16),
            Text('Jumlah dibeli: $jumlah pcs'),
            Text('Total anggota: Rp${totalAnggota.toStringAsFixed(1)}'),
            Text('Selisih vs umum: Rp${selisih.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}

  
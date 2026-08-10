import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Fungsi menghitung total harga
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Fungsi menghitung harga akhir setelah potongan
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

// ======================================
// CLASS BARANG
// ======================================
class Barang {
  String nama;
  double harga;
  int stok;
  String kategori;

  // Konstruktor
  Barang(this.nama, this.harga, this.stok, this.kategori);


  // Method menampilkan kartu barang
  void tampilkan() {
    print("=== KARTU BARANG ===");
    print("Nama : $nama");
    print("Harga : Rp$harga");
    print("Stok : $stok");
    print("Kategori : $kategori");
    print("=====================");
  }
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
    Barang bukuTulis = Barang("Buku Tulis", 3000, 20, "atk");
    Barang pulpen = Barang("Pulpen", 2500, 30, "atk" );
    Barang roti = Barang("Roti", 5000, 15, "makanan");
    
    // Menampilkan kartu setiap barang
    bukuTulis.tampilkan();
    pulpen.tampilkan();
    roti.tampilkan();
    
    String namaBarang = bukuTulis.nama;
    double hargaAnggota = bukuTulis.harga;
    double hargaUmum = 3500;

    // ==========================
    // DATA TRANSAKSI
    // ==========================
    bool anggota = true;
    int jumlah = 70;

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

    // Menggunakan fungsi hitungTotal()
    // Ini adalah SATU-SATUNYA sumber "total belanja" dalam transaksi ini,
    // supaya potongan & harga akhir selalu konsisten dengan total riil.
    double total = hitungTotal(jumlah, harga);

    // Menentukan potongan borongan berdasarkan hasil hitungTotal()
    double persenPotongan;

    if (total > 200000) {
      persenPotongan = 10;
    } else if (total > 100000) {
      persenPotongan = 5;
    } else {
      persenPotongan = 0;
    }

    // Menggunakan fungsi hitungHargaAkhir() dengan total yang sama
    double hargaAkhir = hitungHargaAkhir(total, persenPotongan);

    double potongan = total - hargaAkhir;
    // =====================
    // Menentukan rak
    // =====================

    String kategori = bukuTulis.kategori;
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

    // ==========================
    // DEBUG CONSOLE
    // ==========================

    print("=== TRANSAKSI KOPERASI ===");
    print("Harga : $jenisHarga");
    print("Total Belanja : Rp$total");
    print("Potongan : $persenPotongan%");
    print("Harga Akhir : Rp$hargaAkhir");
    print("Kategori : $rak");

    print("");
    print("=== PERHITUNGAN TOTAL ===");
    print("Jumlah : $jumlah");
    print("Harga : Rp$harga");
    print("Total : Rp$total");

    print("");
    print("=== PERHITUNGAN HARGA AKHIR ===");
    print("Total Belanja : Rp$total");
    print("Potongan : Rp$potongan");
    print("Harga Akhir : Rp$hargaAkhir");

    // ==========================
    // DAFTAR OBJEK BARANG
    // ==========================

      List<Barang> daftarBarang = [
      Barang("Buku Tulis", 3000, 20, "atk"),
      Barang("Pulpen", 2500, 30, "atk"),
      Barang("Penghapus", 1500, 25, "atk"),
      Barang("Roti", 5000, 15, "makanan"),
    ];

    List<int> daftarHarga = [
      3000,
      2500,
      1500,
      5000,
    ];
    // Menampilkan seluruh barang menggunakan perulangan
    print("");
    print("=== DAFTAR BARANG ===");

    for (int i = 0; i < daftarBarang.length; i++) {
    print(
    "${i + 1}. ${daftarBarang[i].nama} "
    "- Rp${daftarBarang[i].harga} "
    "- Stok: ${daftarBarang[i].stok} "
    "- Kategori: ${daftarBarang[i].kategori}",
  );
}
    // ==========================
    // WHILE
    // ==========================

    int stok = 3;

    print("");
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
              "TRANSAKSI KOPERASI",
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
            Text("Jumlah : $jumlah"),
            Text("Total : Rp${total.toStringAsFixed(0)}"),
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
// hanya memeriksa satu variabel (kategori),
// sehingga kode lebih mudah dibaca dan ditambah jika ada kategori baru.

// Bahaya jika kondisi while keliru adalah perulangan bisa terus berjalan
// atau stok menjadi minus. Gunakan kondisi while (stok > 0)
// agar penjualan berhenti tepat saat stok habis.

//Pemecahan program menjadi fungsi membuat kode lebih mudah dirawat dan diubah.
//Jika aturan potongan koperasi berubah di kemudian hari, 
//kita hanya perlu mengubah logika perhitungan pada fungsi hitungHargaAkhir() 
//atau bagian yang menentukan persenPotongan, tanpa mengubah bagian lain dari program.

// Memindahkan keputusan ke fungsi mengurangi risiko salah karena
// aturan penentuan harga hanya ditulis di satu tempat. Jika aturan
// berubah, cukup mengubah fungsi hitungHarga() tanpa mencari dan
// mengubah kode di banyak bagian program.

// PERBANDINGAN DENGAN SPRINT 3:
// Pada Sprint 3, data barang di simpan dalam variabel/ list yang terpisah,
// sehingga nama, harga, dan stok lebih sulit dikelola.
// Sekarang dengan class Barang, nama, harga, stok, dan kategori
// berada dalam satu objek. Semua objek juga dapat disimpan dalam
// satu List<Barang> dan ditampilkan dengan perulangan.

//LKPD-5 OOP
// Keuntungan memodelkan barang sebagai objek adalah data seperti nama,
// harga, stok, dan kategori menjadi satu kesatuan sehingga kode lebih rapi.
// Jika sistem koperasi berkembang, barang lebih mudah ditambah, diubah,
// dan dikembangkan dengan method baru tanpa membuat banyak variabel terpisah.
// Dengan begitu, program lebih mudah dirawat dan mengurangi risiko kesalahan.

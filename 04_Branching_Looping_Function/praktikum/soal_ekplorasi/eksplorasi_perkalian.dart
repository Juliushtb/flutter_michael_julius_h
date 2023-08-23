void main() {
  int baris = 9; // Jumlah baris dalam tabel perkalian
  int kolom = 9; // Jumlah kolom dalam tabel perkalian

  // Mencetak header kolom
  print("Tabel Perkalian:");

  // Mencetak baris header
  print("  |" + "".padRight(5) + "|" + "  ".padRight(5)); // Spasi untuk header kolom
  print("".padRight(7, "-")); // Garis pemisah

  // Mencetak isi tabel perkalian
  for (int i = 1; i <= baris; i++) {
    String barisStr = "$i |"; // Inisialisasi baris dengan nomor baris
    for (int j = 1; j <= kolom; j++) {
      int hasil = i * j;
      barisStr += " ${hasil.toString().padLeft(4)}"; // Menambahkan hasil perkalian ke baris
    }
    print(barisStr);
  }
}



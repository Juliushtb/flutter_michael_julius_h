void main() {
  // Menghitung luas lingkaran dengan jari jari 10
  double radius = 10;
  double luasLingkaran = hitungLuasLingkaran(radius);
  print("Luas lingkaran dengan jari-jari $radius adalah: $luasLingkaran");

  // Menampilkan faktorial
  print("Faktorial dari 10 adalah: ${faktorial(10)}");
  print("Faktorial dari 40 adalah: ${faktorial(40)}");
  print("Faktorial dari 50 adalah: ${faktorial(50)}");
}

// Fungsi untuk menghitung luas lingkaran
double hitungLuasLingkaran(double radius) {
  return 3.14 * radius * radius;
}

// Fungsi untuk menghitung faktorial
int faktorial(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * faktorial(n - 1);
  }
}
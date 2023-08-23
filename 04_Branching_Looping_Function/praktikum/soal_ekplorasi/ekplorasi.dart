void main() {
  int angka = 18; // Ganti dengan angka yang ingin Anda periksa

  if (isPrime(angka)) {
    print("$angka adalah bilangan prima.");
  } else {
    print("$angka bukan bilangan prima.");
  }
}

// Fungsi untuk memeriksa apakah suatu bilangan adalah bilangan prima
bool isPrime(int number) {
  if (number <= 1) {
    return false; // Angka negatif, nol, dan satu bukan bilangan prima
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false; // Bukan bilangan prima jika bisa dibagi dengan bilangan lain selain 1 dan dirinya sendiri
    }
  }

  return true; // Jika tidak ada pembagi selain 1 dan dirinya sendiri, itu adalah bilangan prima
}

 
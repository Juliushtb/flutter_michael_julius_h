class Calculator {
  // Method untuk melakukan penjumlahan dua bilangan
  double add(double a, double b) {
    return a + b;
  }

  // Method untuk melakukan pengurangan dua bilangan
  double subtract(double a, double b) {
    return a - b;
  }

  // Method untuk melakukan perkalian dua bilangan
  double multiply(double a, double b) {
    return a * b;
  }

  // Method untuk melakukan pembagian dua bilangan
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Pembagian dengan nol tidak diizinkan');
    }
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();

  double angka1 = 10;
  double angka2 = 5;

  // Contoh penggunaan method di dalam kelas Calculator
  print('Penjumlahan: ${angka1} + ${angka2} = ${calculator.add(angka1, angka2)}');
  print('Pengurangan: ${angka1} - ${angka2} = ${calculator.subtract(angka1, angka2)}');
  print('Perkalian: ${angka1} * ${angka2} = ${calculator.multiply(angka1, angka2)}');

  try {
    print('Pembagian: ${angka1} / ${angka2} = ${calculator.divide(angka1, angka2)}');
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
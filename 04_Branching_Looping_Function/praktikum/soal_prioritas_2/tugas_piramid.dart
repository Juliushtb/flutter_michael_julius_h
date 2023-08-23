 import 'dart:io';

void main() {
  int tinggiPiramida = 8; // Ganti dengan tinggi piramida yang Anda inginkan

  for (int i = 1; i <= tinggiPiramida; i++) {
    // Mencetak spasi sebelum bintang

    for (int j = 1; j <= tinggiPiramida - i; j++) {
      stdout.write(" ");
    }

    // Mencetak bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    print("");
  }
}

import 'dart:io';
void main() {
  int tinggiJamPasir = 8; // Ganti dengan tinggi jam pasir yang Anda inginkan

  // Bagian atas jam pasir 
   for (int i = tinggiJamPasir ; i >= 1; i--){
    // Mencetak spasi sebelum angka 0
    for (int j = 1; j <= tinggiJamPasir - i; j++) 
    {
        stdout.write(" ");
    }

    // Mencetak angka 0
    for (int k = 1; k <= 2 * i - 1; k++) 
   // for (int k = i; k <= tinggiJamPasir + 2 ; k++)
   {
        stdout.write("0");
    }
    //for (int k = i; k <= tinggiJamPasir; k++)
    // Pindah ke baris berikutnya
     print("");
  }


  // Bagian bawah jam pasir
  for (int i = 1; i <= tinggiJamPasir; i++) {
    // Mencetak spasi sebelum angka 0
    for (int j = 1; j <= tinggiJamPasir - i; j++) {
       stdout.write(" ");
    }

    // Mencetak angka 0
    //for (int k = i; k <= tinggiJamPasir + 2; k++)
    for (int k = 1; k <= 2 * i - 1; k++) {
       stdout.write("0");
    }

    // Pindah ke baris berikutnya
    print("");
  }
}
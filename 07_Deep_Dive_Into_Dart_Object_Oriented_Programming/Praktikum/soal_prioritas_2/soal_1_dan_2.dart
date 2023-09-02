class Matematika {
  int hasil(int x, int y) {
    int kpk = (x * y) ~/ fpb(x, y); // Memanggil metode fpb dengan benar
    int fpbValue = fpb(x, y); // Memanggil metode fpb dengan benar
    
    print('KPK dari $x dan $y adalah $kpk');
    print('FPB dari $x dan $y adalah $fpbValue'); // Menggunakan fpbValue yang sudah dihitung

    return kpk;
  }

  int fpb(int a, int b) {
    if (b == 0) {
      return a;
    } else {
      return fpb(b, a % b);
    }
  }
}

void main() {
  Matematika matematika = Matematika();
  int x = 15;
  int y = 20;

  int kpkDanFpb = matematika.hasil(x, y);
  print('Hasil KPK adalah: $kpkDanFpb');
}
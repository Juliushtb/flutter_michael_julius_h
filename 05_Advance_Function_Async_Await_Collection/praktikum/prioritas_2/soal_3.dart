import 'dart:io';
Future <BigInt> factorial(int n) async{
  BigInt Hasil = BigInt.one;
  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1)); //perhitungannya ditunggu atau await selama 1 detik
    Hasil *= BigInt.from(i);
  }
  return Hasil;
}


void main() async{
  stdout.write("Masukkan bilangan: ");
  int bilangan = int.parse(stdin.readLineSync()!);

   if (bilangan < 0) {
    print("Faktorial hanya bisa untuk bilangan non-negatif.");//menampilkan pesan ini tidak ditunggu 
  } else {
    BigInt Hasil = await factorial(bilangan);
    print(await "Faktorial dari $bilangan! = $Hasil.");//menampilkan hasilnya akan ditunggu menggunakan wait
  }
}
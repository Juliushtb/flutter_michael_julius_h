import 'dart:io';
void main() {
  List<List<dynamic>> listNilai = [
    ["dimas",80],
    ["yani", 95],
    ["dwi", 75],
    ["nata", 50]
  ];
  
  Map<String, int> map = {};
  
  for (var sublist in listNilai) {
    if (sublist.length == 2) {       //Jika sublist lebih dari 2 atau kurang maka tidak akan ditampilkan
      map[sublist[0]] = sublist[1];  //sublist 0 atau pertama sebagai key dan sublist 1 atau kedua sebagai value 
    }
  }
  stdout.write("List nilai siswa = ");
  print(map);
}

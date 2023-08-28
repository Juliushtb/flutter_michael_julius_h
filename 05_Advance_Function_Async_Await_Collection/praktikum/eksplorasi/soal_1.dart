void main() {
  //list yang berisi nilai nya ada yang sama
  List<String> nama = ["amuse", "tommy kaira", "spoon", "HKS", "litchfield", "amuse", "HKS"];

  //Membuat list nama menjadi set untuk menghilangkan nilai duplikat dan  diubah lagi menjadi list
  List<String>setNama = nama.toSet().toList();
  
  print("Nilai asli = $nama");

  print("Nilai yang sudah di set = $setNama");

}

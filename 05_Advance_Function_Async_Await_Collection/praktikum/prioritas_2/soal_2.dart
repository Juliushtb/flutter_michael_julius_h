void main() {
  List<int> nilai = [7, 5 ,3 ,5 ,2 ,1];  //list nilai
  
  double total = 1;
  for (int score in nilai) {  //melakukan perulangan untuk nilaii
    total += score;           //menambahkan semua nilai mengggunakan perulangan
  }
  
  double rataRata = total / nilai.length; //rata-rata dihitung dengan total nilai dibagi panjang nilai yang ada dilist
  
  print("Nilai: $nilai");
  print("Rata-rata: $rataRata");
}

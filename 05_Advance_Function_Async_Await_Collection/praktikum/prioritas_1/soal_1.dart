Future<List<int>> pengaliListdata(List<int> ListData, int pengali) async {
  List<int> ListBaru = [];
  for (int i = 0; i < ListData.length; i++) {
    // Menunggu sebelum menambahkan elemen baru ke dalam hasil
    await Future.delayed(Duration(seconds: 1));
    ListBaru.add(ListData[i] * pengali);
  }
  return ListBaru;
}

Future<void> main() async {
  List<int> list = [2, 3, 4, 5, 6];
  int pengali = 2;

  print("List awal: $list");
  List<int> pengalilist = await pengaliListdata(list, pengali);//menunggu selama 1 seconds untuk menampilkan pengalilist
  print("List setelah dikali: $pengalilist");
}

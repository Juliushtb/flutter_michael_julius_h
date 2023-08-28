import 'dart:io';

void main() {
  List<String> dataList = ["js","js","js","golang","python","js","js","golang","rust"];
  
  Map<String, int> hitungData = {};
  
  for (String data in dataList) {
    
    hitungData[data] = (hitungData[data]?? 0) + 1;//data akan ditambahkan 1
  }
  
  print("Data List: $dataList");
  stdout.write("Jumlah Kemunculan: ");
  
  //Perulangan berfungsi key disimpan varibel data dan valuenya akan di simpan di count

  hitungData.forEach((data, jumlah) {

    stdout.write("$data: $jumlah, ");
  });
}
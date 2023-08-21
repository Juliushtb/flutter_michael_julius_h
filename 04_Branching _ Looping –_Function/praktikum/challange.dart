//1. buatlah  function untuk  menghitung jumlah barang yang  kita  beli  dari sebuah toko
//var buku = 10000;
//var pensil = 5000;
//var tas = 100000;
//2.  hitunglah  diskon 10%  dari  jumlah  
//3. hitunglah  harga yang harus di bayar oleh kita

// soal 1
void main() {
  var buku = 10000;
  var pensil = 5000;
  var tas = 100000;

  var jumlahBeliBuku = 3;
  var jumlahBeliPensil = 5;
  var jumlahBeliTas = 2;

  var totalBelanja = hitungTotalBelanja(buku, pensil, tas, jumlahBeliBuku, jumlahBeliPensil, jumlahBeliTas);

  print('Total belanja Anda adalah: ${totalBelanja.toStringAsFixed(2)}');
}

int hitungTotalBelanja(int hargaBuku, int hargaPensil, int hargaTas, int jumlahBeliBuku, int jumlahBeliPensil, int jumlahBeliTas) {
  var totalBuku = hargaBuku * jumlahBeliBuku;
  var totalPensil = hargaPensil * jumlahBeliPensil;
  var totalTas = hargaTas * jumlahBeliTas;

  var totalBelanja = totalBuku + totalPensil + totalTas;

  return totalBelanja;
}
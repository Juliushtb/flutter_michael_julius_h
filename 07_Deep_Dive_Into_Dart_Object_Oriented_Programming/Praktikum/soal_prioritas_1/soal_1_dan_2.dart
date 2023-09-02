class BangunRuang {
  double volume() {
    return 0;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  BangunRuang kubus = Kubus(8.0);
  BangunRuang balok = Balok(5.0, 4.0, 6.0);

  // Memanggil metode volume() pada objek Kubus dan Balok
  double volumeKubus = kubus.volume();
  double volumeBalok = balok.volume();

  print('Volume Kubus: $volumeKubus');
  print('Volume Balok: $volumeBalok');
}



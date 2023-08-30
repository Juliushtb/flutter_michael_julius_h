
class   Mobil {

    var kapasitas = 200;
    var muatan = 100;
    void tambah_muatan (){
      print('penuh');
    }
}

void main () {

    var h1 = Mobil( );

    print  (h1.kapasitas);

    print (h1.muatan);

    var h2 = Mobil( );
    h2.tambah_muatan();

}
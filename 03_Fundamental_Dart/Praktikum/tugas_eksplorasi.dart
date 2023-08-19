import 'dart:io';
void main(){
print('Masukan kata atau angka');
    String? KataAsli =  stdin.readLineSync();
    
    String?  KataKebalik = KataAsli!.split('').reversed.join('');

      if(KataAsli == KataKebalik)
    {
      print('Palindrom');
    }else{
      print('Bukan Palindrom');
    }

  print("   ");
  var i,angka;  
  angka = 24;
  for(i=1; i <= angka; i++){
    // sisa bagi = 0 maka termasuk faktor
    if (angka % i == 0) { 
      print(i);
    }
  }
 
}
import 'package:flutter/material.dart';

class Contact {
  String nama;
  String nomor;
  Contact({
    required this.nama,
    required this.nomor,
  });
}

class ContactProvider with ChangeNotifier {
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  int selectedindex = 0;
  List<Contact> contactList = List.empty(growable: true);

  ///Function untuk menghapus kontak
  void deleteContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  ///Function untuk menambah kontak
  void nambahcontact() {
    String nama = namaController.text.trim();
    String nomor = nomorController.text.trim();
    if (nama.isNotEmpty && nomor.isNotEmpty) {
      namaController.text = "";
      nomorController.text = "";
      contactList.add(Contact(
        nama: nama,
        nomor: nomor,
      ));
    }
    notifyListeners();
  }

  ///Function untuk edit contact
  void editcontact() {
    String nama = namaController.text.trim();
    String nomor = nomorController.text.trim();
    if (nama.isNotEmpty && nomor.isNotEmpty) {
      namaController.text = '';
      nomorController.text = '';
      contactList[selectedindex].nama = nama;
      contactList[selectedindex].nomor = nomor;
      selectedindex = 0;
    }
    notifyListeners();
  }

  Widget listContact(int index) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.cyan,
          child: Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contactList[index].nama,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(contactList[index].nomor),
          ],
        ),
        trailing: SizedBox(
          width: 60,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    namaController.text = contactList[index].nama;
                    nomorController.text = contactList[index].nomor;
                    selectedindex = index;
                  },
                  child: const Icon(Icons.edit)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: (() {
                    deleteContact(index);
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutusProvider with ChangeNotifier {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController direction = TextEditingController();
  final List<String> items = [
    'Pisang',
    'Labu',
    'Jambu',
    'Anggur',
    'Semangka',
  ];

  void button() {
    debugPrint("Nama : ${nama.text}");
    debugPrint("Email : ${email.text}");
    debugPrint("Keluhan : ${direction.text}");
    nama.text = "";
    email.text = "";
    direction.text = "";

    notifyListeners();
  }
}

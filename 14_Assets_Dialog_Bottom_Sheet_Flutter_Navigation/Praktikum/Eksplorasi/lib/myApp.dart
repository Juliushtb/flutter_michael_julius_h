// ignore: file_names
import 'package:flutter/material.dart';
import 'package:prioritas_1/contactPage.dart';
import 'package:prioritas_1/detailGaleri.dart/detailyoii.dart';
import 'package:prioritas_1/detailGaleri.dart/detailApa.dart';
import 'package:prioritas_1/detailGaleri.dart/detailCat.dart';
import 'package:prioritas_1/detailGaleri.dart/detailHamster.dart';
import 'package:prioritas_1/detailGaleri.dart/detailTes.dart';
import 'package:prioritas_1/galeriPage.dart';

import 'berandaPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BeerandaPage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/galeri': (context) => const GaleriPage(title: 'Galeri Page'),
        '/contact': (context) => const ContactPage(title: 'Contact Page'),
        '/apa': (context) => const DetailApa(),
        '/yoii': (context) => const DetailAyang(),
        '/cat': (context) => const DetailCat(),
        '/hamster': (context) => const DetailHamster(),
        '/tes': (context) => const DetailTes(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

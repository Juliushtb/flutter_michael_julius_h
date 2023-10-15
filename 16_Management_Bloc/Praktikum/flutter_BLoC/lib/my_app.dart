import 'package:flutter/material.dart';
import 'package:prioritas_1/detailGaleri/detailYoii.dart';
import 'package:prioritas_1/detailGaleri/detailApa.dart';
import 'package:prioritas_1/detailGaleri/detailCat.dart';
import 'package:prioritas_1/detailGaleri/detailHamster.dart';
import 'package:prioritas_1/detailGaleri/detailTes.dart';
import 'package:prioritas_1/screen/galeriPage.dart';
import 'package:prioritas_1/screen/contact_screen.dart';

import 'screen/berandaPage.dart';

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
        '/contact': (context) => const ContactScreen(),
        '/apa': (context) => const DetailApa(),
        '/yoii': (context) => const DetailYoii(),
        '/cat': (context) => const DetailCat(),
        '/hamster': (context) => const DetailHamster(),
        '/tes': (context) => const DetailTes(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prioritas_1/contactPage.dart';
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
        '/contact': (context) => const ContactPage(title: 'Contact Page')
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

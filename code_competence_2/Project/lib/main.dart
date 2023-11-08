import 'package:code_competence_2/provider/aboutus_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myapp.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => AboutusProvider())
  ], child: const MyApp()));
}

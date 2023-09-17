import'package:flutter/material.dart';
import './material_page.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.dark(background: const Color.fromARGB(255, 16, 15, 18)),
        useMaterial3: true,
      ),
    home: HomePage(),
    );

  }
}
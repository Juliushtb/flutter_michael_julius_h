import 'package:flutter/material.dart';
import 'package:prioritas_1/provider/provider.dart';
import 'package:prioritas_1/screens/dicebear.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DiceBearProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiceBear Avatar',
      home: DiceBearDisplay(),
    );
  }
}

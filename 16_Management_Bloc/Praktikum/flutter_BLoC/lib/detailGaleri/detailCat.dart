import 'package:flutter/material.dart';

class DetailCat extends StatefulWidget {
  const DetailCat({super.key});

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(child: Image.asset('assets/cat.jpeg')),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

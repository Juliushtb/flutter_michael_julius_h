import 'package:flutter/material.dart';

class DetailTes extends StatefulWidget {
  const DetailTes({super.key});

  @override
  State<DetailTes> createState() => _DetailTesState();
}

class _DetailTesState extends State<DetailTes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset('assets/tes.jpg'),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailYoii extends StatefulWidget {
  const DetailYoii({super.key});

  @override
  State<DetailYoii> createState() => _DetailYoiiState();
}

class _DetailYoiiState extends State<DetailYoii> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(child: Image.asset('assets/yoii.jpeg')),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

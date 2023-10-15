import 'package:flutter/material.dart';

class DetailApa extends StatefulWidget {
  const DetailApa({super.key});

  @override
  State<DetailApa> createState() => _DetailApaState();
}

class _DetailApaState extends State<DetailApa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(child: Image.asset('assets/apa.jpeg')),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

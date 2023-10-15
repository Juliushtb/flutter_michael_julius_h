import 'package:flutter/material.dart';

class DetailAyang extends StatefulWidget {
  const DetailAyang({super.key});

  @override
  State<DetailAyang> createState() => _DetailAyangState();
}

class _DetailAyangState extends State<DetailAyang> {
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

import 'package:flutter/material.dart';

class DetailHamster extends StatefulWidget {
  const DetailHamster({super.key});

  @override
  State<DetailHamster> createState() => _DetailHamsterState();
}

class _DetailHamsterState extends State<DetailHamster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(child: Image.asset('assets/hamster.jpeg')),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

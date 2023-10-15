import 'package:flutter/material.dart';

class BeerandaPage extends StatefulWidget {
  const BeerandaPage({super.key, required this.title});
  final String title;

  @override
  State<BeerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BeerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Contact Page"),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: const Text("Galeri Page"),
              onTap: () {
                Navigator.pushNamed(context, '/galeri');
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Title(
        color: Colors.black,
        child: const Text(
          "WELCOME TO HOMEPAGE",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}

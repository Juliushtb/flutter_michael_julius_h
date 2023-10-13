import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController direction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'WELCOME',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.home_sharp,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/social.png',
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "WELCOME TO HOMEPAGE",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          const SizedBox(height: 300),
          const Center(
            child: Text(
              "Kontak Kami",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Ingin menghubungi kami? isi form yang disediakan untuk berinteraksi dengan kami.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: nama,
              decoration: const InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: direction,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: "Apa yang bisa kamu bantu?",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint("Nama : ${nama.text}");
                  debugPrint("Email : ${email.text}");
                  debugPrint("Keluhan : ${direction.text}");
                  setState(() {
                    nama.text = "";
                    email.text = "";
                    direction.text = "";
                  });
                },
                child: const Text("kirim"),
              )
            ],
          ),
          const SizedBox(height: 150)
        ],
      ),
    );
  }
}

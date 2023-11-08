import 'package:code_competence_2/provider/aboutus_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key, required this.title});
  final String title;

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final aboutusprovider =
        Provider.of<AboutusProvider>(context, listen: false);
    final namacontroler = aboutusprovider.nama;
    final emailcontroler = aboutusprovider.email;
    final directioncontorler = aboutusprovider.direction;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'ABOUT US',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.home_sharp,
          color: Colors.white,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          // shrinkWrap: true,
          children: [
            ListTile(
              title: const Text("Contact Us"),
              leading: const Icon(Icons.phone),
              tileColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text("About Us"),
              leading: const Icon(Icons.person_2_sharp),
              tileColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text("Login"),
              leading: const Icon(Icons.login_outlined),
              tileColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  'assets/social.png',
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 50),
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
                    controller: namacontroler,
                    decoration: const InputDecoration(
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailcontroler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: directioncontorler,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Apa yang bisa kamu bantu?",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        aboutusprovider.button();
                      },
                      child: const Text("kirim"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "About Us",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text("List Item ")
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            ),
          ),
          aboutusprovider.items.isEmpty
              ? const Text(
                  "Kontak kosong",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: aboutusprovider.items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(aboutusprovider.items[index]),
                          onTap: () {
                            debugPrint(
                                'Anda menekan: ${aboutusprovider.items[index]}');
                          },
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

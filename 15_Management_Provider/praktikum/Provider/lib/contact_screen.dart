import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'provider/contact_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.title});
  final String title;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    Provider.of<ContactProvider>(context, listen: false).contactList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactprovider =
        Provider.of<ContactProvider>(context, listen: false);
    final namaControl = contactprovider.namaController;
    final nomorControl = contactprovider.nomorController;
    final list = contactprovider.contactList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "Contact",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.contact_phone_outlined,
          size: 30,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              "Create New Contact",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: namaControl,
              inputFormatters: [
                //User hanya bisa menginput huruf saja
                FilteringTextInputFormatter.allow(RegExp('[ a-zA-Z]')),
              ],
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_add_alt),
                filled: true,
                fillColor: Colors.cyan,
                labelText: "Name",
                hintText: "Insert Your Name",
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: nomorControl,
              inputFormatters: [
                //User hanya bisa menginput angka saja
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call),
                filled: true,
                fillColor: Colors.cyan,
                hintText: "+62 ....",
                labelText: "Nomor",
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
          Consumer<ContactProvider>(builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      provider.nambahcontact();
                    },
                    child: const Text(
                      "SUBMIT",
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        provider.editcontact();
                      },
                      child: const Text('Update')),
                ],
              ),
            );
          }),
          list.isEmpty
              ? const Text(
                  "Kontak kosong",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                )
              : Consumer<ContactProvider>(builder: (context, provider, _) {
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: provider.contactList.length,
                          itemBuilder: (context, index) =>
                              provider.listContact(index)));
                })
        ],
      ),
    );
  }
}

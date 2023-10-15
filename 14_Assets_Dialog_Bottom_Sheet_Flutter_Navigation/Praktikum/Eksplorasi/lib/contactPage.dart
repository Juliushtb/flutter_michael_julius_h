// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key, required this.title});
  final String title;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController datetimeController = TextEditingController();
  Color _currentColor = Colors.amber;
  TextEditingController colorController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  FilePickerResult? result;
  PlatformFile? file;

  int selectedIndex = -1;

  @override
  void initState() {
    datetimeController.text = " ";
    super.initState();
  }

  final List<Contact> contactList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.contact_phone_rounded),
          Padding(padding: EdgeInsets.only(right: 15))
        ],
        backgroundColor: Colors.cyan,
        title: const Text("Contacts"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Expanded(
                child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                const Icon(
                  Icons.phone_android_sharp,
                  size: 30,
                ),
                const Padding(padding: EdgeInsets.only(top: 9)),
                Title(
                  color: Colors.black,
                  child: const Text(
                    "Creat New Contacts",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  indent: 55,
                  endIndent: 55,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[ a-zA-Z]')),
                    ],
                    textCapitalization: TextCapitalization.words,
                    controller: namaController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(128, 150, 85, 183),
                        labelText: "Name",
                        hintText: "Insert Your Name",
                        border: UnderlineInputBorder()),
                    validator: (value) {
                      if (value!.split(" ").length < 2) {
                        return 'Masukan lebih dari 2 Kata';
                      } else if (value.isEmpty) {
                        return 'Masukan nama anda';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    keyboardType: TextInputType.phone,
                    controller: nomorController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(128, 150, 85, 183),
                        hintText: "+62 ....",
                        labelText: "Nomor",
                        border: UnderlineInputBorder()),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Masukan nomor lebih dari 8';
                      } else if (value.length > 15) {
                        return 'Nomor tidak boleh lebih dari 15';
                      } else if (value.startsWith("1")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("2")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("3")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("4")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("5")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("6")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("7")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("8")) {
                        return 'Harus diawali angka 0';
                      } else if (value.startsWith("9")) {
                        return 'Harus diawali angka 0';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: datetimeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Pilih tanggal";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Date",
                    icon: Icon(Icons.date_range_outlined),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050),
                    );
                    if (pickedDate != null) {
                      String formatDate =
                          DateFormat("dd-MMMM-yy").format(pickedDate);
                      setState(() {
                        datetimeController.text = formatDate;
                      });
                    } else {
                      datetimeController.text = "Masukan tanggal";
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Color",
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  color: _currentColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(_currentColor),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Pilih warna"),
                            content: BlockPicker(
                                pickerColor: _currentColor,
                                onColorChanged: (color) {
                                  setState(() {
                                    _currentColor = color;
                                  });
                                }),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("save"))
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "pick color",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Text("Pilih file"),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      result = await FilePicker.platform
                          .pickFiles(type: FileType.image, allowMultiple: true);
                      if (result == null) return;

                      file = result!.files.first;
                      _openFile(file!);
                      setState(() {});
                    },
                    child: const Text("Pilih dan buka file")),
                if (file != null) fileDetails(file!),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String Nama = namaController.text.trim();
                          String Nomor = nomorController.text.trim();
                          String Waktu = datetimeController.text.trim();
                          String color = _currentColor.toString();
                          if (Nama.isNotEmpty &&
                              Nomor.isNotEmpty &&
                              Waktu.isNotEmpty &&
                              color.isNotEmpty) {
                            setState(() {
                              namaController.text = " ";
                              nomorController.text = " ";
                              datetimeController.text = " ";
                              _currentColor = Color(_currentColor.value);
                              contactList.add(Contact(
                                nama: Nama,
                                nomor: Nomor,
                                waktu: Waktu,
                                warna: color,
                              ));
                            });
                          }
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text("Submit".toUpperCase())),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {
                          String Nama = namaController.text.trim();
                          String Nomor = nomorController.text.trim();
                          String Waktu = datetimeController.text.trim();
                          String color = _currentColor.toString();
                          if (Nama.isNotEmpty && Nomor.isNotEmpty) {
                            setState(() {
                              namaController.text = '';
                              nomorController.text = '';
                              datetimeController.text = " ";
                              _currentColor = Color(_currentColor.value);
                              contactList[selectedIndex].nama = Nama;
                              contactList[selectedIndex].nomor = Nomor;
                              contactList[selectedIndex].waktu = Waktu;
                              contactList[selectedIndex].warna = color;
                              selectedIndex = -1;
                            });
                          }
                          //
                        },
                        child: const Text('Update')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "List Contacts",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            )),
            contactList.isEmpty
                ? const Text(
                    "Kontak kosong",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  )
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contactList.length,
                        itemBuilder: (context, index) => listContact(index)))
          ],
        ),
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
        ],
      ),
    );
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Widget listContact(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(_currentColor.value),
          child: Text(
            contactList[index].nama[0],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contactList[index].nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contactList[index].nomor),
            Text('Date : ${contactList[index].waktu}'),
            Text('Color : ${contactList[index].warna}'),
            Text('file name : ${file!.name}')
          ],
        ),
        trailing: SizedBox(
          width: 60,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    namaController.text = contactList[index].nama;
                    nomorController.text = contactList[index].nomor;
                    datetimeController.text = contactList[index].waktu;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contactList.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  String nama;
  String nomor;
  String waktu;
  String warna;
  Contact({
    required this.nama,
    required this.nomor,
    required this.waktu,
    required this.warna,
  });
}

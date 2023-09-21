import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController datetimeController = TextEditingController();
  Color _currentColor = Colors.amber;
  TextEditingController colorController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                // FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
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
                String formatDate = DateFormat("dd-MMMM-yy").format(pickedDate);
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
                // _openFile(file!);
                setState(() {});
              },
              child: const Text("Pilih file")),
          ElevatedButton(
              onPressed: () {
                print(namaController.text);
                print(nomorController.text);
                print(datetimeController.text);
                print(_currentColor);
                print(file!.name);
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}

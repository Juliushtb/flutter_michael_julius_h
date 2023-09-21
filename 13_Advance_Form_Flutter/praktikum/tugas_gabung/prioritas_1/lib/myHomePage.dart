import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController datetimeController = TextEditingController();
  Color _currentColor = Colors.amber;
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Contacts"),
        centerTitle: true,
        leading: const Icon(Icons.contacts),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 20)),
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
                _openFile(file!);
                setState(() {});
              },
              child: const Text("Pilih dan buka file")),
          if (file != null) fileDetails(file!),
        ],
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
}

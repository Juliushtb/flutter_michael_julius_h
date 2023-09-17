import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 34, 35)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contacts'),
      title: 'Create New Contacs',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>();
  // String? name = "";
  // String? alamat = "";
  // String? email = "";

  // List<Data> dataList = [];
  String? radioValue = "";
  bool? checkValue = false;
  int? dropdownValue = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      
      body: Container(
        color :  Color.fromARGB(255, 238, 0, 159),
        margin: const EdgeInsets.all(20.0),
        child: Column(
         
          children: [
           
            TextField(
              
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                hoverColor : Color.fromARGB(255, 226, 11, 219),
                hintText: "Insert Your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "+62.....",
                hintText: " ",
                border: OutlineInputBorder(),
              ),
            ),
          
            
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data berhasil disimpan"),
                  ),
                );
              },
              child: Container(
                color : Color.fromARGB(255, 204, 80, 194),
                 width: 50.0,
                height: 20.0,
                child:  Text("Simpan"),
                  
                  
                  ),
                ),
              
            
          ],
        ),
      ),
    );
  }
}

// class Data {
//   String? name;
//   String? alamat;
//   String? email;

//   Data({this.name, this.alamat, this.email});
// }
// ignore: file_names
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image apa = const Image(image: AssetImage('assets/apa.jpeg'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.camera_alt_outlined),
        centerTitle: true,
        title: const Text("List Galeri"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: [
          GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.amber,
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.amber,
                            title: const Image(
                                image: AssetImage('assets/cat.jpeg')),
                            content: const Text(
                              "apakah anda ingin melihat detail ?",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewPage');
                                },
                                child: const Text("yes"),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("no"),
                              )
                            ],
                          ));
                },
                child: const ClipRRect(
                  child: Image(image: AssetImage('assets/cat.jpeg')),
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.amber,
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.amber,
                            title: const Image(
                              image: AssetImage('assets/stiker.jpeg'),
                              height: 280,
                            ),
                            content: const Text(
                              "apakah anda ingin melihat detail ?",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewPage');
                                },
                                child: const Text("yes"),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("no"),
                              )
                            ],
                          ));
                },
                child: const ClipRRect(
                  child: Image(
                    image: AssetImage('assets/stiker.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.amber,
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.amber,
                            title: const Image(
                              image: AssetImage('assets/tes.jpg'),
                              height: 280,
                            ),
                            content: const Text(
                              "apakah anda ingin melihat detail ?",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewPage');
                                },
                                child: const Text("yes"),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("no"),
                              )
                            ],
                          ));
                },
                child: const ClipRRect(
                  child: Image(
                    image: AssetImage('assets/tes.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.amber,
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.amber,
                            title: const Image(
                              image: AssetImage('assets/hamster.jpeg'),
                              height: 280,
                            ),
                            content: const Text(
                              "apakah anda ingin melihat detail ?",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewPage');
                                },
                                child: const Text("yes"),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("no"),
                              )
                            ],
                          ));
                },
                child: const ClipRRect(
                  child: Image(image: AssetImage('assets/hamster.jpeg')),
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.amber,
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: Colors.amber,
                            title: const Image(
                                image: AssetImage('assets/apa.jpeg')),
                            content: const Text(
                              "apakah anda ingin melihat detail ?",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewPage');
                                },
                                child: const Text("yes"),
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("no"),
                              )
                            ],
                          ));
                },
                child: const ClipRRect(
                  child: Image(image: AssetImage('assets/apa.jpeg')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

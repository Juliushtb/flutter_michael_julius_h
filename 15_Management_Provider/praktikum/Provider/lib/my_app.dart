import 'package:flutter/material.dart';
import 'package:prioritas_1/contact_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        // colorScheme: Theme.of(context)
        //     .colorScheme
        //     .copyWith(primary: Colors.black, background: Colors.white,),
        useMaterial3: true,
      ),
      home: const ContactScreen(title: 'Flutter Contact'),
    );
  }
}

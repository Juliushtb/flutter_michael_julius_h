import 'package:flutter/material.dart';
import 'package:prioritas_1/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => ContactProvider())
  ], child: const MyApp()));
}

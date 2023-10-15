import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prioritas_1/bloc/contact_bloc.dart';

import 'my_app.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ContactBloc(),
    )
  ], child: const MyApp()));
}

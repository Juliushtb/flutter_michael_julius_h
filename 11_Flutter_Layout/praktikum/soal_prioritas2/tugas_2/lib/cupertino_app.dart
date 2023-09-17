import'package:flutter/cupertino.dart';
import './cupertino_page.dart';

class App extends StatelessWidget{

final _themedart = const CupertinoThemeData.raw(
  Brightness.dark,
  null,
  null,
  null,
  null,
  null,
  null
);



  @override
  Widget build(BuildContext context){

    return CupertinoApp(
    
    theme : _themedart,

    home: HomePage(),

    );

  }
}
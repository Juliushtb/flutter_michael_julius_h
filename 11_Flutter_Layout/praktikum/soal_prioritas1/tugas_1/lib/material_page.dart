import'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override

  Widget build(BuildContext context){

    return Scaffold(
  appBar : AppBar(

     title: const Text('Home Page'),
  ),

 drawer: Drawer(

  child:ListView(

      children: const [
         
         ListTile(title: Text('L Leane Graham')),
         ListTile(title: Text('1-770-736-8031 x56442')),

          ListTile(title: Text('E Ervin Howel')),
         ListTile(title: Text('1-770-736-8031 x56442')),

          ListTile(title: Text('C Cleamatine Bauch')),
         ListTile(title: Text('1-770-736-8031 x56442')),
         
      ],

  ),

 ) ,
body: const Center(
  child:Text('Ini adalah home page')
) ,

bottomNavigationBar: BottomNavigationBar(
items: const [

BottomNavigationBarItem(icon: Icon(Icons.home), label:'home'),
BottomNavigationBarItem(icon: Icon(Icons.settings), label:'settings'),

],

),

);
  }

}
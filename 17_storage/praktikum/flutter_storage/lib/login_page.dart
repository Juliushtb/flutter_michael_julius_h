import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prioritas_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late SharedPreferences logindata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "LOGIN PAGE",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 136, 194, 242)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 9, 45, 74),
                maxRadius: 50,
                child: Image.asset(
                  'assets/user.png',
                  width: 60,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              //Textformfield untuk username
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[ a-zA-Z]')),
                  ],
                  textCapitalization: TextCapitalization.words,
                  controller: usernameControler,
                  decoration: const InputDecoration(
                      focusColor: Colors.blue,
                      prefixIcon: Icon(Icons.people_rounded),
                      labelText: "Username",
                      hintText: "Insert Your Username",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Masukan username lebih dari 5 kata';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              //TextFormField untuk password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key_sharp),
                      hintText: "Masukan Password",
                      labelText: "Password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value != null && value.length < 8) {
                      return 'Masukan Password lebih dari 8 kata';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 33, 52, 67))),
                  onPressed: () {
                    final validation = formKey.currentState!.validate();

                    String username = usernameControler.text;
                    if (validation) {
                      logindata.setBool('login', false);
                      logindata.setString('username', username);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

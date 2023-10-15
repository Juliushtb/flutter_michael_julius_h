import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prioritas_1/bloc/contact_bloc.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void dispose() {
    ContactBloc().close();
    super.dispose();
  }

  final bloc = ContactBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          "Contact",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.contact_phone,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Form(
        key: bloc.formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                "Create New Contact",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: bloc.nameController,
                inputFormatters: [
                  //User hanya bisa menginput huruf saja
                  FilteringTextInputFormatter.allow(RegExp('[ a-zA-Z]')),
                ],
                validator: (value) {
                  if (value == null) {
                    return "Masukan nama";
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_add_alt,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blueGrey,
                  labelText: "Nama",
                  hintText: "Masukan nama",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: bloc.nomorController,
                inputFormatters: [
                  //User hanya bisa menginput angka saja
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                validator: (value) {
                  if (value == null) {
                    return "Masukan nomor";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blueGrey,
                  hintText: "+62 ....",
                  labelText: "Nomor",
                  labelStyle: TextStyle(color: Colors.black),
                  hoverColor: Colors.black,
                  iconColor: Colors.black,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        context.read<ContactBloc>().add(
                              AddContact(
                                name: bloc.nameController.text,
                                phoneNumber: bloc.nomorController.text,
                              ),
                            );
                      }
                      bloc.nameController.text = "";
                      bloc.nomorController.text = "";
                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        context.read<ContactBloc>().add(
                              EditContact(
                                index: bloc.selectedIndex,
                                newName: bloc.nameController.text,
                                newPhoneNumber: bloc.nomorController.text,
                              ),
                            );
                        bloc.nameController.text = "";
                        bloc.nomorController.text = "";
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if (state is InitialState) {
                    return const Center(
                      child: Text('Contact kosong'),
                    );
                  } else if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = state.contacts[index];
                        return ListTile(
                          tileColor: Colors.purple.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: CircleAvatar(
                            child: Text(
                              contact['name'][0],
                            ),
                          ),
                          title: Text(
                            contact['name'],
                          ),
                          subtitle: Text(
                            contact['phone_number'],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  bloc.nameController.text = contact['name'];
                                  bloc.nomorController.text =
                                      contact['phone_number'];
                                  bloc.selectedIndex = index;
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<ContactBloc>().add(
                                        DeleteContact(index: index),
                                      );
                                },
                                icon: const Icon(Icons.delete_outline_rounded),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

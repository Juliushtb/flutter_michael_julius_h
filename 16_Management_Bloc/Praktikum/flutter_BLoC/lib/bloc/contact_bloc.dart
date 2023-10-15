import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final nomorController = TextEditingController();
  late int selectedIndex;
  ContactBloc() : super(InitialState()) {
    final List<Map<String, dynamic>> contacts = [];

    on<AddContact>(
      (event, emit) async {
        try {
          emit(LoadingState());

          contacts.add({
            'name': event.name,
            'phone_number': event.phoneNumber,
          });
          nameController.clear();

          await Future.delayed(
            const Duration(seconds: 1),
          );

          emit(SuccessState(contacts));
        } catch (e) {
          nameController.clear();
          emit(ErrorState());
        }
      },
    );
    on<DeleteContact>(
      (event, emit) {
        try {
          emit(LoadingState());

          if (event.index >= 0 && event.index < contacts.length) {
            contacts.removeAt(event.index);
            emit(SuccessState(contacts));
          } else {
            emit(ErrorState());
          }
        } catch (e) {
          emit(ErrorState());
        }
      },
    );

    on<EditContact>(
      (event, emit) {
        try {
          emit(LoadingState());

          if (event.index >= 0 && event.index < contacts.length) {
            contacts[event.index]['name'] =
                event.newName; // Mengganti nama kontak
            contacts[event.index]['phone_number'] =
                event.newPhoneNumber; // Memperbarui nomor telepon
            emit(SuccessState(contacts));
          } else {
            emit(ErrorState());
          }
        } catch (e) {
          emit(ErrorState());
        }
      },
    );
  }
}

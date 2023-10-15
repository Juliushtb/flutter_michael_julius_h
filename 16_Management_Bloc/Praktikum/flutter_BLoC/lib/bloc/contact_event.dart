part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;

  AddContact({
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, phoneNumber];
}

class DeleteContact extends ContactEvent {
  final int index;

  DeleteContact({required this.index});

  @override
  List<Object> get props => [index];
}

class EditContact extends ContactEvent {
  final int index;
  final String newName;
  final String newPhoneNumber;

  EditContact(
      {required this.index,
      required this.newName,
      required this.newPhoneNumber});

  @override
  List<Object> get props => [index, newName, newPhoneNumber];
}

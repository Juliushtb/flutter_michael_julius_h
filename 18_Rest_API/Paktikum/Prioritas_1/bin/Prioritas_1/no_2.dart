import 'dart:convert';

void main() {
  var dataJSON = '{"id": 1,"Name": "Julius", "phone": "081297646311"}';
  final dataMAP = jsonDecode(dataJSON);
  print(dataMAP);
}

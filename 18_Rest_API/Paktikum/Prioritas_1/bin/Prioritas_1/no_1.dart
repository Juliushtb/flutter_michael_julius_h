import 'package:dio/dio.dart';

void main() {
  Dio().post(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      data: {
        "id": 5,
        "name": "Julius",
        "phone": "081297646311"
      }).then((response) {
    print(response);
  });
}

import 'package:dio/dio.dart';

void main() {
  Dio().put(
    "https://jsonplaceholder.typicode.com/posts/1",
    data: {
      "id": 1,
      "title": "foo",
      "body": "bar",
      "userId": 1,
    },
  ).then((response) {
    print(response);
  });
}

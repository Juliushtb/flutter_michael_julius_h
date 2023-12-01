import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.dicebear.com/7.x/bottts/svg';

  Future<String> fetchAvatar() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch avatar: ${response.statusCode}');
    }
  }
}

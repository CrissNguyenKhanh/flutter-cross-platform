import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;

  const NetworkHelper(this.url);

  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(url).timeout(const Duration(seconds: 15));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception(
      'Weather request failed with status ${response.statusCode}',
    );
  }
}

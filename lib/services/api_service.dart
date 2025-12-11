import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> fetchQuote() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/quotes/random'),
      );
      return jsonDecode(response.body);
    } catch (e) {
      print('Service fetch error: $e');
      return {};
    }
  }
}

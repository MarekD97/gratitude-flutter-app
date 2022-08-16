import 'dart:convert';

import 'package:app/constant.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<Entry>> fetchEntries([int currentPage = 1]) async {
  final Map<String, String> headers = {
    "app-token": APP_TOKEN,
    "user-id": "103",
    "user-token":
        '8e743d4d211befd5f25f1515e252e3226498bbab4b5db9824e0f54680b0952ab5bd9935c8b65dcbc97d75db34dc59c5739e0137e4a57bff06e0a2a0cfe55701d'
  };

  final response = await http.get(
      Uri.parse('$API_BASE_URL/api/entries/?page=$currentPage'),
      headers: headers);

  final body = jsonDecode(response.body);
  final results = body['results'];
  List<Entry> entries =
      List<Entry>.from(results.map((entry) => Entry.fromJson(entry)).toList());
  if (response.statusCode == 200) {
    return entries;
  } else {
    throw Exception('Failed to load entries');
  }
}

Future<User> generateToken() async {
  final response = await http.get(
      Uri.parse('$API_BASE_URL/api/generate-token/'),
      headers: {"app-token": APP_TOKEN});

  if (response.statusCode == 201) {
    final user = jsonDecode(response.body);
    return User.fromJson(user);
  } else {
    throw Exception("Failed to generate token");
  }
}

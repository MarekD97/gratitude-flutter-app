import 'dart:convert';

import 'package:app/constant.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/account_service.dart';
import 'package:http/http.dart' as http;

Future<List<Entry>> fetchEntries([int currentPage = 1]) async {
  User? user = await AccountService.loadUserData();
  if (user == null) {
    throw Exception('Failed to load entries: User is null');
  }

  final Map<String, String> headers = {
    "app-token": APP_TOKEN,
    "user-id": user.userId.toString(),
    "user-token": user.userToken
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

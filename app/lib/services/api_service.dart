import 'dart:convert';

import 'package:app/constant.dart';
import 'package:app/models/entry_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/account_service.dart';
import 'package:http/http.dart' as http;

Future<List<Entry>> getEntries([int currentPage = 1]) async {
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

Future<Entry> createEntry(String content) async {
  User? user = await AccountService.loadUserData();
  if (user == null) {
    throw Exception('Failed to create entry: User is null');
  }
  final Map<String, String> headers = {
    "app-token": APP_TOKEN,
    "user-id": user.userId.toString(),
    "user-token": user.userToken,
    "content-type": "application/json",
    "accept": "application/json",
  };

  final response = await http.post(Uri.parse('$API_BASE_URL/api/entries/'),
      headers: headers, body: jsonEncode(<String, String>{"content": content}));
  if (response.statusCode == 201) {
    return Entry.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post entry');
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

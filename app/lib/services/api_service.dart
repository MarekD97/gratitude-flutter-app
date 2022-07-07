import 'dart:convert';
import 'dart:math';

import 'package:app/models/entry_model.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

// Fetch entries from API
Future<List<Entry>> fetchEntries() async {
  final response = await http.get(Uri.parse(apiUrl));

  if(response.statusCode == 200) {
    return jsonDecode(response.body).map((entry) => Entry.fromJson(entry)).toList();
  } else {
    throw Exception('Failed to load entries');
  }
}

// Fetch entries from local file for development purposes
Future<List<Entry>> fetchLocalEntries() async {
  await Future.delayed(Duration(milliseconds: Random().nextInt(2500)+500));
  final response = await rootBundle.loadString('assets/entries.json');

  List<dynamic> entries = jsonDecode(response);
  return entries.map((entry) => Entry.fromJson(entry)).toList();
}
import 'dart:convert';
import 'dart:math';

import 'package:app/models/entry_model.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

String apiUrl = 'http://192.168.2.11:8000/api/entries/';

// Fetch entries from API
Future<List<Entry>> fetchEntries([int currentPage = 1]) async {
  final response = await http.get(Uri.parse('$apiUrl?page=$currentPage'));

  final body = jsonDecode(response.body);
  final results = body['results'];
  List<Entry> entries = List<Entry>.from(results.map((entry) => Entry.fromJson(entry)).toList());
  if(response.statusCode == 200) {
    return entries;
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
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_bloc/data/models/listapi.dart';
import 'package:sample_bloc/data/models/models.dart';

class TheGuardianClient {
  static const baseUrl = "https://content.guardianapis.com/";
  static const apiKeyParam = "api-key";
  static const queryParam = "q";

  final String apikey;

  TheGuardianClient(@required this.apikey) : assert(apikey != null);

  Future<List<SearchApiItemModel>> getItems(String topic) async {
    var url = "$baseUrl/search?$apiKeyParam=$apikey&$queryParam=\"$topic\"";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      int itemCount = jsonResponse['response']['total'];
      print('Number of books about http: $itemCount.');

      if (itemCount == 0) {
        print('No items found for this topic');
        return [];
      }

      List<SearchApiItemModel> output = [];
      for (var item in jsonResponse['response']['results']) {
        output.add(SearchApiItemModel.fromJson(item));
      }
      return output;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}

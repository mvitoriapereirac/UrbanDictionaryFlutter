import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'define_term_response.dart';
import 'term.dart';

class NetworkingService {
  Future<List<Term>> defineTerm(String searchTerm) async {
  
    final queryParameters = {'term' : searchTerm};
    final uri = Uri.https('mashape-community-urban-dictionary.p.rapidapi.com', 'define', queryParameters);
    //base url + specify path + pass query parameters

    final headers =  {
      "X-RapidAPI-Key": "fee524be8bmsh1a1fdc9b49ea23cp1f5ba9jsn5684205a5d28",
      "X-RapidAPI-Host": "mashape-community-urban-dictionary.p.rapidapi.com"
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      final defineTermResponse = DefineTermResponse.fromJson(decodedBody);
      
      return defineTermResponse.list;

    } else {
    throw Exception('Failed to define term');

    }
  }
}



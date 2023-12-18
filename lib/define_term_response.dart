import "package:urban_dictionary/term.dart";

class DefineTermResponse {
  DefineTermResponse({required this.list});

  List<Term> list;

  factory DefineTermResponse.fromJson(Map<String, dynamic> json) { //factory is similar to convenience init
    if (json['list'] is List) { //checking if the json response actually has a value called list, and that it is an array(List in flutter)
      final list = json['list'] as List; 
      final expectedObjectsList = list.cast<Map<String,dynamic>>();
      final termsList = expectedObjectsList.map((e) => Term.fromJson(e)); //map iterates through a list of elements

      return DefineTermResponse(list: termsList.toList());
      //all lists are iterable, but not all iterables are lists. hence the need to assure it's a list

    } else {
    throw Exception('No list found in response');

    }
  }
}


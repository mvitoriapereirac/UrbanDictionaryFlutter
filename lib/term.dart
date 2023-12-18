class Term {
  String word;
  String definition;
  int likes;
  int dislikes;

  String get htmlDefinition { // computed properties in flutter look like this
    return definition.replaceAll('[', '<b>').replaceAll(']', '</b>');

  }


  Term({required this.word, required this.definition, required this.likes, required this.dislikes});

  Term.fromJson(Map<String, dynamic> json)
  :
  word = json['word'],
  definition = json['definition'],
  likes = json['thumbs_up'],
  dislikes = json['thumbs_down'];

}
import 'package:flutter/material.dart';
import 'term.dart';

class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey("TermDetailsPage");
  final Term term;

  TermDetailsPage({Key? key, required this.term}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
        backgroundColor: Colors.purple, 
        foregroundColor: Colors.white
        ),
        body: SafeArea(minimum: EdgeInsets.all(8),child: termDetails()),
    );
   
  }
  
  Widget termDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(term.definition),
      Spacer(),
      Row(children: [
        Text('Likes: ${term.likes}'),
        Padding(padding: EdgeInsets.all(8),
        ),
        Text('Dislikes: ${term.dislikes}')

      ],),
    ],);
  }
}
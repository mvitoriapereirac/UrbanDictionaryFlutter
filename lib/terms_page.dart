import "package:flutter/material.dart";
import "package:urban_dictionary/term.dart";
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TermsPage extends StatelessWidget {
    static final valueKey = ValueKey('TermsPage'); //final is like let; it's different than final in swift
    final String? term;
    final List<Term>? terms;
    ValueChanged<Term>? didSelectTerm;
    TermsPage({Key? key, this.term, this.terms, this.didSelectTerm}) : super(key: key);

    Widget termsList() {
      //ListViews are similar to table views
       return ListView.builder(itemBuilder: (_, index) {
         final term = terms?[index];
        return Card
        (child: 
        ListTile(
          title: Text(term!.word),
           subtitle: HtmlWidget(term.htmlDefinition),
           onTap: () => didSelectTerm!(term),
      
          )
        );

       }, itemCount: terms?.length);
       //creating a cell
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(term!), backgroundColor: Colors.purple, foregroundColor: Colors.white),
      body: SafeArea
        (minimum: EdgeInsets.symmetric( horizontal: 16), child: 
          termsList()
          )
    );
  }

}
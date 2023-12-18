import 'package:flutter/material.dart';
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/networking_service.dart';
import 'package:urban_dictionary/term.dart';
import 'package:urban_dictionary/terms_details_page.dart';
import 'package:urban_dictionary/terms_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   String? _searchedTerm;
   Term? _selectedTerm;
   List<Term> _terms = [];

   final _networkingService = NetworkingService();

    void _searchForTerm(String term) async {
      final terms = await _networkingService.defineTerm(term);

      setState(() {
        //self.searchedTermn = term (iOS)
        this._searchedTerm = term;
        print(term);
        this._terms = terms;

        });


      }

    void _didSelectTerm(Term term) {
      setState(() {
        this._selectedTerm = term;
        print(term);
      });
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Dictionary App',
      theme: ThemeData(
       primarySwatch: Colors.purple,
       visualDensity: VisualDensity.adaptivePlatformDensity,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        // useMaterial3: true,
      ),
      home: Navigator(
        //show enter terms page
        pages: [MaterialPage(child: EnterTermPage(searchForTerm: _searchForTerm), key: EnterTermPage.valueKey),
                
                //show terms page if user did made an input
                if (_searchedTerm != null && _searchedTerm!.isNotEmpty)
                MaterialPage(child:
                 TermsPage(term: _searchedTerm, terms: _terms, didSelectTerm: _didSelectTerm), key: TermsPage.valueKey, ),

                 //if user clicked on card
                if (_selectedTerm != null)
                MaterialPage(child: TermDetailsPage(term: _selectedTerm!, key: TermDetailsPage.valueKey))

          ],
        onPopPage: (route, result) {
          final materialPage = route.settings as MaterialPage?;
          final pageKey = materialPage?.key;
          if (pageKey == TermsPage.valueKey) {
            this._searchedTerm = null;
            this._selectedTerm = null;
          }

          return route.didPop(result); 
        },
      ),//Kinda similar to ZStack at first
    );

    
    
  }
}

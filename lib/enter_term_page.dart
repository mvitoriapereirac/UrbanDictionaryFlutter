import 'package:flutter/material.dart';

//in iOS that would be: (most of the comments mean to trace these similarities)
//class EnterTermPage: StatefulWidget {
class EnterTermPage extends StatefulWidget {
  static final valueKey = ValueKey('EnterTermPage'); //final is like let; it's different than final in swift

//init(searchForTerm: String) {}
EnterTermPage({ Key? key, required this.searchForTerm}) : super (key: key);

//let searchForItem: (String) -> Void
 final ValueChanged<String> searchForTerm;
  @override
  State<StatefulWidget> createState() => _EnterTermPageState();
  //if you're doing something very simple, such as returning an object, you can replace the closures and the 'return' by the arrow (=>)

}


//private class EnterTermPageState: State<EnterTermPage> {
class _EnterTermPageState extends State<EnterTermPage> { //underscore -> it is a privade object + State<EnterTermPage> is a generic state object
//blue squigglie -> never used object 
final _textFieldController = TextEditingController(); //final is similar to let in swift

void _search() {
  widget.searchForTerm(_textFieldController.text);
  _textFieldController.text = '';
  
}

Widget searchForm() {
  return SafeArea(
    minimum: EdgeInsets.symmetric(horizontal: 40),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column( //similar to VStack
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(labelText: 'Enter term'),
          ),
             Padding(padding: EdgeInsets.all(8),
        ),
          ElevatedButton(
            onPressed: () => _search(),
            child: Text('search'), 
            style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple, 
      
        ),)
        ],
      ),
    ),
  );
}
  @override
  //Widgets are similar to Views (SwiftUI)
  Widget build(BuildContext context) {
    return Scaffold(
      //the scaffold lays out the screen to be the ideal way for an app
      //allows us to add things such as (navigation) app bar, body
      appBar: AppBar(title: const Text('Urban Dictionary'), backgroundColor: Colors.purple, foregroundColor: Colors.white,
      ),
      body: searchForm(),

    );
  }

}
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
   @override
  _TextFieldValueState createState() => _TextFieldValueState();

}

class _TextFieldValueState extends State<MainPage> {

    TextEditingController inputController=new TextEditingController();
  String result = 'text';

  getTextInputData(){

    setState(() {
      result = inputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            TextField(
              controller: inputController,
              decoration: InputDecoration(
                  hintText: 'Enter value',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(30.0))),
            ),
              ElevatedButton(
                onPressed: (){
              setState(() {
              result=inputController.text;   
              print(result);             
              });
                },
                child: Text('get Data'),
              ),

              Padding(
              padding: EdgeInsets.all(8.0),
              child :
              Text("Text is = $result")
              )

            ],
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:task1/APIs/login.dart';
import 'package:task1/models/login.dart';
import 'package:task1/pages/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPage extends StatefulWidget {
  @override
 _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
    String? token;
   @override
   void initState(){
     getData();
   }
   
   getData() async {
     SharedPreferences prefs= await SharedPreferences.getInstance();
     setState(() {
       token=prefs.getString('token');
     }); 
   }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(token!),
      ),
    );
  }
}

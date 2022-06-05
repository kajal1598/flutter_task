import 'package:flutter/material.dart';
import 'package:task1/APIs/login.dart';
import 'package:task1/models/login.dart';
import 'package:task1/pages/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
 _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key=GlobalKey<ScaffoldState>(); 
  GlobalKey<FormState> globalFormKey=new GlobalKey<FormState>();
  LoginRequest? loginRequest;

   @override
   void initState(){
     super.initState();
     loginRequest=new LoginRequest();
   }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white10,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children:[
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                   margin: EdgeInsets.symmetric(vertical: 80,horizontal: 20),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey,
                     boxShadow: const [
                       BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0,10),
                         blurRadius: 20
                       )
                     ]
                   ),
                   child: Form(
                     key: globalFormKey,
                     child: Column(
                       children: [
                         SizedBox(
                           height: 20,
                         ),
                         Text("Login"),
                         SizedBox(
                           height: 20,
                         ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Email',
                          ),
                          onSaved: (input) =>loginRequest?.email=input,
                          // validator: (input) {
                          //   return (input != null && input.contains('@')) ? 'Do not use the @ char.' : null;
                          // },
                        ),
                          SizedBox(
                            height: 20,
                          ),
                       TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Password',
                          ),
                          onSaved: (input) =>loginRequest?.password=input
                        ),                         
                         SizedBox(
                            height: 20,
                          ),
                            TextButton(
                            //  onPressed: () { },
                              onPressed: ()  async{
                              SharedPreferences prefs= await SharedPreferences.getInstance(); 
                                if(validate()){
                                  APIs apis=new APIs();
                                  apis.login(loginRequest!).then((value)=>{
                                  prefs.setString('token', value.toString()),
                                  if(value.token!.isNotEmpty){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>TokenPage())
                                    ),
                                  }                               
                                  });

                                }
                               },
                              child: Text('Login'),
                            )

                       ],
                     ),
                   ),
                 )
              ]
            )
          ],
        ),
      )
    );
  }
  bool validate(){
    var form=globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task1/models/login.dart';
 
class APIs{
  Future<LoginResponse> login(LoginRequest requestModel) async {
    String url='https://reqres.in/api/login';

    final response=await http.post(Uri.parse(url),body: requestModel.toJSON());
    print(response);
    if(response.statusCode==200 || response.statusCode==400){
      return LoginResponse.fromJson(json.decode(response.body));
    }
      return LoginResponse();
  }
}
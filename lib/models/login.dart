class LoginRequest{
   String? email;
   String? password;

   LoginRequest({
     this.email,
     this.password
   });

   Map<String,dynamic> toJSON(){
     Map<String,dynamic> map={
       'email':email,
       'password':password
     };
     return map;
   }
}
class LoginResponse{
   final String? token;
   final String? error;

   LoginResponse({
     this.token,
     this.error
   });

   factory LoginResponse.fromJson(Map<String,dynamic> json){
     return LoginResponse(token:json['token'] ?? " ");
   }
}
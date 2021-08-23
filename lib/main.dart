
import 'package:crudapp/login.dart';
import 'package:crudapp/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
      home: LoginPage()));
}
class Login extends  StatefulWidget{
  @override
  LoginState createState()=> LoginState();
}
Future<UserModel?> createUser(String name,String job) async {
final String apiUrl ="https://reqres.in/api/users";

final response = await http.post(Uri.parse(apiUrl),body: {
 "name": name,
 "job": job
 } );

if(response.statusCode == 201){
  final String responseString = response.body;
  return userModelFromJson(responseString);
}
else {
  return null;
}

}

class LoginState extends State<Login> {
  final formKey =GlobalKey<FormState>();
late final UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("Login Page"),

  ),
  body: Container(
    child: Column(
      children: [
        TextField(
          controller: nameController,
        ),
        TextField(
controller: jobController,
        ),
        SizedBox(
          height: 20,
        ),
        _user == null ? Container():
            Text("${_user.name},${_user.id}"),
        RaisedButton(child: Text("Submit"),
        onPressed: () async {
          final String name = nameController.text;
          final String job = jobController.text;

          final UserModel? user = await createUser(name, job);
          setState(() {
            _user = user!;

          });

        },
        )
      ],

    ),
  ),

) ;
  }
}


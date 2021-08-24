

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
      home: LoginPage()));
}

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();

}




class LoginPageState extends State <LoginPage> {

  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyApp"),

        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "name",
                    hintText: "Enter Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Email";
                    }
                    else if (!value.contains("@")) {
                      return "Enter Valid Email";
                    }
                  },

                ),
                TextFormField(
                  controller: jobController,
                  decoration: InputDecoration(

                    labelText: "job",
                    hintText: "Enter Password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    else if (value.length < 6) {
                      return "Password must be greater than 6";
                    }
                  },


                ),

                RaisedButton(
                  padding: EdgeInsets.all(3),
                  onPressed: () {
                    login();

                  },
                  child: Text("Login"),

                )
              ],
            ),
          ),
        )
    );
  }


  Future<void> login() async {
    if (nameController.text.isNotEmpty && jobController.text.isNotEmpty) {
      var response = await http.get(Uri.parse("https://reqres.in/api/users/2"),
          body: ({
            "name": nameController.text,
            "job": jobController.text
          }));

      //
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Sucessfull"),));
      }
      else  {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid Credintials"),));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Blank Field"),));
    }
  }
}


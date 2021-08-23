

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();

}




class LoginPageState extends State <LoginPage> {

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
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
                  controller: passwordController,
                  decoration: InputDecoration(

                    labelText: "Password",
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
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await Uri.https("https://jsonplaceholder.typicode.com/", "/posts#");


      //
      if (response.bo == 200) {
        print("login done");

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



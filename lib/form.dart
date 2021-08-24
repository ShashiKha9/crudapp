import 'package:crudapp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './user.dart';
import 'main.dart';

class MyForm extends  StatefulWidget{
  @override
  FormState createState()=> FormState();
}
class FormState extends State<MyForm> {
  User user = User(0,"","","");

  Future post() async {
    if(user.id ==0) {
      await http.post(Uri.parse("http://localhost:1337/apis/"),headers: <String,String>{
        "Context-Type":"application/json;charset=UTF-8"},body: <String,String>{
        "name":user.name,"email" :user.email,"password": user.password});



    }
    else {
      await http.put(Uri.parse("http://localhost:1337/apis/${user.id.toString()}"),headers: <String,String>{
        "Context-Type":"application/json;charset=UTF-8"},body: <String,String>{
        "name":user.name,"email" :user.email,"password": user.password});


    }
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>Login(1)));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(child:Padding(padding: EdgeInsets.all(10),
      child: Column(
        
        children: [
          TextField(
            onChanged: (val){
user.name=val;
            },
      controller: TextEditingController(text: user.name),
      decoration: InputDecoration(
    labelText: "Name",
    icon: Icon(Icons.person)
    ),
      
      ),
          TextField(
            onChanged: (val){
              user.email=val;
            },
            controller: TextEditingController(text: user.email),
            decoration: InputDecoration(
                labelText: "email",
                icon: Icon(Icons.email)
            ),

          ),
          TextField(
            onChanged: (val){
              user.password=val;
            },
            controller: TextEditingController(text: user.password),
            decoration: InputDecoration(
                labelText: "password",
                icon: Icon(Icons.vpn_key)
            ),

          ),
          Padding(padding: EdgeInsets.all(20)),
          MaterialButton(onPressed: (){
          },
            child: Text("Login"),
            color: Colors.lightBlue,
          

          )
          
        ],

      )
    ),


)
    );
  }
}
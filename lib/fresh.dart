

import 'dart:convert';

import 'package:crudapp/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MaterialApp(
      home: LoginPage()));
}

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();


}
class LoginPageState extends State<LoginPage>{
  get list => null;

  get i => null ;

  @override
  void initState() {
    super.initState();
    this.getData();
  }



Future<dynamic>  getData() async{
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  headers: {
 "Accept" : "application/json"
  }

  );


   List<User> listofuser = response.body as List<User>;
  final List user1= json.decode(response.body);
  List<User>list = user1.map((e) =>User.fromJson(e)).toList();

  for(var i=0;i<list.length;i++){
    print("ak1:"+ list[i].userId.toString());
    print("ak1:"+ list[i].title);
    print("ak1:"+ list[i].id.toString());

  }

  User user = response.body as User;
  print("ak:"+user.title);
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var data;
    return Scaffold(
     body: ListView.builder(
       itemCount: data == null ? 0 : data.length,
         itemBuilder:(BuildContext context,int index){
         return Container(
           child: Center(
             child: Column(
               children: [
                 ListTile(
                   title: Text(data[index][List[i].userId.toString()]),
                 ),
                 RaisedButton(onPressed: getData,


                   child: Text("data"),
                 ),
               ],
             ),
           ),
         );
         }

     ),












    );
  }
}






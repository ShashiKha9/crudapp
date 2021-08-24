import 'dart:convert';

import 'package:crudapp/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyList extends  StatefulWidget{
  @override
 ListState createState()=> ListState();
}
class ListState extends State<MyList>{
  List<User> users = [];
  Future getAll() async {
 var data =   await http.get(Uri.parse("http://localhost:1337/apis/"));
 var jsonData = json.decode(data.body);

 for(var u in jsonData) {
   User user =User(u["id"], u["name"], u["email"], u["password"]);
 }
 return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getAll(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.data== null){
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),


                  );
                }
            );
          }
        }

    )
    );

        }
}
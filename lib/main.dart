
import 'package:crudapp/list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form.dart';
void main() {
  runApp(MaterialApp(
      home: Login()));
}
class Login extends  StatefulWidget{
  @override
  LoginState createState()=> LoginState();
}
class LoginState extends State<Login>{
 var _body;
  var title;
  void initState(){
    super.initState();
    changeView(0);

  }

  int _currenrindex = 0;

  void onTap(index) {
    changeView(index);
  }
  void changeView(index){
    _currenrindex=index;
    setState(() {

    switch(index) {
      case 0:{
        title ="Form";
        _body=MyForm();
        break;
    }
    case 1: {
    title ="List";
    _body=MyList();
    break;

  }
  }
    });
}
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Login"),
    ),
    body: _body,
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.add),title: Text("Add")),
      BottomNavigationBarItem(icon: Icon(Icons.table_rows),title: Text("View")),

    ],
        currentIndex: _currenrindex,
    ),
  ),
);
  }
  }



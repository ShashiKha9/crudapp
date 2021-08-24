
import 'package:crudapp/list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form.dart';
void main() {
  runApp(MaterialApp(
      home: Login(0)));
}
class Login extends  StatefulWidget{
  int state;
  Login(this.state);
  @override
  LoginState createState()=> LoginState(this.state);
}
class LoginState extends State<Login> {
  int state;
  var _body;
 var _title;

  LoginState(this.state);
  @override
  void initState(){
    super.initState();
    changeView(state);

  }

  int _currenntindex = 0;

  void onTap(index) {
    changeView(index);
  }
  void changeView(index){
    _currenntindex=index;
    setState(() {

    switch(index) {
      case 0:{
        _title ="Form";
        _body=MyList();
        break;
    }
    case 1: {
    _title ="List";
    _body=MyForm();
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
      title: Text(_title),
    ),
    body: _body,
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.add),title: Text("Add")),
      BottomNavigationBarItem(icon: Icon(Icons.table_rows),title: Text("View")),

    ],
        currentIndex: _currenntindex,
    ),
  ),
);
  }
  }



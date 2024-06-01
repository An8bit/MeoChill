import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/screens/home/home_screen.dart';
import 'package:meochill/screens/login/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //nay la chỗ đổ màu cho giao diện bự
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.black,
        Colors.red,
      ])),
      //chỗ này chia cột dọc để ghi chữ login và welcome
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          LoginButton(),
          //chia khoảng cách cột  và chứ các cái pass hay email gì đó tự coi code la hiểu
          FormLogin()
        ],
      ),
    ));
  }
}



class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Welcome",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 20, // Add some space before the button
          ),
          
        ],
      ),
    );
  }
}


class FormLogin extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        ),
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(225, 95, 27, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "phone && email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "fogot Password ???",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                     height: 50,
                     width: double.infinity,
                     child: OutlinedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(HomeScreen.route);
                      },
                       style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.black54)),
                       child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                     ),
                     ),
              SizedBox(
                height: 40,
              ),
              
              
              SizedBox(
                     height: 50,
                     width: double.infinity,
                     child: OutlinedButton(
                      onPressed: (){
                         Navigator.of(context).pushNamed(RegisterScreen.route);
                      },
                       style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.black54)),
                       child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                     ),
                     ),
            ],
          ),
        ),
      ),
    );
  }
}

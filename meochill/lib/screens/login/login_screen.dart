import 'package:flutter/material.dart';
import 'package:meochill/screens/home/home2_screen.dart';

import 'package:meochill/screens/login/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";
    const LoginScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //nay la chỗ đổ màu cho giao diện bự
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
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
          const SizedBox(
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
    return const Padding(
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        ),
        child: Padding(
          padding: const  EdgeInsets.all(35),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(225, 95, 27, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ]),
                child:  Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: const TextField(
                        decoration: InputDecoration(
                          
                          hintText: "phone && email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: const TextField(
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
              const SizedBox(
                height: 15,
              ),
              const Text(
                "fogot Password ???",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                     height: 50,
                     width: double.infinity,
                     child: OutlinedButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(HomeScreen2.route);
                      },
                       style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black54)),
                       child: const Text("Login",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                     ),
                     ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                     height: 50,
                     width: double.infinity,
                     child: OutlinedButton(
                      onPressed: (){
                         Navigator.of(context).pushNamed(RegisterScreen.route);
                      },
                       style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black54)),
                       child: const Text("Register",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                     ),
                     ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/common_widgets/noti_bar.dart';
import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/login/cubit/login_cubit.dart';
import 'package:meochill/widget/screens/login/cubit/login_state.dart';
import 'package:meochill/widget/screens/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<Api>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Page();
        },
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

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
  Loginmodel login = Loginmodel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loadStatus == LoadStatus.Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Lỗi", style: TextStyle(color: Colors.red))),
            );
          } else if (state.loadStatus == LoadStatus.Done) {
            Navigator.of(context).pushNamed(HomeScreen.route);
          }
        },
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.Loading) {
            return
             
                const Center(
                  child: SpinKitWave(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                );
              
          
          } else {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
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
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Phone Or Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => login.username = value,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => login.password = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Forgot Password ???",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<LoginCubit>().startLogin();
                          context.read<LoginCubit>().checkLogin(login);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black54),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterScreen.route);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black54),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

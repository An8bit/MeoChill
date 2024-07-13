import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';

import '../../../common/enum/load_status.dart';
import '../../../models/account.dart';
import '../../../repostsitories/api.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  static const String route = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(context.read<Api>()),
      child: page(),
    );
  }
}

class page extends StatelessWidget {
  const page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 0),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.black,
              Colors.red,
            ]),
          ),
          // Chia cột dọc để ghi chữ login và welcome
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              // Chia khoảng cách cột và chứa các ô input
              FormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

// Form tạo tài khoản
class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Account account = Account();
     String? confirmpass;
    return BlocConsumer<RegisterCubit, RegisterState>(
       listener: (context, state) {
          if (state.loadStatus == LoadStatus.Error &&
              state.confirmpass == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Thông tin mail đã được đăng kí", style: TextStyle(color: Colors.red))),
            );}
            else if(state.loadStatus==LoadStatus.Error&& state.verifyaccount==false){
                 ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Mật khẩu xác nhận không khớp", style: TextStyle(color: Colors.red))),);
            
          } else if (state.loadStatus == LoadStatus.Done &&
              state.confirmpass == true) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));  
          }
      },
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.Loading) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Color.fromARGB(252, 15, 137, 198),
                size: 50.0,
              ),
            );
          }
        return Container(
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Padding(
            padding:const EdgeInsets.all(35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => account.username = value,
                        ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => account.email = value,
                        ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(10),
                        decoration:const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: " Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                           obscureText: true,
                          onChanged: (value) => account.password = value,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                           obscureText: true,
                           onChanged: (value) => confirmpass = value,
                        ),
                      ),
                    ],
                  ),
                ),
              const  SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black54)),
                    onPressed: () {
                         context
                            .read<RegisterCubit>()
                            .checkRegister(account, confirmpass!);
                    },
                    child:const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black54)),
                    onPressed: () {
                      Navigator.of(context).pop(LoginScreen.route);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

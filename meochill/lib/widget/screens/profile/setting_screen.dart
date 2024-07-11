import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';
import 'package:meochill/widget/screens/profile/cubit/profile_cubit.dart';
import 'package:meochill/widget/screens/profile/cubit/profile_state.dart';

import '../../../main_cubit.dart';

import 'package:meochill/widget/screens/profile/show_language.dart';

import '../../../repostsitories/api.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(context.read<Api>())..getListAccountByUserName(
      "john_doe@edddxample1.com"
      ),
      child: ProfileScreen(),
    );
  }
}

class ButtonDarkLight extends StatefulWidget {
  const ButtonDarkLight({super.key});

  @override
  State<ButtonDarkLight> createState() => _ButtonDarkLightState();
}

class _ButtonDarkLightState extends State<ButtonDarkLight> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ListTile(
            title: Text('Chế độ tối'),
            enabled: true, // Bạn có thể đặt trực tiếp true nếu không thay đổi
            onTap: () {
              // Nếu bạn muốn xử lý thêm gì đó khi ListTile được tap, thực hiện ở đây
            },
            trailing: Switch(
              value: state.isLightTheme, // Dùng trực tiếp từ state
              onChanged: (bool value) {
                // Thay đổi theme bằng cách gọi Cubit
                context.read<MainCubit>().setTheme(value);
              },
            ));
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Listinfomation(),
    );
  }
}

class Listinfomation extends StatelessWidget {
  const Listinfomation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if(state.loadStatus==LoadStatus.Loading){
                 return const Center(child: SpinKitHourGlass(color: Colors.blue,size: 50.0,),);
              }
              else if(state.loadStatus == LoadStatus.Error){
                 return const Center(child: Text('Error'));
              }
              else{

              
              return Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/venom.jpg'), // Replace with your image URL
                  ),
                  SizedBox(height: 20),
                  Text(state.account.first.username!, style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/editProfile'); // Use named route to navigate
                    },
                    child: Text('Chỉnh sửa profile'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      disabledForegroundColor: Colors.white.withOpacity(0.38),
                    ),
                  ),
                ],
              );
            }},
          ),
        ),
        ListTile(
          title: Text('Thông tin tài khoản'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Tài khoảng liên kết'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Quản lý thiết bị'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Phim yêu thích'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Download'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('Ngôn ngữ'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            showLanguageDialog(context);
          },
        ),
        ListTile(
          title: Text('Đăng nhập'),
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.route);
          },
        ),
        ButtonDarkLight(),
      ],
    );
  }
}

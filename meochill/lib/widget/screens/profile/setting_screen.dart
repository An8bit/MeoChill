import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/navigator/navigartor.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_cubit.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_state.dart';
import 'package:meochill/widget/screens/profile/cubit/profile_cubit.dart';
import 'package:meochill/widget/screens/profile/cubit/profile_state.dart';

import '../../../main_cubit.dart';

import 'package:meochill/widget/screens/profile/show_language.dart';

import '../../../repostsitories/api.dart';
import '../premium/premium_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(context.read<Api>())..loadSession(),
        ),
        BlocProvider(
          create: (context) =>
              PremiumCubit(context.read<Api>())..checkPremium(),
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.Loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.loadStatus == LoadStatus.Error) {
            return const Scaffold(
              body: Center(
                child: Text('Đã xảy ra lỗi khi tải dữ liệu'),
              ),
            );
          } else {
            // context.read<ProfileCubit>().getListAccountByUserName(state.email);
            return ProfileScreen();
          }
        },
      ),
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
            title: Text('Chế độ sáng'),
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
        body: Listinfomation());
  }
}

class Listinfomation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.loadStatus == LoadStatus.Loading) {
                return const Center(
                  child: SpinKitHourGlass(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                );
              } else if (state.loadStatus == LoadStatus.Error) {
                return const Center(child: Text('Error'));
              } else {
                String username = state.account.isNotEmpty
                    ? (state.account.first.username ??
                        "Hiện bạn chưa đăng nhập")
                    : "Hiện bạn chưa đăng nhập";
                return Premium(username);
              }
            },
          ),
        ),
        ListTile(
          title: const Text('Thông báo'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Chỉnh sửa thông tin tài khoản'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(context, '/editProfile');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Nâng cấp gói tài khoản'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PremiumScreen()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Ngôn ngữ'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            showLanguageDialog(context);
          },
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return ListTile(
              title: Text(state.account.isNotEmpty ? 'Đăng xuất' : 'Đăng nhập'),
              onTap: () {
                if (state.account.isNotEmpty) {
                  context.read<ProfileCubit>().logout();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                }
              },
            );
          },
        ),
        ButtonDarkLight(),
      ],
    );
  }

  BlocBuilder<PremiumCubit, PremiumState> Premium(String username) {
    return BlocBuilder<PremiumCubit, PremiumState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            'assets/thuan.jpg'), // Replace with your image URL
                      ),
                      SizedBox(height: 20),
                      Text(username, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(state.isPremium
                            ? 'Bạn đã mua gói Premium'
                            : 'Mua gói Premium'), // Change text based on state),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          disabledForegroundColor:
                              Colors.white.withOpacity(0.38),
                        ),
                      ),
                    ],
                  );
                },
              );
  }
}

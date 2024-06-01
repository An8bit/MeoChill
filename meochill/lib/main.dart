import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/cubit/main_cubit.dart';
import 'package:meochill/repostsitories/api_impl.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:meochill/repostsitories/login_impl.dart';
import 'package:meochill/routes.dart';
import 'package:meochill/screens/details/details_screen.dart';
import 'package:meochill/screens/home/home_screen.dart';
import 'package:meochill/screens/login/login_screen.dart';

void main() {
  runApp(RepositoryProvider<Log>(
    create: (context) => logimpl(),
    child: Riponsitory(),
  ));
}

class Riponsitory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiImpl(),
      child: Provider(),
    );
  }
}

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  MainCubit(),
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: mainRoute,
      initialRoute: LoginScreen.route,
      home: Scaffold(
        body: Center(
          child: Text('Hello vv World!'),
        ),
      ),
    );
  }
}

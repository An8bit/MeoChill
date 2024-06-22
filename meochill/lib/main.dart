import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/cubit/main_cubit.dart';
import 'package:meochill/repostsitories/MongoService.dart';
import 'package:meochill/repostsitories/api.dart';


import 'package:meochill/repostsitories/log.dart';
import 'package:meochill/repostsitories/login_impl.dart';
import 'package:meochill/routes.dart';
import 'package:meochill/screens/home/home2_screen.dart';






Future<void> main() async {


 

  runApp(RepositoryProvider<LogApp>(
    create: (context) => logimpl(),
    child: Riponsitory(),
  ));
}

class Riponsitory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Api>(
      create: (context) => MongoService(context.read<LogApp>()),
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
    return  MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: mainRoute,
      initialRoute: HomeScreen2.route,
      home: const Scaffold(
        body: Center(
          child: Text('Hello vv World!'),
        ),
      ),
    );
  }
}

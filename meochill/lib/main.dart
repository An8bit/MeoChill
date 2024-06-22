import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:meochill/main_cubit.dart';
import 'package:meochill/repostsitories/MongoService.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:meochill/repostsitories/login_impl.dart';
import 'package:meochill/routes.dart';
import 'package:meochill/widget/screens/home/home_screen.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';

class SimpleBlocObsever extends BlocObserver {
  final LogApp log;
  static const String TAG = 'Bloc';
  const SimpleBlocObsever(this.log);
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log.i(TAG, 'onCreate: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    log.i(TAG, 'onEvent: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log.i(TAG, 'onChange: ${bloc.runtimeType}, change: ${change.nextState}');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log.i(TAG, 'onTransition: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log.i(TAG, 'onError: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log.i(TAG, 'onClose: ${bloc.runtimeType}');
  }
=======
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
>>>>>>> origin/navigationthuan2
}

void main() async {
  // Loginmodel l =  Loginmodel(username: "hehe", password: "heyyo");

  //  MongoService mongoService= MongoService();
  //  await mongoService.connect();
  //  try {
  //   // await mongoService.connect();
  // bool a = await mongoService.checkLogin(l); // Get list of movies

  //   // Convert list of maps to list of categories
  //  // List<Category> categories = movies.map((json) => Category.fromJson(json)).toList();

  //   // Print list of categories
  //   // categories.forEach((category) {
  //   //   print('Category ID: ${category.id}, Name: ${category.name}, Slug: ${category.slug}');
  //   // });
  // } catch (e) {
  //   print('Error: $e');
  // }

  LogApp log = logimpl();
  Bloc.observer = SimpleBlocObsever(log);

  runApp(RepositoryProvider<LogApp>.value(value: log, child: Repository()));
}

class Repository extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<Api>(
        //xài trực tiếp từ anh mongodb
        create: (context) => MongoService(context.read<LogApp>()),
      ),
      // RepositoryProvider<Api>(
      //   //thay đổi lên web api ở đây
      //   create: (context) => ApiImpl(context.read<LogApp>()),
      // )
    ], child: Provider());
=======
    return RepositoryProvider<Api>(
      create: (context) => MongoService(context.read<LogApp>()),
      child: Provider(),
    );
>>>>>>> origin/navigationthuan2
  }
}

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: mainRoute,
      initialRoute: HomeScreen2.route,
      home: Scaffold(
        body: Center(
          child: Text('Hello vv World!'),
        ),
      ),
    );
  }
}

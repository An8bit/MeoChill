import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/main_cubit.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:meochill/repostsitories/MongoService.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/api_sever_impl.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:meochill/repostsitories/login_impl.dart';
import 'package:meochill/routes.dart';
import 'package:meochill/widget/screens/home/home_screen.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';

class SimpleBlocObsever extends BlocObserver {
  final LogApp log;
  static const String TAG = 'Bloc';
  const SimpleBlocObsever(this.log);
=======
=======
import 'package:meochill/repostsitories/MongoService.dart';
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/api_sever_impl.dart';
import 'package:meochill/repostsitories/log.dart';
import 'package:meochill/repostsitories/login_impl.dart';
import 'package:meochill/routes.dart';
import 'package:meochill/widget/screens/home/home_screen.dart';
import 'package:meochill/widget/screens/login/login_screen.dart';

class SimpleBlocObsever extends BlocObserver {
<<<<<<< HEAD
   final Log log;
  static const String TAG ='Bloc';
  const SimpleBlocObsever (this.log);
>>>>>>> 401cf04 (WIP: Commit current changes)
=======
  final LogApp log;
  static const String TAG = 'Bloc';
  const SimpleBlocObsever(this.log);
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
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
<<<<<<< HEAD
=======
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

<<<<<<< HEAD
  runApp(
    RepositoryProvider<Log>.value(
    value: log, 
    child: Riponsitory())
    );
>>>>>>> 401cf04 (WIP: Commit current changes)
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
=======
  runApp(RepositoryProvider<LogApp>.value(value: log, child: Repository()));
}

class Repository extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<Api>(
        //xài trực tiếp từ anh mongodb
        create: (context) => MongoService(context.read<LogApp>()),
      ),
      RepositoryProvider<Api>(
        //thay đổi lên web api ở đây
        create: (context) => ApiImpl(context.read<LogApp>()),
      )
    ], child: Provider());
<<<<<<< HEAD
=======
    return RepositoryProvider<Api>(

      create: (context) => ApiImpl(context.read<Log>()),
      child: Provider(),
    );
>>>>>>> 401cf04 (WIP: Commit current changes)
=======
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
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

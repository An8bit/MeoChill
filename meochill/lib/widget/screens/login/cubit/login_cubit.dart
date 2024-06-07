// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/login/cubit/login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  final Api api;

  LoginCubit(this.api) : super(LoginState.init());

  
}
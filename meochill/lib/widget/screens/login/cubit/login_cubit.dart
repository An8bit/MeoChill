// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/loginmodel.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/login/cubit/login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  final Api api;

  LoginCubit(this.api) : super(LoginState.init());
  Future<void> checkLogin (Loginmodel login) async {
    await api.conNect();
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    var result = await api.checkLogin(login);
    if(result){
      emit(state.copyWith(loadStatus: LoadStatus.Done));
    }else{
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
  
}
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/loginmodel.dart';
=======
>>>>>>> 401cf04 (WIP: Commit current changes)
=======
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/loginmodel.dart';
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/login/cubit/login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  final Api api;

  LoginCubit(this.api) : super(LoginState.init());
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
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
<<<<<<< HEAD
=======

>>>>>>> 401cf04 (WIP: Commit current changes)
=======
>>>>>>> 138dddf (DONE:kết nối đăng nhập demo)
  
}
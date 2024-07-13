import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/account.dart';
import 'package:meochill/widget/screens/register/cubit/register_state.dart';

import '../../../../repostsitories/api.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Api api;

  RegisterCubit(this.api) : super(RegisterState.init());

  Future<void> checkRegister(
    Account register,
    String confirmpass,
  ) async {
    await api.conNect();
    try {
      if (register.password == confirmpass) {
        bool a = await api.checkAccount(register);
        print(a);
        if (await api.checkAccount(register) == false) {
          var result = await api.registerAccount(register);

          if (result) {
            emit(
                state.copyWith(loadStatus: LoadStatus.Done, confirmpass: true));
          }
        } else {
          emit(state.copyWith(loadStatus: LoadStatus.Error));
        }
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error,verifyaccount: false));
      }
    } catch (ex) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}
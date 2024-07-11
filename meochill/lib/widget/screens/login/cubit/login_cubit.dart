// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/models/account.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/login/cubit/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginCubit extends Cubit<LoginState> {
  final Api api;

  LoginCubit(this.api) : super(LoginState.init());

  Future<void> checkLogin(Account login) async {
    await api.conNect();
    emit(state.copyWith(loadStatus: LoadStatus.Loading, account: login));
    var result = await api.checkLogin(login);
    if (result) {
      emit(state.copyWith(loadStatus: LoadStatus.Done, account: login));
      await _saveSession(login);
    } else {
      emit(state.copyWith(loadStatus: LoadStatus.Error, account: login));
    }
  }

  Future<void> _saveSession(Account account) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_session', jsonEncode(account.toJson()));
  }

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user_session');
    if (userJson != null) {
      final userData = jsonDecode(userJson);
      final account = Account.fromJson(userData);
      emit(state.copyWith(
        loadStatus: LoadStatus.Done,
        account: account,
      ));
    }
  }

  Future<void> startLogin(Account login) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading, account: login));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_session');
    emit(LoginState.init());
  }

  Account? getCurrentUser() {
    return state.account;
  }
}

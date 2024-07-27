import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../repostsitories/api.dart';
import 'premium_state.dart';



class PremiumCubit extends Cubit<PremiumState> {
  final Api api;
  PremiumCubit(this.api) : super(PremiumState.Init());

  void buyPremium() async {
    try {
      final prefs = await SharedPreferences.getInstance();
    final  userJson = prefs.getString('email');
    if (userJson != null) {
      final isPremium = await api.buyPremium(userJson);
      emit(state.copyWith(isPremium: isPremium, loadStatus: LoadStatus.Loading));}
      else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  void setPremium(bool isPremium) {
    emit(state.copyWith(isPremium: isPremium));
  }

 Future<void> checkPremium() async {
    try {
      final prefs = await SharedPreferences.getInstance();
    final  userJson = prefs.getString('email');
    if (userJson != null) {
      final isPremium = await api.checkPremium(userJson);
      emit(state.copyWith(isPremium: isPremium, loadStatus: LoadStatus.Done));}
      else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (e) {
      print("lỗi tại checkPremium: $e");
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

}

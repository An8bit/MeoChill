import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../repostsitories/api.dart';
import 'premium_state.dart';

class PremiumCubit extends Cubit<PremiumState> {
  final Api api;
  PremiumCubit(this.api) : super(PremiumState.init());

  void buyPremium() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('email');
      if (userJson != null) {
         final  isPremium = await api.checkPremium(userJson);
        if (!isPremium) {
          final isdkPremium = await api.buyPremium(userJson);
          emit(state.copyWith(
              isPremium: isdkPremium, loadStatus: LoadStatus.Done));
        }
        else{
          emit(state.copyWith(
              isPremium: isPremium));
        }
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (e) {
      print("lỗi tại ai $e");
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  void setPremium(bool isPremium) {
    emit(state.copyWith(isPremium: isPremium));
  }

  Future<void> checkPremium() async {
    try {
      emit(state.copyWith(
        loadStatus: LoadStatus.Loading,
      ));
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('email');
      if (userJson != null) {
        final isPremium = await api.checkPremium(userJson);

        emit(state.copyWith(
          isPremium: isPremium,
          loadStatus: LoadStatus.Done,
        ));
      } else {
        emit(state.copyWith(isguestLecture: true));
      }
    } catch (e) {
      print("lỗi tại checkPremium: $e");
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  Future<void> checkFilmPremium(ObjectId id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('email');
       final moviepre = await api.checkFilmPremium(id);
      if (userJson != null) {
        final isPremium = await api.checkPremium(userJson);
       
        emit(state.copyWith(
            isPremium: isPremium,
            loadStatus: LoadStatus.Done,
            isMoviePremium: moviepre));
      } else {
        emit(state.copyWith(isguestLecture: true, isMoviePremium: moviepre));
      }
    } catch (e) {
      print("lỗi tại checkPremium: $e");
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}

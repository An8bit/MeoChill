import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../models/movie.dart';
import '../../../../repostsitories/api.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
final Api api;


  FavoriteCubit(this.api) : super(FavoriteState.init());
  
  Future <void> showListfavorite () async {

    try{
      final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('email');
     if(userJson!=null){
      emit(state.copyWith(loadStatus: LoadStatus.Loading));
      await api.conNect();
      var ListMoviefavoriteId= await api.getListFavorite(userJson);
      if(ListMoviefavoriteId.isNotEmpty){
        return  emit(state.copyWith(loadStatus : LoadStatus.Done,movies: ListMoviefavoriteId));
      }
      else{
        return  emit(state.copyWith(loadStatus : LoadStatus.Error,));
      }
     }
    }catch(ex){
        print('lỗi khi lấy dữ liệu tại{$ex}');
        return  emit(state.copyWith(loadStatus : LoadStatus.Error,));
    }
  }
}

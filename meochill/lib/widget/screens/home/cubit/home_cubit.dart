import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:meochill/common/enum/load_status.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../../models/movie.dart';
import '../../../../repostsitories/api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Api api;
  HomeCubit(this.api) : super(HomeState.init());
  Future<void> getTopTrending() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading,));
    
    try{
      await api.conNect();
       
      if(state.moviestoptrend.isEmpty){
          final moviestoptrend = await api.getTopTrending();
          final moviesrecommand = await api.getRecommandMovie();
          emit(state.copyWith(
          moviestoptrend: moviestoptrend,
          loadStatus: LoadStatus.Done,
          moviesrecommand: moviesrecommand));
      }
      else{
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    }
    catch(ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
       
    }
    
  }
}



import 'package:bloc/bloc.dart';

import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/screens/home/cubit/home_state.dart';

import '../../../../repostsitories/api.dart';



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
          final moviegetpremium = await api.getPremiumMovie();
          emit(state.copyWith(
          moviestoptrend: moviestoptrend,
          loadStatus: LoadStatus.Done,
          moviesrecommand: moviesrecommand,moviegetpremium: moviegetpremium,));
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

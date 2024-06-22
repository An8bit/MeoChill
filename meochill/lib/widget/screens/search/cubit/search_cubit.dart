import 'package:bloc/bloc.dart';

import 'package:meochill/common/enum/load_status.dart';

import 'package:meochill/repostsitories/api.dart';


import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final Api api;

  SearchCubit(this.api) : super(SearchState.init());
  
  Future<void> getTopTrending() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading,movies:[] ,resultsFilm:false));
    
    try{
      await api.conNect();
       
      if(state.movies.isEmpty){
          final movies = await api.getTopTrending();
          emit(state.copyWith(movies: movies,loadStatus: LoadStatus.Done,resultsFilm: false));
      }
      else{
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    }
    catch(ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
     print("heheheh");
    }
    
  }
  Future<void>getResultFilm(String query)async {
    
     emit(state.copyWith(loadStatus: LoadStatus.Loading,movies:[],resultsFilm: true ));
     try{
       await api.conNect();
       final movie =  await api.getResultFilm(query);
       if(movie.isNotEmpty){
        emit(state.copyWith(loadStatus: LoadStatus.Done,movies: movie,resultsFilm: true,));
       }
       else{
           emit(state.copyWith(loadStatus: LoadStatus.Error,resultsFilm: false,));
       }
       
     }
     catch(ex){
           emit(state.copyWith(loadStatus: LoadStatus.Error,resultsFilm: false,));
     }

  }
}

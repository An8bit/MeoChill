import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';

import '../../../../repostsitories/api.dart';
import 'package:meochill/common/enum/category_item.dart';


class SortCubit extends Cubit<SortState> {
   final Api api;
  SortCubit(this.api) : super(SortState.init());
    Future<void>getTypeMovie()async {
      emit(state.copyWith(loadStatus: LoadStatus.Loading,movies: []));
      try{
        await api.conNect();
        final listhoathinh = await api.getTypeMovie("hoathinh");
        if(state.movies.isEmpty&&listhoathinh.isNotEmpty){
            emit(state.copyWith(loadStatus: LoadStatus.Done,movies:listhoathinh,typeMovies:TypeMovies.hoathinh ));
        }
        
        else{
            emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
        }
      }
      catch(ex){
            emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
            
      }
    }
  Future<void>getTypehanhdong()async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading,movies: []));
    try{
      await api.conNect();
      final listhanhdong = await api.getTypeMovie("hanhdong");
      if(state.movies.isEmpty){
          emit(state.copyWith(loadStatus: LoadStatus.Done,movies:listhanhdong,typeMovies:TypeMovies.hanhdong ));
      }
      else{
          emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
      }
    }
    catch(ex){
          emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
          
    }
  }
  Future<void>getTypehai()async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading,movies: []));
    try{
      await api.conNect();
      final listhai = await api.getTypeMovie("hai");
      if(state.movies.isEmpty){
          emit(state.copyWith(loadStatus: LoadStatus.Done,movies:listhai,typeMovies:TypeMovies.hai ));
      }
      else{
          emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
      }
    }
    catch(ex){
          emit(state.copyWith(loadStatus: LoadStatus.Error,movies: [],));
          
    }
  }
 
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final Api api;

  SearchCubit(this.api) : super(SearchState.init());

  Future<void> getTopTrending() async {

    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      await api.conNect();
      final movies = await api.getTopTrending();
      if (movies.isNotEmpty) {
        
        emit(state.copyWith(movies: movies, loadStatus: LoadStatus.Done));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
      print('Error fetching top trending movies: $e');
    }
  }
}

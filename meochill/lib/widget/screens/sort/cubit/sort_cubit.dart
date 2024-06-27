import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/common/enum/category_item.dart';

class SortCubit extends Cubit<SortState> {
  final Api api;
  SortCubit(this.api) : super(SortState.init());

  Future<void> getTypeMovie(String string) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading, movies: []));
    try {
      await api.conNect();
      final listhoathinh = await api.getTypeMovie(string);
      if (listhoathinh.isNotEmpty) {
        emit(state.copyWith(loadStatus: LoadStatus.Done, movies: listhoathinh, typeMovies: TypeMovies.hoathinh));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error, movies: []));
      }
    } catch (ex) {
      print("Error in getTypeMovie: $ex");
      emit(state.copyWith(loadStatus: LoadStatus.Error, movies: []));
    }
  }
}
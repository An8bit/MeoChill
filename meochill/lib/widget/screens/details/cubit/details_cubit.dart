import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meochill/models/episode.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../models/movie.dart';
import '../../../../repostsitories/api.dart';



part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final Api api;
  DetailsCubit(this.api) : super(DetailsState.init());


 Future<void> getNameCategory(Movie movie) async {
   emit(state.copyWith(loadStatus: LoadStatus.Loading));
   try {
    List<String> listid = movie.category_ids?.where((Category) => Category != null).cast<String>().toList() ?? [];
    final List<String> NameCategory = await api.getNameCategory(listid);
    List<Episode> listEpisode = await api.getEpisode(movie.id!);
     
     emit(state.copyWith( loadStatus: LoadStatus.Done, NameCategory: NameCategory, episodes: listEpisode));
   } catch (e) {
     emit(state.copyWith(loadStatus: LoadStatus.Error));
   }
  }
}

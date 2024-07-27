import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../models/movie.dart';
import '../../../../repostsitories/api.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final Api api;

  FavoriteCubit(this.api) : super(FavoriteState.init());

  Future<void> showListfavorite() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('email');
      if (userJson != null) {
        emit(state.copyWith(loadStatus: LoadStatus.Loading));
        await api.conNect();
        var ListMoviefavoriteId = await api.getListFavorite(userJson);
        if (ListMoviefavoriteId.isNotEmpty) {
          return emit(state.copyWith(
              loadStatus: LoadStatus.Done, movies: ListMoviefavoriteId));
        } else {
          return emit(state.copyWith(
            loadStatus: LoadStatus.Error,
          ));
        }
      }
    } catch (ex) {
      print('lỗi khi lấy dữ liệu tại{$ex}');
      return emit(state.copyWith(
        loadStatus: LoadStatus.Error,
      ));
    }
  }

  Future<void> addFavorite(ObjectId id) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('email');
    try {
      emit(state.copyWith(loadStatus: LoadStatus.Loading));
      await api.conNect();
      if (userJson != null) {
        String userIdString = id.oid;
        await api.addFavorite(userJson, userIdString);
        await checkFavorite(id);
        emit(state.copyWith(loadStatus: LoadStatus.Done));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
      }
    } catch (ex) {
      print('lỗi khi lấy dữ liệu tại addFavorite{$ex}');
      return emit(state.copyWith(
        loadStatus: LoadStatus.Error,
      ));
    }
  }
  Future<bool>removeFavorite(ObjectId id) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('email');
    try {
      emit(state.copyWith(loadStatus: LoadStatus.Loading));
      await api.conNect();
      if (userJson != null) {
       String userIdString = id.oid;
        await api.deleteFavorite(userJson, userIdString);
        showListfavorite();
        emit(state.copyWith(loadStatus: LoadStatus.Done));
        return true;
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
        return false;
      }
    } catch (ex) {
      print('lỗi khi lấy dữ liệu tại removeFavorite{$ex}');
      return false;
    }
  }
   Future<bool> checkFavorite (ObjectId id) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('email');
    try {
      emit(state.copyWith(loadStatus: LoadStatus.Loading));
      await api.conNect();
      if (userJson != null) {
        String userIdString = id.oid;
        bool result = await api.checkFavorite(userJson, userIdString);
        emit(state.copyWith(loadStatus: LoadStatus.Done, isFavorite: result));
        return result;
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.Error));
        return false;
      }
    } catch (ex) {
      print('lỗi khi lấy dữ liệu tại checkFavorite{$ex}');
      return false;
    }
}

}

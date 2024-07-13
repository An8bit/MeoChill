

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meochill/common/enum/drawer_item.dart';
import 'package:meochill/repostsitories/api.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final Api api;
  MainCubit(this.api) : super(  MainState.init());
  void setSelected(DrawerItem selected) {
    emit(state.copyWith(selected: selected));
  }

  void setTheme(bool isLightTheme) {
    emit(state.copyWith(isLightTheme: isLightTheme));
  }
  Future<void> changeLanguage(String language,String L) async {
    Locale newLocale = Locale(language,L);
    emit(state.copyWith(locale: newLocale));
  }
}

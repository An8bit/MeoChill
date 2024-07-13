

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meochill/common/enum/drawer_item.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(  MainState.init());
  void setSelected(DrawerItem selected) {
    emit(state.copyWith(selected: selected));
  }

  void setTheme(bool isLightTheme) {
    emit(state.copyWith(isLightTheme: isLightTheme));
  }
  Future<void> changeLanguage(String language) async {
    Locale newLocale = Locale(language);
    emit(state.copyWith(locale: newLocale));
  }
}

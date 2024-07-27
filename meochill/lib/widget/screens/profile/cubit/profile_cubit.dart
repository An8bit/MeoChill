import 'package:bloc/bloc.dart';

import 'package:meochill/common/enum/load_status.dart';

import 'package:meochill/widget/screens/profile/cubit/profile_state.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../repostsitories/api.dart';


class ProfileCubit extends Cubit<ProfileState> { 
  final Api api;
  ProfileCubit(this.api) : super(ProfileState.init());

   Future<void> loadSession() async {
    
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('email');
    if (userJson != null) {
       try {
         emit(state.copyWith(loadStatus: LoadStatus.Loading, account: []));
          
          await api.conNect();
          var result = await api.getListAccountByUserName(userJson);
          if (result.isNotEmpty) {
            
            emit(state.copyWith(loadStatus : LoadStatus.Done,account: result));

          }
          else {
            emit(state.copyWith(loadStatus : LoadStatus.Error,));
          }
          
    } catch(ex) { 
      print(ex);
      emit(state.copyWith(loadStatus : LoadStatus.Error,));
    }
    }
  }
    Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
      emit(state.copyWith(loadStatus: LoadStatus.Error, account: []));
  }
  
}

import 'package:bloc/bloc.dart';

import 'package:meochill/common/enum/load_status.dart';

import 'package:meochill/widget/screens/profile/cubit/profile_state.dart';


import '../../../../repostsitories/api.dart';


class ProfileCubit extends Cubit<ProfileState> { 
  final Api api;
  ProfileCubit(this.api) : super(ProfileState.init());

  Future <void> getListAccountByUserName(String email) async {
    

    emit(state.copyWith(loadStatus: LoadStatus.Loading, account: []));
    try {
          
          await api.conNect();
          var result = await api.getListAccountByUserName(email);
          if (result.isNotEmpty) {
            emit(state.copyWith(loadStatus : LoadStatus.Done, account: result));
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

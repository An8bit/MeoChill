import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meochill/models/actor.dart';
import 'package:meochill/models/episode.dart';

import '../../../../common/enum/load_status.dart';
import '../../../../models/movie2.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState.init());


  
}

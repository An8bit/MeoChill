

import '../../../../common/enum/load_status.dart';

class  PremiumState {
final bool isPremium;
final LoadStatus loadStatus;

PremiumState({this.isPremium = false, this.loadStatus = LoadStatus.Loading});

PremiumState.Init() : this(isPremium: false, loadStatus: LoadStatus.Loading);

PremiumState copyWith({bool? isPremium, LoadStatus? loadStatus}) {
  return PremiumState(
    isPremium: isPremium ?? this.isPremium,
    loadStatus: loadStatus ?? this.loadStatus,
  );}
 
 @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PremiumState &&
      other.isPremium == isPremium &&
      other.loadStatus == loadStatus;
  }

  @override
  int get hashCode => isPremium.hashCode ^ loadStatus.hashCode;

  @override
  String toString() => 'PremiumState(isPremium: $isPremium, loadStatus: $loadStatus)';  


  
}



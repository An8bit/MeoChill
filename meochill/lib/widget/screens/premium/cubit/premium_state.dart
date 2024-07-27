import '../../../../common/enum/load_status.dart';

class  PremiumState {
final bool isPremium;
final LoadStatus loadStatus;
final bool isMoviePremium;
final bool isguestLecture;

PremiumState(this.isguestLecture, {
  required this.isPremium,
  required this.loadStatus,
  required this.isMoviePremium,
});

PremiumState.init({
  this.isPremium = false,
  this.loadStatus = LoadStatus.Init,
  this.isMoviePremium = false,
  this.isguestLecture = false,
});

PremiumState copyWith({
  bool? isPremium,
  LoadStatus? loadStatus,
  bool? isMoviePremium,
  bool? isguestLecture,
}) {
  return PremiumState(
    isguestLecture ?? this.isguestLecture,
    isPremium: isPremium ?? this.isPremium,
    loadStatus: loadStatus ?? this.loadStatus,
    isMoviePremium: isMoviePremium ?? this.isMoviePremium,
  );
}



@override
bool operator ==(covariant PremiumState other) {
  if (identical(this, other)) return true;

  return other.isPremium == isPremium &&
      other.loadStatus == loadStatus &&
      other.isMoviePremium == isMoviePremium &&
      other.isguestLecture == isguestLecture;

}
@override
int get hashCode =>
  isPremium.hashCode ^ loadStatus.hashCode ^ isMoviePremium.hashCode ^ isguestLecture.hashCode;
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

class MainState {
 
final bool isLightThem;
final DrawerItem selected;
  MainState({
    required this.isLightThem,
    required this.selected,
  });
const MainState.init({
     this.isLightThem =false,
    this.selected = DrawerItem.Home
     
  });

  MainState copyWith({
    bool? isLightThem,
    DrawerItem? selected,
  }) {
    return MainState(
      isLightThem: isLightThem ?? this.isLightThem,
      selected: selected ?? this.selected,
    );
  }

  @override
  String toString() => 'MainState(isLightThem: $isLightThem, selected: $selected)';

  @override
  bool operator ==(covariant MainState other) {
    if (identical(this, other)) return true;
  
    return 
      other.isLightThem == isLightThem &&
      other.selected == selected;
  }

  @override
  int get hashCode => isLightThem.hashCode ^ selected.hashCode;
}

part of 'main_cubit.dart';

class MainState {
  final bool isLightTheme;
  final DrawerItem selected;

  const MainState.init({this.isLightTheme = true, this.selected = DrawerItem.Home});

//<editor-fold desc="Data Methods">
  const MainState({
    required this.isLightTheme,
    required this.selected,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainState &&
          runtimeType == other.runtimeType &&
          isLightTheme == other.isLightTheme &&
          selected == other.selected);

  @override
  int get hashCode => isLightTheme.hashCode ^ selected.hashCode;

  @override
  String toString() {
    return 'MainState{' + ' isLightTheme: $isLightTheme,' + ' selected: $selected,' + '}';
  }

  MainState copyWith({
    bool? isLightTheme,
    DrawerItem? selected,
  }) {
    return MainState(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLightTheme': this.isLightTheme,
      'selected': this.selected,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      isLightTheme: map['isLightTheme'] as bool,
      selected: map['selected'] as DrawerItem,
    );
  }

//</editor-fold>
}

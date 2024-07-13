part of 'main_cubit.dart';

class MainState {
  final bool isLightTheme;
  final DrawerItem selected;
  final Locale locale;

  MainState.init({this.isLightTheme = true, this.selected = DrawerItem.Home, this.locale = const Locale('vi', 'VN')});

//<editor-fold desc="Data Methods">
  const MainState({
    required this.isLightTheme,
    required this.selected,
    required this.locale,
  });

  
      

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainState &&
          runtimeType == other.runtimeType &&
          isLightTheme == other.isLightTheme &&
          selected == other.selected &&
          locale == other.locale);

  @override
  int get hashCode => isLightTheme.hashCode ^ selected.hashCode ^ locale.hashCode;

  @override
  String toString() {
    return 'MainState{' + ' isLightTheme: $isLightTheme,' + ' selected: $selected,' + ' locale: $locale,' + '}';
  }

  MainState copyWith({
    bool? isLightTheme,
    DrawerItem? selected,
    Locale? locale,
  }) {
    return MainState(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      selected: selected ?? this.selected,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLightTheme': this.isLightTheme,
      'selected': this.selected,
      'locale': this.locale,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      isLightTheme: map['isLightTheme'] as bool,
      selected: map['selected'] as DrawerItem,
      locale: map['locale'] as Locale,
    );
  }

}

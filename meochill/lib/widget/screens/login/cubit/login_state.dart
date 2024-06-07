// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:meochill/common/enum/load_status.dart';

class LoginState {
  final LoadStatus loadStatus;

  LoginState({
    required this.loadStatus,
  });

  LoginState.init({
    this.loadStatus = LoadStatus.Init,
  });

  LoginState copyWith({
    LoadStatus? loadStatus,
  }) {
    return LoginState(
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  String toString() => 'LoginState(loadStatus: $loadStatus)';

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.loadStatus == loadStatus;
  }

  @override
  int get hashCode => loadStatus.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadStatus': loadStatus,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      loadStatus: map['loadStatus'] as LoadStatus,
    );
  }
}

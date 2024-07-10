// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:meochill/common/enum/load_status.dart';

import 'register_cubit.dart';
class RegisterState {
final LoadStatus loadStatus;
final bool confirmpass;
final bool verifyaccount;
  RegisterState({
    required this.loadStatus,
    required this.confirmpass,
    required this.verifyaccount,
  });

  RegisterState copyWith({
    LoadStatus? loadStatus,
    bool? confirmpass,
    bool? verifyaccount,
  }) {
    return RegisterState(
      loadStatus: loadStatus ?? this.loadStatus,
      confirmpass: confirmpass ?? this.confirmpass,
      verifyaccount: verifyaccount ?? this.verifyaccount,
    );
  }
   RegisterState.init({
    this.loadStatus = LoadStatus.Init,
    this.confirmpass=false,
    this.verifyaccount=false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadStatus': loadStatus,
      'confirmpass': confirmpass,
      'verifyaccount': verifyaccount,
    };
  }

  factory RegisterState.fromMap(Map<String, dynamic> map) {
    return RegisterState(
      loadStatus: map['loadStatus'] as LoadStatus,
      confirmpass: map['confirmpass'] as bool,
      verifyaccount: map['verifyaccount'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterState.fromJson(String source) => RegisterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterState(loadStatus: $loadStatus, confirmpass: $confirmpass, verifyaccount: $verifyaccount)';

  @override
  bool operator ==(covariant RegisterState other) {
    if (identical(this, other)) return true;
  
    return 
      other.loadStatus == loadStatus &&
      other.confirmpass == confirmpass &&
      other.verifyaccount == verifyaccount;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ confirmpass.hashCode ^ verifyaccount.hashCode;
} 



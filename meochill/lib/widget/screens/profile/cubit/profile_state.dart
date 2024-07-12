// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../common/enum/load_status.dart';
import '../../../../models/account.dart';


class ProfileState {
  final LoadStatus loadStatus;
  final  List<Account> account; 
  final String email;
  ProfileState({
    required this.loadStatus,
    required this.account,
    required this.email,
  });

  ProfileState.init({
    this.loadStatus = LoadStatus.Init,
    this.account = const[],
    this.email = "",
  });

  ProfileState copyWith({
    LoadStatus? loadStatus,
    List <Account>? account,
    String? email,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
      account: account ?? this.account, email:email ?? this.email,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadStatus': loadStatus,
      'account': account,
      'email':email,
    };
  }

  factory ProfileState.fromMap(Map<String, dynamic> map) {
    return ProfileState(
      loadStatus: map['loadStatus'] as LoadStatus,
      account: List <Account>.from(map['account'] as List<Account>), email: map['email']as String
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileState.fromJson(String source) => ProfileState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileState(loadStatus: $loadStatus, account: $account,email : $email)';

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;
  
    return 
      other.loadStatus == loadStatus &&
      other.account == account&&
      other.email==email;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ account.hashCode^email.hashCode;
}


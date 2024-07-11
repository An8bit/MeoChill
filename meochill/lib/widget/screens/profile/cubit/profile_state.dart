// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../common/enum/load_status.dart';
import '../../../../models/account.dart';


class ProfileState {
  final LoadStatus loadStatus;
  final  List<Account> account; 
  ProfileState({
    required this.loadStatus,
    required this.account,
  });

  ProfileState.init({
    this.loadStatus = LoadStatus.Init,
    this.account = const[],
  });

  ProfileState copyWith({
    LoadStatus? loadStatus,
    List <Account>? account,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
      account: account ?? this.account,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadStatus': loadStatus,
      'account': account,
    };
  }

  factory ProfileState.fromMap(Map<String, dynamic> map) {
    return ProfileState(
      loadStatus: map['loadStatus'] as LoadStatus,
      account: List <Account>.from(map['account'] as List<Account>)
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileState.fromJson(String source) => ProfileState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileState(loadStatus: $loadStatus, account: $account)';

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;
  
    return 
      other.loadStatus == loadStatus &&
      other.account == account;
  }

  @override
  int get hashCode => loadStatus.hashCode ^ account.hashCode;
}


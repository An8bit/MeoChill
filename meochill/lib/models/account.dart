// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class Account {
  ObjectId?  id;
  String? username;
  String? password;
  String? email;
  String? createdat;
  String? updatedat;
  String? favoriteid;
  bool? premium;

  Account({
    this.id,
    this.username,
    this.password,
    this.email,
    this.createdat,
    this.updatedat,
    this.favoriteid,
  });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
    favoriteid = json['favorite_id'];
    premium = json['premium'];
  }

  Account copyWith({
    ObjectId? id,
    String? username,
    String? password,
    String? email,
    String? createdat,
    String? updatedat,
    String? favoriteid,
  }) {
    return Account(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      createdat: createdat ?? this.createdat,
      updatedat: updatedat ?? this.updatedat,
      favoriteid: favoriteid ?? this.favoriteid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'username': username,
      'password': password,
      'email': email,
      'createdat': createdat,
      'updatedat': updatedat,
      'favoriteid': favoriteid,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['_id']!=null? map['_id']as ObjectId : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      createdat: map['createdat'] != null ? map['createdat'] as String : null,
      updatedat: map['updatedat'] != null ? map['updatedat'] as String : null,
      favoriteid:
          map['favoriteid'] != null ? map['favoriteid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Account(username: $username, password: $password, email: $email, createdat: $createdat, updatedat: $updatedat, favoriteid: $favoriteid,_id: $id,)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.email == email &&
        other.createdat == createdat &&
        other.updatedat == updatedat &&
        other.favoriteid == favoriteid&&
        other.id==id;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        createdat.hashCode ^
        updatedat.hashCode ^
        favoriteid.hashCode^
        id.hashCode;
  }
}

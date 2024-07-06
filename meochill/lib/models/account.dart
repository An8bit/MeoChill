// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
   String? username;
   String? password;
  Account({
     this.username,
     this.password,
  });
  
  Account copyWith({
    String? username,
    String? password,
  }) {
    return Account(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Account(username: $username, password: $password)';

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
  }

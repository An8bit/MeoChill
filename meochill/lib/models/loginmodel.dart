// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Loginmodel {
  final String username;
  final String password;
  Loginmodel({
    required this.username,
    required this.password,
  });
  

  Loginmodel copyWith({
    String? username,
    String? password,
  }) {
    return Loginmodel(
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

  factory Loginmodel.fromMap(Map<String, dynamic> map) {
    return Loginmodel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loginmodel.fromJson(String source) => Loginmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Loginmodel(username: $username, password: $password)';

  @override
  bool operator ==(covariant Loginmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
  }

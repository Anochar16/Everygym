// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class userAccountModel {
  final String email;
  final String userName;
  userAccountModel({
    required this.email,
    required this.userName,
  });

  userAccountModel copyWith({
    String? email,
    String? userName,
  }) {
    return userAccountModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
    };
  }

  factory userAccountModel.fromMap(Map<String, dynamic> map) {
    return userAccountModel(
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory userAccountModel.fromJson(String source) => userAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'userAccountModel(email: $email, userName: $userName)';

  @override
  bool operator ==(covariant userAccountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.userName == userName;
  }

  @override
  int get hashCode => email.hashCode ^ userName.hashCode;
}

part of 'loginIn_user_credential_cubit.dart';

class RememberusercredentialsState extends Equatable {
  final String email;
  final String password;

  const RememberusercredentialsState({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory RememberusercredentialsState.fromMap(Map<String, dynamic> map) {
    return RememberusercredentialsState(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RememberusercredentialsState.fromJson(String source) =>
      RememberusercredentialsState.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

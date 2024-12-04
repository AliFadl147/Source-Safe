import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int? status;
  final String? token;
  final String? refreshTokenExpiration;

  const LoginModel({this.status, this.token, this.refreshTokenExpiration});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as int?,
        token: json['token'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'token': token,
        'refreshTokenExpiration': refreshTokenExpiration,
      };

  @override
  List<Object?> get props => [status, token, refreshTokenExpiration];
}

import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int? status;
  final String? token;

  const LoginModel({this.status, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as int?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'token': token,
      };

  @override
  List<Object?> get props => [status, token];
}

import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final int? status;
  final String? message;

  const RegisterModel({this.status, this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };

  @override
  List<Object?> get props => [status, message];
}

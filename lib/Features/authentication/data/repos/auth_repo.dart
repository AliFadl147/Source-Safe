import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/authentication/data/models/login_model.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/authentication/data/requests/auth_requests.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, RegisterModel>> addDeviceToken(
      String id, String deviceToken);
}

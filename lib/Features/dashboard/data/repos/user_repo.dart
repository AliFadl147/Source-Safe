import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/users_model.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class UserRepo {
  Future<Either<Failure, UsersModel>> getAllUsers(
      {required int id, String? search});
  Future<Either<Failure, RegisterModel>> addGroup({
    required String userId,
    required String groupName,
    required List<int> userIds,
  });
}

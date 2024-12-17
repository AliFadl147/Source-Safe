import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/users_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
import 'package:source_safe_project/core/errors/failures.dart';
import 'package:source_safe_project/core/utils/api_service.dart';

class UserRepoImpl implements UserRepo {
  final ApiService apiService;

  UserRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UsersModel>> getAllUsers(
      {required int id, String? search}) async {
    try {
      var data = await apiService.get(
          endPoint: search != null
              ? '/User/GetAllUsers?Id=$id&Search=$search'
              : '/User/GetAllUsers?Id=$id');

      UsersModel usersModel = UsersModel.fromJson(data);

      return right(usersModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> addGroup({
    required String userId,
    required String groupName,
    required List<int> userIds,
  }) async {
    try {
      var result =
          await apiService.post(endPoint: '/Group/AddGroup/$userId', data: {
        'groupName': groupName,
        'userIds': userIds,
      });

      final value = RegisterModel.fromJson(result);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(
          AuthServerFailure.fromDioError(e),
        );
      }
      return left(
        AuthServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/user_report_model/user_report_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/users_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
import 'package:source_safe_project/core/errors/failures.dart';
import 'package:source_safe_project/core/utils/api_service.dart';

class UserRepoImpl implements UserRepo {
  final ApiService apiService;

  UserRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UsersModel>> getAllUsers(
      {required String id, String? search}) async {
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

  @override
  Future<Either<Failure, RegisterModel>> uploadFile({
    required int groupId,
    required String userId,
    required Uint8List fileBytes,
    required String fileName,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': fileName,
        'groupId': groupId,
        'formFile': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
        'userId': userId,
      });

      var result = await apiService.postFormData(
        endPoint: '/File/AddFile',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      final value = RegisterModel.fromJson(result);
      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(AuthServerFailure.fromDioError(e));
      }
      return left(AuthServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserReportModel>> getUserReport(
      {required int groupId}) async {
    try {
      var data = await apiService.get(endPoint: '/Report/GetUserReport?GroupId=$groupId');

      UserReportModel userReportModel = UserReportModel.fromJson(data);

      return right(userReportModel);
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
}

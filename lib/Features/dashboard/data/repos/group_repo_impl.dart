import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:source_safe_project/Features/dashboard/data/models/group_model/group_model/group_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/group_repo.dart';
import 'package:source_safe_project/core/errors/failures.dart';
import 'package:source_safe_project/core/utils/api_service.dart';

class GroupRepoImpl implements GroupRepo {
  final ApiService apiService;

  GroupRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GroupModel>> getUserGroups(
      {required int userId}) async {
    try {
      var data = await apiService.get(endPoint: '/Group/GetUserGroups/$userId');

      GroupModel usersModel = GroupModel.fromJson(data);

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
}

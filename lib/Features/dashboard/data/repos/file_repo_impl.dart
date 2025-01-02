import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:source_safe_project/Features/dashboard/data/models/file_model/file_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/file_repo.dart';
import 'package:source_safe_project/core/errors/failures.dart';
import 'package:source_safe_project/core/utils/api_service.dart';

class FileRepoImpl implements FileRepo {
  final ApiService apiService;

  FileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, FileModel>> getGroupFiles(
      {required int groupId}) async {
    try {
      var data = await apiService.get(endPoint: '/File/GetGroupFiles?GroupId=$groupId');

      FileModel fileModel = FileModel.fromJson(data);

      return right(fileModel);
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

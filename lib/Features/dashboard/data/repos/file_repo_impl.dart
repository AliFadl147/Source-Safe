import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
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
      var data = await apiService.get(
          endPoint: '/File/GetGroupFiles?GroupId=$groupId');

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

  @override
  Future<Either<Failure, RegisterModel>> checkIn(
      {required String userId, required List<int> fileIds}) async {
    try {
      var result = await apiService.post(endPoint: '/File/Check_in', data: {
        'userId': userId,
        'fileIds': fileIds,
      });

      final value = RegisterModel.fromJson(result);

      return right(value);
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
  Future<Either<Failure, RegisterModel>> checkOut(
      {required String userId,
      required int fileId,
      required Uint8List fileBytes,
      required String fileName,
      required bool edited}) async {
    try {
      FormData formData = FormData.fromMap({
        'formFile': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      });

      var result = await apiService.postFormData(
        endPoint:
            '/File/Check_out?UserId=$userId&FileId=$fileId&Edited=$edited',
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
}

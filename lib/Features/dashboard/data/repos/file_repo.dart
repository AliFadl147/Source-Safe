import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/dashboard/data/models/file_model/file_model.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class FileRepo {
  Future<Either<Failure, FileModel>> getGroupFiles({
    required int groupId,
  });
}

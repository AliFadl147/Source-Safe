import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/file_model/file_model.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class FileRepo {
  Future<Either<Failure, FileModel>> getGroupFiles({
    required int groupId,
  });
  Future<Either<Failure, RegisterModel>> checkIn({
    required String userId,
    required List<int> fileIds,
  });
  Future<Either<Failure, RegisterModel>> checkOut({
    required String userId,
    required int fileId,
    required Uint8List fileBytes,
    required String fileName,
    required bool edited,
  });
}

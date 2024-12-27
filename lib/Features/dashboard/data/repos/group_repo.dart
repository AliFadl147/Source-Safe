import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/dashboard/data/models/group_model/group_model/group_model.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class GroupRepo {
  Future<Either<Failure, GroupModel>> getUserGroups(
      {required String userId,});
}

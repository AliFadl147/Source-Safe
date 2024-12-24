import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/models/group_model/group_model/group_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/group_repo.dart';
part 'get_user_groups_state.dart';

class GetUserGroupsCubit extends Cubit<GetUserGroupsState> {
  GetUserGroupsCubit(this.groupRepo) : super(GetUserGroupsInitialState());

  static GetUserGroupsCubit get(context) => BlocProvider.of(context);

  final GroupRepo groupRepo;

  Future<void> getUserGroups({required int userId,}) async {
    emit(GetUserGroupsLoading());
    var result = await groupRepo.getUserGroups(userId: userId);
    result.fold((failure) {
      emit(GetUserGroupsFailure(failure.errMessage));
    }, (data) {
      emit(GetUserGroupsSuccess(data));
    });
  }
}


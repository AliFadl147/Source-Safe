import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'add_group_state.dart';

class AddGroupCubit extends Cubit<AddGroupState> {
  AddGroupCubit(this.userRepo) : super(AddGroupInitialState());

  static AddGroupCubit get(context) => BlocProvider.of(context);

  final UserRepo userRepo;

  bool isLoading = false;

  Future<void> addGroup(BuildContext context) async {
    isLoading = true;
    emit(AddGroupLoadingState());
    var result = await userRepo.addGroup(
      userId: userId,
      groupName: CreateGroupCubit.get(context).createGroupObject.groupName,
      userIds: selectedindexes,
    );
    result.fold((failure) {
      isLoading = false;
      emit(AddGroupFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;

      emit(AddGroupSuccessState());
    });
  }
}

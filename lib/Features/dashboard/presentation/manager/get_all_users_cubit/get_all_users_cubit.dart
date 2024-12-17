import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/users_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.userRepo) : super(GetAllUsersInitialState());

  static GetAllUsersCubit get(context) => BlocProvider.of(context);

  final UserRepo userRepo;

  Future<void> getAllUsers({required int id, String? search}) async {
    emit(GetAllUsersLoading());
    var result = await userRepo.getAllUsers(id: id, search: search);
    result.fold((failure) {
      emit(GetAllUsersFailure(failure.errMessage));
    }, (data) {
      emit(GetAllUsersSuccess(data));
    });
  }
}

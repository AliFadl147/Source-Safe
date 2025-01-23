import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/user_report_model/user_report_model.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
part 'get_user_report_state.dart';

class GetUserReportCubit extends Cubit<GetUserReportState> {
  GetUserReportCubit(this.userRepo) : super(GetUserReportStateInitialState());

  static GetUserReportCubit get(context) => BlocProvider.of(context);

  final UserRepo userRepo;

  Future<void> getUserReportCubit({
    required int groupId,
  }) async {
    emit(GetUserReportStateLoading());
    var result = await userRepo.getUserReport(groupId: groupId);
    result.fold((failure) {
      emit(GetUserReportStateFailure(failure.errMessage));
    }, (data) {
      emit(GetUserReportStateSuccess(data));
    });
  }
}

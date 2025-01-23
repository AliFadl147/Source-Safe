part of 'get_user_report_cubit.dart';

abstract class GetUserReportState {}

class GetUserReportStateInitialState extends GetUserReportState {}

final class GetUserReportStateLoading extends GetUserReportState {}

final class GetUserReportStateFailure extends GetUserReportState {
  final String errMessage;

  GetUserReportStateFailure(this.errMessage);
}

final class GetUserReportStateSuccess extends GetUserReportState {
  final UserReportModel userReportModel;

  GetUserReportStateSuccess(this.userReportModel);
}

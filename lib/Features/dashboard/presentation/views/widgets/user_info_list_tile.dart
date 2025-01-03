import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:source_safe_project/Features/dashboard/data/models/user_info_model.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
    required this.userInfoModel,
  });
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFAFAFA),
      elevation: 0,
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(
            userInfoModel.image,
          ),
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(userInfoModel.title,
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          subtitle: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(userInfoModel.subTitle,
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ),
    );
  }
}

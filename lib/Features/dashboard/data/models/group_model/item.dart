import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? groupId;
  final String? groupName;
  final String? groupAdminName;
  final int? usersCount;
  final int? filesCount;

  const Item({
    this.groupId,
    this.groupName,
    this.groupAdminName,
    this.usersCount,
    this.filesCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        groupId: json['groupId'] as int?,
        groupName: json['groupName'] as String?,
        groupAdminName: json['groupAdminName'] as String?,
        usersCount: json['usersCount'] as int?,
        filesCount: json['filesCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'groupId': groupId,
        'groupName': groupName,
        'groupAdminName': groupAdminName,
        'usersCount': usersCount,
        'filesCount': filesCount,
      };

  @override
  List<Object?> get props {
    return [
      groupId,
      groupName,
      groupAdminName,
      usersCount,
      filesCount,
    ];
  }
}

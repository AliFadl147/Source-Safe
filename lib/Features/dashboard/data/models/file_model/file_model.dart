import 'package:equatable/equatable.dart';

import 'item.dart';

class FileModel extends Equatable {
  final int? status;
  final List<Item> items;

  const FileModel({this.status, required this.items});

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        status: json['status'] as int?,
        items: (json['items'] as List<dynamic>)
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'items': items.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, items];
}

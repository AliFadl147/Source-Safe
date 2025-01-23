import 'package:equatable/equatable.dart';

import 'file.dart';

class Item extends Equatable {
	final String? userName;
	final List<File>? files;

	const Item({this.userName, this.files});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				userName: json['userName'] as String?,
				files: (json['files'] as List<dynamic>?)
						?.map((e) => File.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'userName': userName,
				'files': files?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [userName, files];
}

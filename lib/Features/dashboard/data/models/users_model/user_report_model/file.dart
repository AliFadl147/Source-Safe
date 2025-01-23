import 'package:equatable/equatable.dart';

class File extends Equatable {
	final String? fileName;
	final DateTime? checkedInAt;
	final DateTime? checkedOutAt;

	const File({this.fileName, this.checkedInAt, this.checkedOutAt});

	factory File.fromJson(Map<String, dynamic> json) => File(
				fileName: json['fileName'] as String?,
				checkedInAt: json['checked_inAt'] == null
						? null
						: DateTime.parse(json['checked_inAt'] as String),
				checkedOutAt: json['checked_outAt'] == null
						? null
						: DateTime.parse(json['checked_outAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'fileName': fileName,
				'checked_inAt': checkedInAt?.toIso8601String(),
				'checked_outAt': checkedOutAt?.toIso8601String(),
			};

	@override
	List<Object?> get props => [fileName, checkedInAt, checkedOutAt];
}

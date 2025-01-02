import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int fileId;
  final String? fileName;
  final String? filePath;
  final DateTime? lastUpdated;
  final bool? isReserved;

  const Item({
    required this.fileId,
    this.fileName,
    this.filePath,
    this.lastUpdated,
    this.isReserved,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        fileId: json['fileId'] as int,
        fileName: json['fileName'] as String?,
        filePath: json['filePath'] as String?,
        lastUpdated: json['lastUpdated'] == null
            ? null
            : DateTime.parse(json['lastUpdated'] as String),
        isReserved: json['isReserved'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'fileId': fileId,
        'fileName': fileName,
        'filePath': filePath,
        'lastUpdated': lastUpdated?.toIso8601String(),
        'isReserved': isReserved,
      };

  @override
  List<Object?> get props {
    return [
      fileId,
      fileName,
      filePath,
      lastUpdated,
      isReserved,
    ];
  }
}

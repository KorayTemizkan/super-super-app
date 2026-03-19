import 'package:equatable/equatable.dart';

class ObjectEntity extends Equatable {
  final int? objectID;
  final bool? isHighlight;
  final String? title;
  final String? objectName;
  final String? department;

  const ObjectEntity({
    this.objectID,
    this.isHighlight,
    this.title,
    this.objectName,
    this.department,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      objectID,
      isHighlight,
      title,
      objectName,
      department,
    ];
  }
}

import 'package:super_app/features/feed/domain/entities/object_entity.dart';

class ObjectModel extends ObjectEntity {
  const ObjectModel({
    int? objectID,
    bool? isHighlight,
    String? title,
    String? objectName,
    String? department,
  }) : super(
         objectID: objectID,
         isHighlight: isHighlight,
         title: title,
         objectName: objectName,
         department: department,
       );

  factory ObjectModel.fromJson(Map<String, dynamic> map) {
    return ObjectModel(
      objectID: map['objectID'] ?? 0,
      isHighlight: map['isHighlight'] ?? false,
      title: map['title'] ?? '',
      objectName: map['objectName'] ?? '',
      department: map['department'] ?? '',
    );
  }
}

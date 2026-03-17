import 'package:super_app/features/feed/domain/entities/department_entity.dart';

class DepartmentModel extends DepartmentEntity {
  const DepartmentModel({int? departmentId, String? displayName})
    : super(departmentId: departmentId, displayName: displayName);

    factory DepartmentModel.fromJson(Map<String, dynamic> map) {
      return DepartmentModel(
        departmentId: map['departmentId'] ?? 0,
        displayName: map['displayName'] ?? '',
      );
    }
}

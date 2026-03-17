import 'package:equatable/equatable.dart';

class DepartmentEntity extends Equatable {
  final int? departmentId;
  final String? displayName;

  const DepartmentEntity({this.departmentId, this.displayName});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      departmentId,
      displayName,
    ];
  }
}

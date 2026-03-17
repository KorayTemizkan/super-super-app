import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/domain/entities/department_entity.dart';

abstract class DepartmentRepository {
  Future<DataState<List<DepartmentEntity>>> getDepartments();
}

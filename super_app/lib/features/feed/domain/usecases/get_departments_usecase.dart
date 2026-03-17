import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/core/usecases/usecase.dart';
import 'package:super_app/features/feed/domain/entities/department_entity.dart';
import 'package:super_app/features/feed/domain/repository/department_repository.dart';

class GetDepartmentsUsecase
    implements Usecase<DataState<List<DepartmentEntity>>, void> {
  final DepartmentRepository _departmentRepository;

  GetDepartmentsUsecase(this._departmentRepository);

  @override
  Future<DataState<List<DepartmentEntity>>> call({void params}) {
    return _departmentRepository.getDepartments();
  }
}

/*

ArticleRepository isimli arayüze bana haberleri ver der. Bu kadar. Soyutlama yaptık

Örneğin hem ana ekranda hem de bildirimlerde haberleri çekmen gerekirse
bunu burada bir kere yapmış olucaksın

Test edilebilirdir

Yeni çalışan buraya baktığında uygulamanın neler yaptığını kolayca görür
*/
import 'package:equatable/equatable.dart';
import 'package:super_app/features/feed/domain/entities/department_entity.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object?> get props => [];
}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoading extends DepartmentState {}

final class DepartmentLoaded extends DepartmentState {
  final List<DepartmentEntity> departments;
  const DepartmentLoaded(this.departments);

  @override
  List<Object?> get props => [departments];
}

final class DepartmentError extends DepartmentState {
  final String message;
  const DepartmentError(this.message);

  @override
  List<Object?> get props => [message];
}

/*

! Sealed Class (Mühürlü dosya) diye bir şey varmış
Derleme zamanı güven ve sınırlandırılmış hiyerarşi sağlarmış (ayrıntılara şimdilik gerek yok)

? Initial State:
Uygulama ilk açıldığında hiçbir etkileşim yapmadığımızda oluşan ekranın durumudur

? Loading State:
Etkileşimler başladığı an çalışan fonksiyondur

? Loaded State:
Veri başarıyla geldiğinde olan durumdur

? Error State:
Veri başarısız geldiğinde olan durumdur


? Equatable kullanım nedenini zaten biliyorsun
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/domain/usecases/get_departments_usecase.dart';
import 'package:super_app/features/feed/presentation/cubit/department/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final GetDepartmentsUsecase _getDepartmentsUsecase;

  DepartmentCubit(this._getDepartmentsUsecase) : super(DepartmentInitial());

  Future<void> fetchDepartments() async {
    if (state is DepartmentLoaded) {
      return;
    }
    // YÜKLENİYOR
    emit(DepartmentLoading());

    // VERİLERİ ÇEK -> ADIM ADIM DATA KATMANINA KADAR GİDİYOR
    final dataState = await _getDepartmentsUsecase();

    // BAŞARILI OLMA DURUMUNA GÖRE DATASTATE FIRLAT
    if (dataState is DataSuccess && dataState.data != null) {
      emit(DepartmentLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(DepartmentError(dataState.error?.message ?? 'Bir hata olustu!'));
    }
  }
}

/*

! CUBİT
Daha önce tekrar etmiştim ama burada tekrar yazayım

Cubit -> Bloc (Business Logic Component) kütüphanesinin daha sade ve daha hafif kardeşidir.
Karmaşık event yapıları yerine doğrudan fonksiyonlar üzerinden çalışır

Sistemin üç ayağı vardır STATE <-> CUBIT <-> UI

State: Yükleniyor, Başarılı vb.
Cubit: Fonksiyonlar ve iş mantığı
UI: Görüntü

*/

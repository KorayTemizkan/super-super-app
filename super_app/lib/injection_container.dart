import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:super_app/core/constants/url_constant.dart';
import 'package:super_app/features/feed/data/datasources/remote/api_interceptor.dart';
import 'package:super_app/features/feed/data/datasources/remote/exhibition_api_service.dart';
import 'package:super_app/features/feed/data/repository/department_repository_impl.dart';
import 'package:super_app/features/feed/data/repository/search_response_repository_impl.dart';
import 'package:super_app/features/feed/domain/repository/department_repository.dart';
import 'package:super_app/features/feed/domain/repository/search_response_repository.dart';
import 'package:super_app/features/feed/domain/usecases/get_departments_usecase.dart';
import 'package:super_app/features/feed/domain/usecases/get_search_response_usecase.dart';
import 'package:super_app/features/feed/presentation/cubit/department/department_cubit.dart';
import 'package:super_app/features/feed/presentation/cubit/search_response/search_response_cubit.dart';

// Singleton katmanımız
final sl = GetIt.instance;

Future<void> init() async {
  // Biz gidip ilgili her sayfada dotenv.env['EXHIBITION_URL'] yapamayız. Tek yerden kontrol etmek gerekiyor
  sl.registerLazySingleton<UrlConstant>(
    () => UrlConstant(baseUrl: dotenv.env['EXHIBITION_URL'] ?? ''),
  );

  // ! KATMAN KATMAN İLERLİYOR DİKKAT ET

  // Eskiden Dio sınıfı içinde yaptığımızın birebir aynısını burada yapıyoruz. Bir dio nesnesi yaratıyoruz
  sl.registerLazySingleton(
    () =>
        Dio(
            BaseOptions(
              // Artık getit üzerinden erişiyoruz, eskiden:
              // baseUrl: 'https://jsonplaceholder.typicode.com', şeklinde olurdu
              baseUrl: sl<UrlConstant>().baseUrl,
              connectTimeout: const Duration(
                seconds: 10,
              ), // kaç saniye boyuncu bağlantıda kalınır
              receiveTimeout: const Duration(
                seconds: 10,
              ), // bağlandıktan sonra kaç saniye bekleyeceğiz
            ),
          )
          ..interceptors.addAll([
            ApiInterceptor(),
            // LogInterceptor(responseBody: true),
          ]),
  );

  // Yarattığımız dio nesnesini ApiService'imize veriyoruz
  sl.registerLazySingleton(() => ExhibitionApiService(sl<Dio>()));

  // ! DEPARTMENT
  // Api Servisimizi Impl kısmına veriyoruz
  sl.registerLazySingleton<DepartmentRepository>(
    () => DepartmentRepositoryImpl(sl<ExhibitionApiService>()),
  );
  sl.registerLazySingleton(
    () => GetDepartmentsUsecase(sl<DepartmentRepository>()),
  );
  // Bir kere üretiyoruz, sonuçta bir kere çekecek
  sl.registerLazySingleton(() => DepartmentCubit(sl()));

  // ! SEARCH RESPONSE
  sl.registerLazySingleton<SearchResponseRepository>(
    () => SearchResponseRepositoryImpl(sl<ExhibitionApiService>()),
  );
  sl.registerLazySingleton(
    () => GetSearchResponseUsecase(sl<SearchResponseRepository>()),
  );
  sl.registerLazySingleton(() => SearchResponseCubit(sl()));
}

/*

Main'de getit için init fonksiyonu çağrılır.
Dio üretilir -> Api Service'e verilir
Api Service üretilir -> RepositoryImp'e verilir
RepositoryImpl üretilir -> Repository'ye verilir
UseCase üretilir -> Cubit'e verilir

Özet Akış Şeması (Verinin Yolculuğu)

    Sen: Uygulamayı açtın (FeedPage).

    Cubit: "Hadi UseCase, bana verileri getir" dedi.

    UseCase: "Repository, sözleşmeye uygun şekilde verileri hazırla" dedi.

    Repository: "ApiService, Dio motorunu çalıştır ve şu linke git" dedi.

    ApiService: İnternetten JSON'u (Map) aldı ve Repository'ye verdi.

    Repository: O Map'i açtı, içindeki listeyi buldu, Modellere çevirdi ve Cubit'e geri gönderdi.

    Cubit: "Veri elimde!" diyerek State'i Loaded yaptı.

    UI: BlocBuilder haberi aldı ve listeyi ekrana çizdi.
*/

import 'package:dio/dio.dart';
import 'package:super_app/features/feed/data/models/department_model.dart';
import 'package:super_app/features/feed/data/models/object_model.dart';
import 'package:super_app/features/feed/data/models/search_response_model.dart';

class ExhibitionApiService {
  final Dio dio;

  // Eskiden her istek için Dio oluşturuyorduk. GetIt ile artık tek seferde oluşturuyoruz
  ExhibitionApiService(this.dio);

  // HTTP'ye göre hatayı daha iyi analiz etmemizi sağlıyor.
  String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Sunucuya bağlanılamadı, internetinizi kontrol edin.";
      case DioExceptionType.receiveTimeout:
        return "Sunucudan yanıt gelmesi çok uzun sürdü.";
      case DioExceptionType.badResponse:
        return "Sunucu hatası: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "İstek iptal edildi.";
      default:
        return "Beklenmedik bir hata oluştu.";
    }
  }

  // YouTube'den izlediğim duruma getirdim. 21 tane departman çekiyor
  // ! DEPARTMANLAR
  Future<Response<List<DepartmentModel>>> getDepartments() async {
    try {
      final response = await dio.get('/departments');

      if (response.statusCode == 200) {
        //print(response.data.toString());
        final List<dynamic> data = response.data['departments'];

        final departments = data
            .map((json) => DepartmentModel.fromJson(json))
            .toList();

        return Response(
          requestOptions: response.requestOptions,
          data: departments,
          statusCode: response.statusCode,
        );
      } else {
        throw Exception("Api hatasi: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final errorMessage = handleDioError(e);
      print(errorMessage);
      rethrow;
    }
  }

  // 1056 adet isHighlight=true ve isOnView=true olan öge var. Adım adım çekicez
  // ! ÖNE ÇIKANLAR
  /*
  Sen ilk 20 ögeye istek atıcan ve bu sana total = 1056 ve departmentIDs listesi dönecek
  sen bu ilgili 7, 47. 49. 100 gibi object ıdlere istek atıp klasik işleri yapacaksın. daha sonra
  kullanıcı sayfanın en altına gelince otomatik 20 tane daha lazım olacak ve api 21-40 arasına istek atıcak
  mevcut listene bu yeni ögeleri de ekleyeceksin
  */

  Future<Response<SearchResponseModel>> getSearchResponse() async {
    try {
      final response = await dio.get(
        'search?isOnView=true&isHighlight=true&q=*',
      );

      if (response.statusCode == 200) {
        // Tek bir nesne döneceği için map yapmıyoruz
        final searchResponse = SearchResponseModel.fromJson(response.data);

        return Response(
          requestOptions: response.requestOptions,
          data: searchResponse,
          statusCode: response.statusCode,
        );
      } else {
        throw Exception("Api hatasi: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final errorMessage = handleDioError(e);
      print(errorMessage);
      rethrow;
    }
  }

  /*
  Future<Response<List<ObjectModel>>> getFeaturedExhibitions() async {
    print('TESTBABAMTEST');
    try {
      final response = await dio.get(
        'search?isOnView=true&isHighlight=true&q=*',
      );

      if (response.statusCode == 200) {
        print(response.data.toString().length);
        final List<dynamic> data = response.data;

        final objects = data.map((json) => ObjectModel.fromJson(json)).toList();

        return Response(
          requestOptions: response.requestOptions,
          data: objects,
          statusCode: response.statusCode,
        );
      } else {
        throw Exception("Api hatasi: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final errorMessage = handleDioError(e);
      print(errorMessage);
      rethrow;
    }
  }
  */
}

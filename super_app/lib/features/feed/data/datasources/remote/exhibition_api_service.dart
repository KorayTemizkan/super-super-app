import 'package:dio/dio.dart';
import 'package:super_app/features/feed/data/models/department_model.dart';

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
  
  // YouTube'den izlediğim duruma getirdim
  Future<Response<List<DepartmentModel>>> getDepartments() async {
    try {
      final response = await dio.get('/departments');

      if (response.statusCode == 200) {
        print(response.data.toString());
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
}

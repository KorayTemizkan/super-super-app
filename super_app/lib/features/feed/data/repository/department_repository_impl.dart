import 'dart:io';

import 'package:dio/dio.dart';
import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/data/datasources/remote/exhibition_api_service.dart';
import 'package:super_app/features/feed/data/models/department_model.dart';
import 'package:super_app/features/feed/domain/repository/department_repository.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final ExhibitionApiService exhibitionApiService;

  DepartmentRepositoryImpl(this.exhibitionApiService);

  @override
  Future<DataState<List<DepartmentModel>>> getDepartments() async {
    try {
      final response = await exhibitionApiService.getDepartments();

      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data!);
      } else {
        return DataFailed(
          DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

/*

Bu sınıf, domain katmanındaki soyut ArticleRepository arayüzünü uygular.
Yani veri nasıl çekilecek sorusunun gerçek cevabı buradadır.

Mesela NewsApiService yerine başka bir api kullanmak istersek bu sayfada sadece final response kısmını değiştireceğiz.
Diğer her şey aynı kalacak. Bağımsız olmayı sağladık

ArticleModel Listesi döndürüyoruz çünkü data katmanında ham veriyle çalışırız

Sonucu DataSuccess ile sarmalayıp uı'ye öyle veriyoruz. 
*/

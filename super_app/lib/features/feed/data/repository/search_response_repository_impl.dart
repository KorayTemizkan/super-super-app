import 'dart:io';
import 'package:dio/dio.dart';
import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/data/datasources/remote/exhibition_api_service.dart';
import 'package:super_app/features/feed/data/models/search_response_model.dart';
import 'package:super_app/features/feed/domain/repository/search_response_repository.dart';

class SearchResponseRepositoryImpl implements SearchResponseRepository {
  final ExhibitionApiService _exhibitionApiService;

  SearchResponseRepositoryImpl(this._exhibitionApiService);

  
  @override
  Future<DataState<SearchResponseModel>> getSearchResponse() async {
    try {
      final response = await _exhibitionApiService.getSearchResponse();

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

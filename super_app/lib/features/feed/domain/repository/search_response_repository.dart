import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/domain/entities/search_response_entity.dart';

abstract class SearchResponseRepository {
  Future<DataState<SearchResponseEntity>> getSearchResponse();
}

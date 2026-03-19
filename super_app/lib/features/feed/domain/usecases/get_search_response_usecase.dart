import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/core/usecases/usecase.dart';
import 'package:super_app/features/feed/domain/entities/search_response_entity.dart';
import 'package:super_app/features/feed/domain/repository/search_response_repository.dart';

class GetSearchResponseUsecase
    implements Usecase<DataState<SearchResponseEntity>, void> {
  final SearchResponseRepository _searchResponseRepository;

  GetSearchResponseUsecase(this._searchResponseRepository);

  @override
  Future<DataState<SearchResponseEntity>> call({void params}) {
    return _searchResponseRepository.getSearchResponse();
  }
}

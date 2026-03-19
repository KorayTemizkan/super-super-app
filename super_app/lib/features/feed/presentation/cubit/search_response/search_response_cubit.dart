import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/resources/data_state.dart';
import 'package:super_app/features/feed/domain/usecases/get_search_response_usecase.dart';
import 'package:super_app/features/feed/presentation/cubit/search_response/search_response_state.dart';

class SearchResponseCubit extends Cubit<SearchResponseState> {
  final GetSearchResponseUsecase _getSearchResponseUsecase;

  SearchResponseCubit(this._getSearchResponseUsecase)
    : super(SearchResponseInitial());

  Future<void> fetchSearchResponse() async {
    if (state is SearchResponseLoaded) {
      return;
    }

    emit(SearchResponseLoading());

    final dataState = await _getSearchResponseUsecase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(SearchResponseLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(SearchResponseError(dataState.error?.message ?? 'Bir hata olustu!'));
    }
  }
}

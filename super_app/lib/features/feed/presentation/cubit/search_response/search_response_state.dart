import 'package:equatable/equatable.dart';
import 'package:super_app/features/feed/domain/entities/search_response_entity.dart';

sealed class SearchResponseState extends Equatable {
  const SearchResponseState();

  @override
  List<Object?> get props => [];
}

final class SearchResponseInitial extends SearchResponseState {}

final class SearchResponseLoading extends SearchResponseState {}

final class SearchResponseLoaded extends SearchResponseState {
  final SearchResponseEntity searchResponse;

  const SearchResponseLoaded(this.searchResponse);

  @override
  List<Object?> get props => [searchResponse];
}

final class SearchResponseError extends SearchResponseState {
  final String message;

  const SearchResponseError(this.message);

  @override
  List<Object?> get props => [message];
}

import 'package:super_app/features/feed/domain/entities/search_response_entity.dart';

class SearchResponseModel extends SearchResponseEntity {
  const SearchResponseModel({int? total, final List<int>? objectIDs})
    : super(total: total, objectIDs: objectIDs);

  factory SearchResponseModel.fromJson(Map<String, dynamic> map) {
    return SearchResponseModel(
      total: map['total'] ?? 0,
      objectIDs: List<int>.from(map['objectIds'] ?? []),
    );
  }
}

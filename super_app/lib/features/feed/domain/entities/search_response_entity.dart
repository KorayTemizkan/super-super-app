import 'package:equatable/equatable.dart';

class SearchResponseEntity extends Equatable {
  final int? total;
  final List<int>? objectIDs;

  const SearchResponseEntity({this.total, this.objectIDs});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      total,
      objectIDs,
    ];
  }
}

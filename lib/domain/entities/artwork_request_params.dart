import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtworkRequestParams extends Equatable {
  final int id;
  final ArtworkType type;
  final MediaFilter? filter;

  const ArtworkRequestParams(
    this.id,
    this.type,
    this.filter,
  );

  @override
  List<Object> get props => [];
}

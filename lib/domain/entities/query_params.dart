import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class QueryParams extends Equatable {
  final MediaFilter? filter;
  final bool fromAsset;
  final bool fromAppDir;

  const QueryParams(
    this.filter,
    this.fromAsset,
    this.fromAppDir,
  );

  @override
  List<Object> get props => [];
}

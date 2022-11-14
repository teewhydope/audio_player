import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtworkEntity extends Equatable {
  final int id;
  final Uint8List? artwork;
  final String path;
  final Stream? type;

  const ArtworkEntity({
    required this.id,
    required this.artwork,
    required this.path,
    required this.type,
  });

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;

  factory ArtworkEntity.fromArtworkModel(ArtworkModel? model) {
    return ArtworkEntity(
      id: model?.id ?? -1,
      artwork: model?.artwork,
      path: model?.path ?? "",
      type: model?.type,
    );
  }
}

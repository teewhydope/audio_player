import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayListEntity extends Equatable {
  final int id;
  final String playlist;
  final String data;
  final int dateAdded;
  final int dateModified;
  final int numOfSongs;

  const PlayListEntity({
    required this.id,
    required this.playlist,
    required this.data,
    required this.dateAdded,
    required this.dateModified,
    required this.numOfSongs,
  });

  @override
  List<Object> get props => [id, playlist];

  @override
  bool get stringify => true;

  factory PlayListEntity.fromPlaylistModel(PlaylistModel model) {
    return PlayListEntity(
      id: model.id,
      playlist: model.playlist,
      data: model.data ?? '',
      dateAdded: model.dateAdded ?? 0,
      dateModified: model.dateModified ?? 0,
      numOfSongs: model.numOfSongs,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumEntity extends Equatable {
  final int id;
  final String album;
  final String artist;
  final int artistId;
  final int numOfSongs;

  const AlbumEntity({
    required this.id,
    required this.album,
    required this.artist,
    required this.artistId,
    required this.numOfSongs,
  });

  @override
  List<Object> get props => [id, album];

  @override
  bool get stringify => true;

  factory AlbumEntity.fromAlbumModel(AlbumModel model) {
    return AlbumEntity(
      id: model.id,
      album: model.album,
      artist: model.artist ?? "Unknown",
      artistId: model.artistId ?? -1,
      numOfSongs: model.numOfSongs,
    );
  }
}

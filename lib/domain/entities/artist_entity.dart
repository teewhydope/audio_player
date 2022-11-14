import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtistEntity extends Equatable {
  final int id;
  final String artist;
  final int numberOfAlbums;
  final int numberOfTracks;

  const ArtistEntity({
    required this.id,
    required this.artist,
    required this.numberOfAlbums,
    required this.numberOfTracks,
  });

  @override
  List<Object> get props => [id, artist];

  @override
  bool get stringify => true;

  factory ArtistEntity.fromArtistModel(ArtistModel model) {
    return ArtistEntity(
      id: model.id,
      artist: model.artist,
      numberOfAlbums: model.numberOfAlbums ?? 0,
      numberOfTracks: model.numberOfTracks ?? 0,
    );
  }
}

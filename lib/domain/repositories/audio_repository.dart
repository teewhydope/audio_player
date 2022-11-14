import 'package:audio_player/domain/entities/album_entity.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artist_entity.dart';
import 'package:audio_player/domain/entities/artwork_entity.dart';
import 'package:audio_player/domain/entities/genre_entity.dart';
import 'package:audio_player/domain/entities/playlist_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../entities/audio_entity.dart';

abstract class AudioRepository {
  Future<Either<AppError, List<AudioEntity>>> getAudios(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<Either<AppError, List<AlbumEntity>>> getAlbums(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<Either<AppError, List<ArtistEntity>>> getArtists(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<Either<AppError, List<GenreEntity>>> getGenres(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<Either<AppError, ArtworkEntity?>> getArtwork(
    int id,
    ArtworkType type,
    MediaFilter? filter,
  );

  Future<Either<AppError, List<PlayListEntity>>> getPlaylist(
    MediaFilter? filter,
  );
}

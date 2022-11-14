import 'package:audio_player/data/datasources/audio_local_data_source.dart';
import 'package:audio_player/domain/entities/album_entity.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artist_entity.dart';
import 'package:audio_player/domain/entities/artwork_entity.dart';
import 'package:audio_player/domain/entities/genre_entity.dart';
import 'package:audio_player/domain/entities/playlist_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:audio_player/domain/entities/audio_entity.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../domain/repositories/audio_repository.dart';

class AudioDataRepository extends AudioRepository {
  final AudioLocalSource localSource;

  AudioDataRepository(this.localSource);

  @override
  Future<Either<AppError, List<AudioEntity>>> getAudios(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    try {
      final result =
          await localSource.queryAudios(filter, fromAsset, fromAppDir);
      List<AudioEntity> songList = [];
      for (var song in result) {
        songList.add(AudioEntity.fromAudioModel(song));
      }
      return Right(songList);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<AlbumEntity>>> getAlbums(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    try {
      final result =
          await localSource.queryAlbums(filter, fromAsset, fromAppDir);
      List<AlbumEntity> albumList = [];
      for (var album in result) {
        albumList.add(AlbumEntity.fromAlbumModel(album));
      }
      return Right(albumList);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<ArtistEntity>>> getArtists(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    try {
      final result =
          await localSource.queryArtists(filter, fromAsset, fromAppDir);
      List<ArtistEntity> artistList = [];
      for (var artist in result) {
        artistList.add(ArtistEntity.fromArtistModel(artist));
      }
      return Right(artistList);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, ArtworkEntity?>> getArtwork(
    int id,
    ArtworkType type,
    MediaFilter? filter,
  ) async {
    try {
      final result = await localSource.queryArtwork(id, type, filter);
      return Right(ArtworkEntity.fromArtworkModel(result));
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<GenreEntity>>> getGenres(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    try {
      final result = await localSource.queryGenres(
        filter,
        fromAsset,
        fromAppDir,
      );
      List<GenreEntity> genreList = [];
      for (var genre in result) {
        genreList.add(GenreEntity.fromGenreModel(genre));
      }
      return Right(genreList);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<PlayListEntity>>> getPlaylist(
    MediaFilter? filter,
  ) async {
    try {
      final result = await localSource.queryPlaylists(filter);
      List<PlayListEntity> playLists = [];
      for (var playlist in result) {
        playLists.add(PlayListEntity.fromPlaylistModel(playlist));
      }
      return Right(playLists);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }
}

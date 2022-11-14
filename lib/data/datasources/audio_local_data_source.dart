import 'package:on_audio_query/on_audio_query.dart';

abstract class AudioLocalSource {
  Future<List<AudioModel>> queryAudios(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<List<AlbumModel>> queryAlbums(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<List<ArtistModel>> queryArtists(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<List<GenreModel>> queryGenres(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  );

  Future<ArtworkModel?> queryArtwork(
    int id,
    ArtworkType type,
    MediaFilter? filter,
  );

  Future<List<PlaylistModel>> queryPlaylists(
    MediaFilter? filter,
  );
}

class AudioLocalDataSource extends AudioLocalSource {
  final OnAudioQuery _audioQuery;

  AudioLocalDataSource(this._audioQuery);
  @override
  Future<List<AudioModel>> queryAudios(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    return _audioQuery.queryAudios(
      filter: filter,
      fromAsset: fromAsset,
      fromAppDir: fromAppDir,
    );
  }

  @override
  Future<List<AlbumModel>> queryAlbums(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    return _audioQuery.queryAlbums(
      filter: filter,
      fromAsset: fromAsset,
      fromAppDir: fromAppDir,
    );
  }

  @override
  Future<List<ArtistModel>> queryArtists(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    return _audioQuery.queryArtists(
      filter: filter,
      fromAsset: fromAsset,
      fromAppDir: fromAppDir,
    );
  }

  @override
  Future<List<GenreModel>> queryGenres(
    MediaFilter? filter,
    bool fromAsset,
    bool fromAppDir,
  ) async {
    return _audioQuery.queryGenres(
      filter: filter,
      fromAsset: fromAsset,
      fromAppDir: fromAppDir,
    );
  }

  @override
  Future<ArtworkModel?> queryArtwork(
    int id,
    ArtworkType type,
    MediaFilter? filter,
  ) async {
    return _audioQuery.queryArtwork(
      id,
      type,
      filter: filter,
    );
  }

  @override
  Future<List<PlaylistModel>> queryPlaylists(
    MediaFilter? filter,
  ) async {
    return _audioQuery.queryPlaylists(
      filter: filter,
    );
  }
}

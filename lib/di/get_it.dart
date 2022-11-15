import 'package:audio_player/data/datasources/audio_local_data_source.dart';
import 'package:audio_player/data/repositories/audio_data_repository.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/get_album_usecase.dart';
import 'package:audio_player/domain/usecases/get_artist_usecase.dart';
import 'package:audio_player/domain/usecases/get_audio_usecase.dart';
import 'package:audio_player/domain/usecases/get_genre_usecase.dart';
import 'package:audio_player/presentation/cubits/album/album_cubit.dart';
import 'package:audio_player/presentation/cubits/artist/artist_cubit.dart';
import 'package:audio_player/presentation/cubits/audio/audio_cubit.dart';
import 'package:audio_player/presentation/cubits/genre/genre_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<OnAudioQuery>(() => OnAudioQuery());

  //DataSources
  getItInstance.registerLazySingleton<AudioLocalSource>(
      () => AudioLocalDataSource(getItInstance()));

//Repositories
  getItInstance.registerLazySingleton<AudioRepository>(
      () => AudioDataRepository(getItInstance()));

//Usecases
  getItInstance.registerLazySingleton<GetAudioUseCase>(
      () => GetAudioUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetAlbumUseCase>(
      () => GetAlbumUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetGenreUseCase>(
      () => GetGenreUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetArtistUseCase>(
      () => GetArtistUseCase(getItInstance()));

//Cubits
  getItInstance.registerFactory(
    () => AudioCubit(
      getSongUseCase: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => AlbumCubit(
      getAlbumUseCase: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => GenreCubit(
      getGenreUseCase: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => ArtistCubit(
      getArtistUseCase: getItInstance(),
    ),
  );
}

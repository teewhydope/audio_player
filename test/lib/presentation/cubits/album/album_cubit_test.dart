import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/album_entity.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_album_usecase.dart';
import 'package:audio_player/presentation/cubits/album/album_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAlbumMock extends Mock implements GetAlbumUseCase {}

main() {
  late GetAlbumMock getAlbumMock;
  late AlbumCubit albumCubit;

  setUp(() {
    getAlbumMock = GetAlbumMock();

    albumCubit = AlbumCubit(
      getAlbumUseCase: getAlbumMock,
    );
  });

  tearDown(() {
    albumCubit.close();
  });

  group('fetchAlbums()', () {
    const List<AlbumEntity> albums = [
      AlbumEntity(
        id: 0,
        album: 'Album1',
        artist: '',
        artistId: 100,
        numOfSongs: 3,
      ),
      AlbumEntity(
        id: 1,
        album: 'Album2',
        artist: '',
        artistId: 101,
        numOfSongs: 3,
      ),
    ];

    const String exception = 'Failed to fetch albums.';

    blocTest<AlbumCubit, AlbumState>(
      'emits [AppStatus.success] when '
      'fetchAlbums() is called successfully.',
      setUp: () => when(() => getAlbumMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Right(albums)),
      build: () => albumCubit,
      act: (cubit) => cubit.fetchAlbums(),
      expect: () => <AlbumState>[
        const AlbumState(
          status: AppStatus.success,
          albums: albums,
        ),
      ],
      verify: (_) async {
        verify(() => getAlbumMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );

    blocTest<AlbumCubit, AlbumState>(
      'emits [AppStatus.failure] when '
      'fetchAlbums() failed.',
      setUp: () => when(() => getAlbumMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Left(AppError(exception))),
      build: () => albumCubit,
      act: (cubit) => cubit.fetchAlbums(),
      expect: () => <AlbumState>[
        const AlbumState(status: AppStatus.failure, errorMessage: exception),
      ],
      verify: (_) async {
        verify(() => getAlbumMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );
  });
}

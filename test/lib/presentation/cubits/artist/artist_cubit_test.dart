import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artist_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_artist_usecase.dart';
import 'package:audio_player/presentation/cubits/artist/artist_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetArtistMock extends Mock implements GetArtistUseCase {}

main() {
  late GetArtistMock getArtistMock;
  late ArtistCubit artistCubit;

  setUp(() {
    getArtistMock = GetArtistMock();

    artistCubit = ArtistCubit(
      getArtistUseCase: getArtistMock,
    );
  });

  tearDown(() {
    artistCubit.close();
  });

  group('fetchArtists()', () {
    const List<ArtistEntity> artists = [
      ArtistEntity(
        id: 0,
        artist: 'Artist1',
        numberOfAlbums: 1,
        numberOfTracks: 1,
      ),
      ArtistEntity(
        id: 1,
        artist: 'Artist2',
        numberOfAlbums: 1,
        numberOfTracks: 1,
      ),
      ArtistEntity(
        id: 2,
        artist: 'Artist3',
        numberOfAlbums: 1,
        numberOfTracks: 1,
      ),
    ];

    const String exception = 'Failed to fetch artists.';

    blocTest<ArtistCubit, ArtistState>(
      'emits [AppStatus.success] when '
      'fetchArtists() is called successfully.',
      setUp: () => when(() => getArtistMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Right(artists)),
      build: () => artistCubit,
      act: (cubit) => cubit.fetchArtists(),
      expect: () => <ArtistState>[
        const ArtistState(
          status: AppStatus.success,
          artists: artists,
        ),
      ],
      verify: (_) async {
        verify(() => getArtistMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );

    blocTest<ArtistCubit, ArtistState>(
      'emits [AppStatus.failure] when '
      'fetchArtists() failed.',
      setUp: () => when(() => getArtistMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Left(AppError(exception))),
      build: () => artistCubit,
      act: (cubit) => cubit.fetchArtists(),
      expect: () => <ArtistState>[
        const ArtistState(status: AppStatus.failure, errorMessage: exception),
      ],
      verify: (_) async {
        verify(() => getArtistMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );
  });
}

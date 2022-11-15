import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/genre_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_genre_usecase.dart';
import 'package:audio_player/presentation/cubits/genre/genre_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetGenreMock extends Mock implements GetGenreUseCase {}

main() {
  late GetGenreMock getGenreMock;
  late GenreCubit genreCubit;

  setUp(() {
    getGenreMock = GetGenreMock();

    genreCubit = GenreCubit(
      getGenreUseCase: getGenreMock,
    );
  });

  tearDown(() {
    genreCubit.close();
  });

  group('fetchGenres()', () {
    const List<GenreEntity> genres = [
      GenreEntity(
        id: 0,
        genre: 'Genre1',
        numOfSongs: 1,
      ),
      GenreEntity(
        id: 1,
        genre: 'Genre2',
        numOfSongs: 2,
      ),
      GenreEntity(
        id: 2,
        genre: 'Genre3',
        numOfSongs: 3,
      ),
    ];

    const String exception = 'Failed to fetch audios.';

    blocTest<GenreCubit, GenreState>(
      'emits [AppStatus.success] when '
      'fetchGenres() is called successfully.',
      setUp: () => when(() => getGenreMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Right(genres)),
      build: () => genreCubit,
      act: (cubit) => cubit.fetchGenres(),
      expect: () => <GenreState>[
        const GenreState(
          status: AppStatus.success,
          genre: genres,
        ),
      ],
      verify: (_) async {
        verify(() => getGenreMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );

    blocTest<GenreCubit, GenreState>(
      'emits [AppStatus.failure] when '
      'fetchGenres() failed.',
      setUp: () => when(() => getGenreMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Left(AppError(exception))),
      build: () => genreCubit,
      act: (cubit) => cubit.fetchGenres(),
      expect: () => <GenreState>[
        const GenreState(status: AppStatus.failure, errorMessage: exception),
      ],
      verify: (_) async {
        verify(() => getGenreMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );
  });
}

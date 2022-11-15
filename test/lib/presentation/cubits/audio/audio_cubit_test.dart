import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/audio_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_audio_usecase.dart';
import 'package:audio_player/presentation/cubits/audio/audio_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAudioMock extends Mock implements GetAudioUseCase {}

main() {
  late GetAudioMock getAudioMock;
  late AudioCubit audioCubit;

  setUp(() {
    getAudioMock = GetAudioMock();

    audioCubit = AudioCubit(
      getSongUseCase: getAudioMock,
    );
  });

  tearDown(() {
    audioCubit.close();
  });

  group('fetchAudios()', () {
    const List<AudioEntity> audios = [
      AudioEntity(
        id: 0,
        title: 'Audio1',
        data: '',
        artist: '',
        album: '',
        uri: '',
        displayNameWOExt: '',
        size: 100,
        duration: 3,
      ),
      AudioEntity(
        id: 1,
        title: 'Audio2',
        data: '',
        artist: '',
        album: '',
        uri: '',
        displayNameWOExt: '',
        size: 100,
        duration: 3,
      ),
      AudioEntity(
        id: 2,
        title: 'Audio3',
        data: '',
        artist: '',
        album: '',
        uri: '',
        displayNameWOExt: '',
        size: 100,
        duration: 3,
      ),
    ];

    const String exception = 'Failed to fetch audios.';

    blocTest<AudioCubit, AudioState>(
      'emits [AppStatus.success] when '
      'fetchAudios() is called successfully.',
      setUp: () => when(() => getAudioMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Right(audios)),
      build: () => audioCubit,
      act: (cubit) => cubit.fetchAudios(),
      expect: () => <AudioState>[
        //const AudioState(status: AppStatus.loading),
        const AudioState(
          status: AppStatus.success,
          audios: audios,
        ),
      ],
      verify: (_) async {
        verify(() => getAudioMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );

    blocTest<AudioCubit, AudioState>(
      'emits [AppStatus.failure] when '
      'fetchAudios() failed.',
      setUp: () => when(() => getAudioMock.call(const QueryParams(
            null,
            false,
            false,
          ))).thenAnswer((_) async => const Left(AppError(exception))),
      build: () => audioCubit,
      act: (cubit) => cubit.fetchAudios(),
      expect: () => <AudioState>[
        const AudioState(status: AppStatus.failure, errorMessage: exception),
      ],
      verify: (_) async {
        verify(() => getAudioMock.call(const QueryParams(
              null,
              false,
              false,
            ))).called(1);
      },
    );
  });
}

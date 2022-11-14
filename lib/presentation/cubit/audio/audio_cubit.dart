import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/audio_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_audio_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final GetAudioUseCase getSongUseCase;
  AudioCubit({
    required this.getSongUseCase,
  }) : super(const AudioState());

  void fetchAudios({
    MediaFilter? filter,
    bool fromAsset = false,
    bool fromAppDir = false,
  }) async {
    Either<AppError, List<AudioEntity>> result =
        await getSongUseCase(QueryParams(filter, fromAsset, fromAppDir));
    emit(result.fold(
      (l) => state.copyWith(
        status: AppStatus.failure,
        errorMessage: l.errorMessage,
      ),
      (r) => state.copyWith(
        status: AppStatus.success,
        audios: r,
      ),
    ));
  }
}

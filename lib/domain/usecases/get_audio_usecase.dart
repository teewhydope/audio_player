import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/audio_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/audio_repository.dart';

class GetAudioUseCase extends BaseUseCase<List<AudioEntity>, QueryParams> {
  final AudioRepository repository;

  GetAudioUseCase(this.repository);

  @override
  Future<Either<AppError, List<AudioEntity>>> call(QueryParams params) async {
    return await repository.getAudios(
      params.filter,
      params.fromAsset,
      params.fromAppDir,
    );
  }
}

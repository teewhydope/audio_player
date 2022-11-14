import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artwork_entity.dart';
import 'package:audio_player/domain/entities/artwork_request_params.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetArtworkUseCase
    extends BaseUseCase<ArtworkEntity?, ArtworkRequestParams> {
  final AudioRepository repository;

  GetArtworkUseCase(this.repository);

  @override
  Future<Either<AppError, ArtworkEntity?>> call(
      ArtworkRequestParams params) async {
    return await repository.getArtwork(
      params.id,
      params.type,
      params.filter,
    );
  }
}

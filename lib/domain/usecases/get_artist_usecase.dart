import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artist_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetArtistUseCase extends BaseUseCase<List<ArtistEntity>, QueryParams> {
  final AudioRepository repository;

  GetArtistUseCase(this.repository);

  @override
  Future<Either<AppError, List<ArtistEntity>>> call(QueryParams params) async {
    return await repository.getArtists(
      params.filter,
      params.fromAsset,
      params.fromAppDir,
    );
  }
}

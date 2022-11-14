import 'package:audio_player/domain/entities/album_entity.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAlbumUseCase extends BaseUseCase<List<AlbumEntity>, QueryParams> {
  final AudioRepository repository;

  GetAlbumUseCase(this.repository);

  @override
  Future<Either<AppError, List<AlbumEntity>>> call(QueryParams params) async {
    return await repository.getAlbums(
      params.filter,
      params.fromAsset,
      params.fromAppDir,
    );
  }
}

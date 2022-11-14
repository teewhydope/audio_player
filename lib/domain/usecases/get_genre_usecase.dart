import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/genre_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetGenreUseCase extends BaseUseCase<List<GenreEntity>, QueryParams> {
  final AudioRepository repository;

  GetGenreUseCase(this.repository);

  @override
  Future<Either<AppError, List<GenreEntity>>> call(QueryParams params) async {
    return await repository.getGenres(
      params.filter,
      params.fromAsset,
      params.fromAppDir,
    );
  }
}

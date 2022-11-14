import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/playlist_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/repositories/audio_repository.dart';
import 'package:audio_player/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetPlaylistUseCase
    extends BaseUseCase<List<PlayListEntity>, QueryParams> {
  final AudioRepository repository;

  GetPlaylistUseCase(this.repository);

  @override
  Future<Either<AppError, List<PlayListEntity>>> call(
      QueryParams params) async {
    return await repository.getPlaylist(
      params.filter,
    );
  }
}

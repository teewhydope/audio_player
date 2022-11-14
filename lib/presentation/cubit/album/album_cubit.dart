import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/album_entity.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_album_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final GetAlbumUseCase getAlbumUseCase;
  AlbumCubit({
    required this.getAlbumUseCase,
  }) : super(const AlbumState());

  void fetchAlbums({
    MediaFilter? filter,
    bool fromAsset = true,
    bool fromAppDir = true,
  }) async {
    Either<AppError, List<AlbumEntity>> result =
        await getAlbumUseCase(QueryParams(filter, fromAsset, fromAppDir));
    emit(result.fold(
      (l) => state.copyWith(
        status: AppStatus.failure,
        errorMessage: l.errorMessage,
      ),
      (r) => state.copyWith(
        status: AppStatus.success,
        albums: r,
      ),
    ));
  }
}

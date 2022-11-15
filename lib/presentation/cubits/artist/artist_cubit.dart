import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/artist_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_artist_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final GetArtistUseCase getArtistUseCase;
  ArtistCubit({
    required this.getArtistUseCase,
  }) : super(const ArtistState());

  void fetchArtists({
    MediaFilter? filter,
    bool fromAsset = true,
    bool fromAppDir = true,
  }) async {
    Either<AppError, List<ArtistEntity>> result =
        await getArtistUseCase(QueryParams(filter, fromAsset, fromAppDir));
    emit(result.fold(
      (l) => state.copyWith(
        status: AppStatus.failure,
        errorMessage: l.errorMessage,
      ),
      (r) => state.copyWith(
        status: AppStatus.success,
        artists: r,
      ),
    ));
  }
}

import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/domain/entities/app_error.dart';
import 'package:audio_player/domain/entities/genre_entity.dart';
import 'package:audio_player/domain/entities/query_params.dart';
import 'package:audio_player/domain/usecases/get_genre_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GetGenreUseCase getGenreUseCase;
  GenreCubit({
    required this.getGenreUseCase,
  }) : super(const GenreState());

  void fetchGenres({
    MediaFilter? filter,
    bool fromAsset = true,
    bool fromAppDir = true,
  }) async {
    Either<AppError, List<GenreEntity>> result =
        await getGenreUseCase(QueryParams(filter, fromAsset, fromAppDir));
    emit(result.fold(
      (l) => state.copyWith(
        status: AppStatus.failure,
        errorMessage: l.errorMessage,
      ),
      (r) => state.copyWith(
        status: AppStatus.success,
        genre: r,
      ),
    ));
  }
}

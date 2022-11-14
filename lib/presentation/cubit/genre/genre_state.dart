part of 'genre_cubit.dart';

class GenreState extends Equatable {
  final List<GenreEntity> genre;
  final String errorMessage;
  final AppStatus status;

  const GenreState({
    this.genre = const [],
    this.errorMessage = "",
    this.status = AppStatus.initial,
  });

  GenreState copyWith({
    List<GenreEntity>? genre,
    String? errorMessage,
    AppStatus? status,
  }) {
    return GenreState(
      genre: genre ?? this.genre,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [genre];
}

part of 'artist_cubit.dart';

class ArtistState extends Equatable {
  final List<ArtistEntity> artists;
  final String errorMessage;
  final AppStatus status;

  const ArtistState({
    this.artists = const [],
    this.errorMessage = "",
    this.status = AppStatus.initial,
  });

  ArtistState copyWith({
    List<ArtistEntity>? artists,
    String? errorMessage,
    AppStatus? status,
  }) {
    return ArtistState(
      artists: artists ?? this.artists,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [artists];
}

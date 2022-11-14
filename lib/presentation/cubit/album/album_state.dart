part of 'album_cubit.dart';

class AlbumState extends Equatable {
  final List<AlbumEntity> albums;
  final String errorMessage;
  final AppStatus status;

  const AlbumState({
    this.albums = const [],
    this.errorMessage = "",
    this.status = AppStatus.initial,
  });

  AlbumState copyWith({
    List<AlbumEntity>? albums,
    String? errorMessage,
    AppStatus? status,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [albums];
}

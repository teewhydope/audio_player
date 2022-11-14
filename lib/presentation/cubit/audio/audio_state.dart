part of 'audio_cubit.dart';

class AudioState extends Equatable {
  final List<AudioEntity> audios;
  final String errorMessage;
  final AppStatus status;

  const AudioState({
    this.audios = const [],
    this.errorMessage = "",
    this.status = AppStatus.initial,
  });

  AudioState copyWith({
    List<AudioEntity>? audios,
    String? errorMessage,
    AppStatus? status,
  }) {
    return AudioState(
      audios: audios ?? this.audios,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [audios];
}

import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AudioEntity extends Equatable {
  final int id;
  final String title;
  final String data;
  final String artist;
  final String album;
  final String uri;
  final String displayNameWOExt;
  final int size;
  final int duration;

  const AudioEntity({
    required this.id,
    required this.title,
    required this.data,
    required this.artist,
    required this.album,
    required this.uri,
    required this.displayNameWOExt,
    required this.size,
    required this.duration,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory AudioEntity.fromAudioModel(AudioModel model) {
    return AudioEntity(
      id: model.id,
      title: model.title,
      data: model.data,
      artist: model.artist ?? "Unknown",
      album: model.album ?? "Unknown",
      uri: model.uri ?? "",
      displayNameWOExt: model.displayNameWOExt,
      size: model.size,
      duration: model.duration ?? 0,
    );
  }
}

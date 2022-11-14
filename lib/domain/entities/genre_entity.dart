import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GenreEntity extends Equatable {
  final int id;
  final String genre;
  final int numOfSongs;

  const GenreEntity({
    required this.id,
    required this.genre,
    required this.numOfSongs,
  });

  @override
  List<Object> get props => [id, genre];

  @override
  bool get stringify => true;

  factory GenreEntity.fromGenreModel(GenreModel model) {
    return GenreEntity(
      id: model.id,
      genre: model.genre,
      numOfSongs: model.numOfSongs,
    );
  }
}

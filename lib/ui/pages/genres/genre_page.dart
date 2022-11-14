import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/di/get_it.dart';
import 'package:audio_player/presentation/cubit/audio/audio_cubit.dart';
import 'package:audio_player/presentation/cubit/genre/genre_cubit.dart';
import 'package:audio_player/ui/widgets/artwork_container.dart';
import 'package:audio_player/ui/widgets/text_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  late GenreCubit _genreCubit;

  @override
  void initState() {
    super.initState();
    _genreCubit = getItInstance<GenreCubit>();
    _genreCubit.fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _genreCubit,
      child: BlocBuilder<GenreCubit, GenreState>(
        builder: (context, state) {
          if (state.status == AppStatus.success) {
            return ListView.builder(
              itemCount: state.genre.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: TextView(
                        state.genre[index].genre,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      subtitle: TextView(
                        "${state.genre[index].numOfSongs} tracks",
                        fontSize: 10,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.more_vert),
                      leading: ArtworkContainer(id: state.genre[index].id),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

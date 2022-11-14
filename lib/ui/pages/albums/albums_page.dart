import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/di/get_it.dart';
import 'package:audio_player/presentation/cubit/album/album_cubit.dart';
import 'package:audio_player/ui/widgets/artwork_container.dart';
import 'package:audio_player/ui/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late AlbumCubit _albumCubit;

  @override
  void initState() {
    super.initState();
    _albumCubit = getItInstance<AlbumCubit>();
    _albumCubit.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _albumCubit,
      child: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state.status == AppStatus.success) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: TextView(
                        state.albums[index].album,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      subtitle: TextView(
                        state.albums[index].artist,
                        fontSize: 10,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.more_vert),
                      leading: ArtworkContainer(id: state.albums[index].id),
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

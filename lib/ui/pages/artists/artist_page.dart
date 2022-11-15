import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/di/get_it.dart';
import 'package:audio_player/presentation/cubits/artist/artist_cubit.dart';
import 'package:audio_player/ui/widgets/artwork_container.dart';
import 'package:audio_player/ui/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  late ArtistCubit _artistCubit;

  @override
  void initState() {
    super.initState();
    _artistCubit = getItInstance<ArtistCubit>();
    _artistCubit.fetchArtists();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _artistCubit,
      child: BlocBuilder<ArtistCubit, ArtistState>(
        builder: (context, state) {
          if (state.status == AppStatus.success) {
            return ListView.builder(
              itemCount: state.artists.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: TextView(
                        state.artists[index].artist,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      subtitle: TextView(
                        "${state.artists[index].numberOfAlbums} albums | ${state.artists[index].numberOfAlbums} tracks",
                        fontSize: 10,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.more_vert),
                      leading: ArtworkContainer(id: state.artists[index].id),
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

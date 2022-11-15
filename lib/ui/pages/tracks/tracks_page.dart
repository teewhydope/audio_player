import 'package:audio_player/common/contstants/app_status.dart';
import 'package:audio_player/di/get_it.dart';
import 'package:audio_player/presentation/cubits/audio/audio_cubit.dart';
import 'package:audio_player/ui/widgets/artwork_container.dart';
import 'package:audio_player/ui/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({super.key});

  @override
  State<TracksPage> createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  late AudioCubit _audioCubit;

  @override
  void initState() {
    super.initState();
    _audioCubit = getItInstance<AudioCubit>();
    _audioCubit.fetchAudios();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _audioCubit,
      child: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          if (state.status == AppStatus.success) {
            return ListView.builder(
              itemCount: state.audios.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: TextView(
                        state.audios[index].title,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      subtitle: TextView(
                        state.audios[index].artist,
                        fontSize: 10,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.more_vert),
                      leading: ArtworkContainer(id: state.audios[index].id),
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

import 'package:audio_player/common/contstants/strings.dart';
import 'package:audio_player/ui/themes/colors.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/widgets.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtworkContainer extends StatelessWidget {
  final int id;
  ArtworkContainer({
    super.key,
    required this.id,
  });

  final borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: id,
      type: ArtworkType.AUDIO,
      artworkFit: BoxFit.fill,
      artworkBorder: BorderRadius.circular(8),
      artworkQuality: FilterQuality.high,
      nullArtworkWidget: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "${imagePath}default_artwork.png",
          filterQuality: FilterQuality.high,
          colorBlendMode: BlendMode.colorDodge,
        ),
      ),
    );
  }
}

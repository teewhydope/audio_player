import 'package:audio_player/ui/pages/tab_bar/tab_screen.dart';
import 'package:audio_player/ui/pages/spotify/spotify_page.dart';
import 'package:audio_player/ui/pages/tracks/tracks_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: TabScreen,
      initial: true,
      children: [
        AutoRoute(page: TracksPage),
        AutoRoute(page: SpotifyPage),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}

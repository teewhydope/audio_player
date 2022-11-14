import 'dart:io';

import 'package:audio_player/di/get_it.dart';
import 'package:audio_player/ui/pages/albums/albums_page.dart';
import 'package:audio_player/ui/pages/artists/artist_page.dart';
import 'package:audio_player/ui/pages/genres/genre_page.dart';
import 'package:audio_player/ui/pages/spotify/spotify_page.dart';
import 'package:audio_player/ui/pages/tracks/tracks_page.dart';
import 'package:audio_player/ui/widgets/app_bar.dart';
import 'package:audio_player/ui/widgets/c_tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    checkPermission();
    scanMedia();
    _tabController = TabController(length: tabItems.length, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          const CAppBar(),
          CTabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 11.sp),
            labelStyle: TextStyle(fontSize: 15.sp),
            indicator: const BoxDecoration(),
            tabs: tabItems.map((item) => Tab(text: item.title)).toList(),
          ),
          Expanded(
            child: CTabBarView(
              controller: _tabController,
              children: tabItems.map((item) => item.page).toList(),
            ),
          )
        ],
      ),
    );
  }

  scanMedia() async {
    OnAudioQuery _audioQuery = OnAudioQuery();
    File file = File('path');
    try {
      if (file.existsSync()) {
        file.deleteSync();
        _audioQuery.scanMedia(file.path); // Scan the media 'path'
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  checkPermission() async {
    if (!kIsWeb) {
      var audioQuery = getItInstance<OnAudioQuery>();
      bool permissionStatus = await audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await audioQuery.permissionsRequest();
      }
    }
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}

class TabModel {
  final int id;

  final String title;
  final Widget page;

  const TabModel({
    required this.id,
    required this.title,
    required this.page,
  });
}

List<TabModel> tabItems = const [
  TabModel(
    id: 0,
    title: "Spotify",
    page: SpotifyPage(),
  ),
  TabModel(
    id: 1,
    title: "Favourites",
    page: TracksPage(),
  ),
  TabModel(
    id: 2,
    title: "Playlists",
    page: TracksPage(),
  ),
  TabModel(
    id: 3,
    title: "Tracks",
    page: TracksPage(),
  ),
  TabModel(
    id: 4,
    title: "Albums",
    page: AlbumsPage(),
  ),
  TabModel(
    id: 5,
    title: "Artists",
    page: ArtistPage(),
  ),
  TabModel(
    id: 6,
    title: "Genres",
    page: GenrePage(),
  ),
  TabModel(
    id: 7,
    title: "Videos",
    page: TracksPage(),
  ),
  TabModel(
    id: 8,
    title: "Composers",
    page: TracksPage(),
  ),
];

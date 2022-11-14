import 'dart:async';
import 'package:audio_player/ui/audio_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(get_it.init());
  runApp(AudioApp());
}

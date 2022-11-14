import 'package:audio_player/presentation/navigation/app_router.dart';
import 'package:audio_player/ui/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioApp extends StatelessWidget {
  AudioApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Audio",
            theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              //cardColor: white,
              //brightness: platformBrightness,
              //cardTheme: const CardTheme(surfaceTintColor: white),
              scaffoldBackgroundColor: white,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              primarySwatch: createMaterialColor(primaryColor),
            ),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        });
  }
}

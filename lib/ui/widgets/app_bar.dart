import 'package:audio_player/common/contstants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 10.h,
        ),
        child: Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.teal.withOpacity(0.7), BlendMode.color),
              child: Image.asset(
                "${imagePath}logo_white_big.png",
                height: 20.h,
                filterQuality: FilterQuality.high,
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
          ],
        ));
  }
}

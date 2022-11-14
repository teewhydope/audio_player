import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final Color? color;
  final double letterSpacing;
  final int? maxLines;
  final TextOverflow textOverflow;

  const TextView(
    this.text, {
    Key? key,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing = .5,
    this.maxLines,
    this.textOverflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize.sp),
      ),
      minFontSize: 0,
      stepGranularity: 0.1,
      style: GoogleFonts.poppins(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        decoration: decoration,
        color: color,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}

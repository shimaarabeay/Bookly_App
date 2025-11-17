import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final playfairDisplay = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static final playfairDisplay30 = GoogleFonts.playfairDisplay(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
  );
}

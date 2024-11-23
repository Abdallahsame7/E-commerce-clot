import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
static TextStyle clotStyle = TextStyle(
    fontSize: 35.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: 'FredokaOne', 
    shadows: [
      Shadow(
        offset: Offset(4, 4), 
        blurRadius: 4,
        color: Colors.black38,
      ),
    ],
    letterSpacing: 5.5, 
    fontStyle: FontStyle.italic
  );


  static TextStyle font16colorwhite = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
   
  );

  static TextStyle font32black = TextStyle(
    fontSize: 32.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
   
  );
}
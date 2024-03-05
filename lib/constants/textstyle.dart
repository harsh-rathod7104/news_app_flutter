import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(
    {required Color color, required FontWeight fw, required double size}) {
  return GoogleFonts.poppins(fontWeight: fw, color: color, fontSize: size);
}

TextStyle titleStyle(
    {required Color color, required FontWeight fw, required double size}) {
  return GoogleFonts.merriweather(fontWeight: fw, color: color, fontSize: size);
}

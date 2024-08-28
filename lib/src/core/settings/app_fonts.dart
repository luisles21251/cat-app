import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static AppFonts? _singleton;
  static final pTextW1S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w100, fontSize: 15);

  /*-------------------------
  * Bold w200 ----->'ExtraLight'
  * */

  static final pTextW2S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w200, fontSize: 15);

/*-------------------------
  * Bold w300 ----->'Light'
  * */
  static final pTextW3S10 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 10);

  static final pTextW3S12 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12);

  static final pTextW3S14 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14);

  static final pTextW3S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15);

  static final pTextW3S16 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16);

  /*-------------------------
  * Bold w400 ----->'Regular'
  * */
  static final pTextW4S10 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10);

  static final pTextW4S12 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12);

  static final pTextW4S14 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14);

  static final pTextW4S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15);

  static final pTextW4S16 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16);

  /*-------------------------
  * Bold w500 ----->'Medium'
  * */
  static final pTextW5S10 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10);

  static final pTextW5S12 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12);

  static final pTextW5S14 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14);

  static final pTextW5S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15);

  static final pTextW5S16 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);

  static final pTextW5S18 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);

  /*-------------------------
  * Bold w600 ----->'SemiBold'
  * */

  static final pTextW6S10 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 10);

  static final pTextW6S12 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12);

  static final pTextW6S14 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14);

  static final pTextW6S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15);

  static final pTextW6S16 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16);

  static final pTextW6S18 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18);

  static final pTextW6S19 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 19);

  static final pTextW6S20 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20);

  /*-------------------------
  * Bold w700 ----->'Bold'
  * */
  static final pTextW7S12 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12);

  static final pTextW7S14 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14);

  static final pTextW7S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15);

  static final pTextW7S16 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16);

  static final pTextW7S18 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18);
  static final pTextW7S22 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22);

  /*-------------------------
  * Bold w800 ----->'ExtraBold'
  * */
  static final pTextW8S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15);

  /*-------------------------
  * Bold w900 ----->'Black'
  * */
  static final pTextW9S15 = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15);

  static const sTextW4S12 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12);

  factory AppFonts() {
    _singleton ??= AppFonts._();
    return _singleton!;
  }

  AppFonts._();
}

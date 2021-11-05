import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/values/app_colors.dart';
import 'package:mobile_customer/values/app_fonts.dart';

class AppStyle {
  static const TextStyle titleAppBar = TextStyle(
    color: AppColors.black87,
    fontFamily: AppFonts.montserrat,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    wordSpacing: 1.5,
  );

  static const TextStyle search = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 17,
    color: AppColors.black26,
    letterSpacing: 0.5,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 16,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 16,
  );

  static const h2Bold = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const h3 = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 15,
  );

  static const h4 = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 14,
  );

  static const bookDetail = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 12,
    shadows: [
      Shadow(
        // offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const h5 = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 13,
  );

  static const tabbar = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const logoChooseUniver = TextStyle(
    fontSize: 35,
    fontFamily: AppFonts.courierNew,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8,
        color: Color(0xFF777777),
      ),
    ],
  );

  static const titleSignInUp = TextStyle(
    fontSize: 22,
    fontFamily: AppFonts.courierNew,
    fontWeight: FontWeight.bold,
    wordSpacing: -6,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const helperText = TextStyle(
    fontSize: 11,
    color: Colors.red,
    fontFamily: AppFonts.courierNew,
  );

  static const labelText = TextStyle(
    fontFamily: AppFonts.courierNew,
    fontSize: 18,
    color: Colors.black26,
  );

  static const link = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.courierNew,
    color: Color(0xFF0000FF),
    decoration: TextDecoration.underline,
    wordSpacing: -3.5,
  );

  static const button = TextStyle(
    fontFamily: AppFonts.courierNew,
    fontSize: 17,
    wordSpacing: -4,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 1,
        color: Colors.white,
      ),
    ],
  );

  static const TextStyle loginGmail = TextStyle(
    color: Colors.white,
    fontFamily: AppFonts.courierNew,
    fontSize: 17,
    wordSpacing: -4,
    shadows: [
      Shadow(
        blurRadius: 1,
        color: Colors.white,
      ),
    ],
  );

  static const h4CourierNew = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.courierNew,
    wordSpacing: -4,
  );

  static const typeSearch = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 15,
    color: Colors.black87,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const titleSearch = TextStyle(
    fontFamily: AppFonts.poppins,
    letterSpacing: 0.5,
    wordSpacing: 0.5,
    fontSize: 15.5,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const titleHome = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.5,
    wordSpacing: 0.5,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const titleSearchAppBar = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 17.5,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const desciptionStyle = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 13,
  );

  static const dropdownStyle = TextStyle(
    fontFamily: AppFonts.poppins,
    fontSize: 13,
  );

  static const barStyle = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 16,
    shadows: [
      Shadow(
        blurRadius: 8,
        color: Colors.black12,
      ),
    ],
  );

  static const barStyleMontserrat = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 16,
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );

  static const counselorDetail = TextStyle(
    fontFamily: AppFonts.montserrat,
    fontSize: 12,
    color: Colors.black,
    shadows: [
      Shadow(
        // offset: Offset(1.0, 1.0),
        blurRadius: 8,
        color: Color(0xFF999999),
      ),
    ],
  );
}

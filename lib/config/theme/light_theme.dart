import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/hex_color.dart';

class AppTheme {
  static ThemeData appLightTheme(context) {
    // String fontFamily =
    //     CacheHelper.getDataFromSharedPreference(key: AppStrings.fontFamily) ??
    //         AppStrings.expoArabicFontFamily;
    // var fontWeight =
    //     CacheHelper.getDataFromSharedPreference(key: AppStrings.fontWeight);
    // var fontSpaces = BlocProvider.of<AppThemeCubit>(context).fontSpaces;
    // var appBarFontSpaces =
    //     BlocProvider.of<AppThemeCubit>(context).appBarFontSpaces;
    // var appBarFontSize =
    //     CacheHelper.getDataFromSharedPreference(key: AppStrings.appBarfontWeight);
    // String fontColor =
    //     CacheHelper.getDataFromSharedPreference(key: AppStrings.fontColor) ??
    //         AppStrings.primaryColor;
    return ThemeData(
      fontFamily: AppStrings.plusJakartaSansFontFamily,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: AppStrings.plusJakartaSansFontFamily,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.05,
          color: AppColors.secondaryColor,
        ),
        toolbarTextStyle: TextStyle(
            fontSize: 14,
            fontFamily: AppStrings.plusJakartaSansFontFamily,
            fontWeight: FontWeight.bold,
            color: AppColors.hintColor),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            elevation: 0,
            textStyle: const TextStyle(
              fontFamily: AppStrings.plusJakartaSansFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )),
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff05332B)),

// style of about app
        headlineSmall:
            TextStyle(color: HexColor('#40625C'), fontSize: 14, height: 1.5),

        // style of text ( create account)
        displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryColor),

        // header of text form field
        displayMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.hintColor),

        // pop up items
        displaySmall: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),

        bodyLarge: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),

        //  style of text (create account through social medial)
        bodyMedium: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),

        //  style of description text in auth screens
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: HexColor('#9CA4AB'),
        ),

        // style of button
        labelLarge: const TextStyle(
            fontSize: 16,
            height: 1.3,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w600,
            color: Colors.black),

        labelMedium: const TextStyle(
            height: 1.3,
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: Colors.white),

        // style of text form field and cards
        labelSmall: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: AppStrings.plusJakartaSansFontFamily,
            color: AppColors.hintColor),
        titleMedium: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: AppStrings.plusJakartaSansFontFamily,
        ),
        titleLarge: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: AppStrings.plusJakartaSansFontFamily,
            color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor),
        hintStyle: TextStyle(
            color: AppColors.hintColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        errorStyle: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: AppColors.hintColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: AppColors.hintColor)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }

//! ======= PIN PUT THEME =========
  static var borderColor = HexColor('#008DCB');
  static const errorColor = Color.fromRGBO(255, 234, 238, 1);
  static var fillColor = Colors.white;
  static final defaultPinTheme = PinTheme(
    margin: const EdgeInsets.all(5),
    width: 50,
    height: 50,
    textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: fillColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: borderColor),
    borderRadius: BorderRadius.circular(30),
  );
  static final errorPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: errorColor),
      color: errorColor,
    ),
    textStyle: TextStyle(
        fontSize: 20, color: HexColor('#9CA4AB'), fontWeight: FontWeight.w600),
  );

  static final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: Colors.transparent),
      color: HexColor('#F6F6F6'),
    ),
    textStyle: TextStyle(
        fontSize: 20, color: HexColor('#9CA4AB'), fontWeight: FontWeight.w600),
  );
}

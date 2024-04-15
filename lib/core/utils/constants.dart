import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teach_me/core/utils/media_query_values.dart';

import 'app_colors.dart';

const testPersonImage =
    'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg';
const courseItemTest =
    'https://www.classcentral.com/report/wp-content/uploads/2022/05/Adobe-XD-BCG-Banner.png';

class Constants {
  static getDefaultPadding(BuildContext context) {
    return EdgeInsets.only(
        right: context.width * 0.04,
        left: context.width * 0.04,
        top: context.width * 0.05);
  }

  static getDefaultMargin(BuildContext context) {
    return EdgeInsets.all(context.width * 0.05);
  }


  static dynamic decodeJson(Response<dynamic> response) {
    var responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
  static void showToast(
      {required String message, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
    );
  }

  static PreferredSize getLightAppBar(BuildContext context,
      {String? title,
      bool moreHeight = true,
      Color? backgroundColor,
      Color? titleColor,
      Color? leadingColor,
      bool showAnimatedAppBar = true,
      Function()? onTap,
      final double? height,
      final List<Widget>? actions,
      final bool haveLeading = true}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        moreHeight ? 50 : height ?? 50,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: AppBar(
          toolbarHeight: moreHeight ? 50 : height ?? 30,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: haveLeading && Platform.isIOS
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: leadingColor ?? AppColors.secondaryColor),
                  onPressed: onTap ?? () => Navigator.pop(context),
                )
              : haveLeading && Platform.isAndroid
                  ? IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: leadingColor ?? AppColors.secondaryColor),
                      onPressed: onTap ?? () => Navigator.pop(context),
                    )
                  : null,
          title: Text(title ?? "",
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: titleColor ?? AppColors.secondaryColor,
                  )),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: context.width * 0.06,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
          actions: actions,
          // systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        ),
      ),
    );
  }
  static PreferredSize getDarkAppBar(BuildContext context,
      {required String title,
      bool moreHeight = true,
      Color? backgroundColor,
      Color? titleColor,
      Color? leadingColor,
      Function()? onTap,
      final double? height,
      final List<Widget>? actions,
      final bool haveLeading = true}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        moreHeight ? 50 : height ?? 50,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: AppBar(
          toolbarHeight: moreHeight ? 50 : height ?? 30,
          backgroundColor: backgroundColor ?? Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.light,
          ),
          leading: haveLeading && Platform.isIOS
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      color: leadingColor ?? AppColors.primaryColor),
                  onPressed: onTap ?? () => Navigator.pop(context),
                )
              : haveLeading && Platform.isAndroid
                  ? IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: leadingColor ?? AppColors.primaryColor),
                      onPressed: onTap ?? () => Navigator.pop(context),
                    )
                  : null,
          title: Text(title,
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: titleColor ?? AppColors.primaryColor,
                  )),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: context.width * 0.06,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          actions: actions,
          // systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        ),
      ),
    );
  }
}

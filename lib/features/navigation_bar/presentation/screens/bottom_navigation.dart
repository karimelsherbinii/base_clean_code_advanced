// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/hex_color.dart';
import '../cubit/nav_bar/bottom_navigation_cubit.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
      return BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeIcon,
                color: AppColors.hintColor,
                height: 30,
              ),
              label: AppLocalizations.of(context)!.translate('home'),
              activeIcon: SvgPicture.asset(
                AppAssets.homeIcon,
                height: 30,
                color: HexColor('008DCB'),
              ),
              backgroundColor: AppColors.hintColor,
            ),
            //!
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.coursesIcon,
                // color: HexColor('#B7BFBD'),
                height: 30,
              ),
              label: AppLocalizations.of(context)!.translate('courses')!,
              activeIcon: SvgPicture.asset(
                AppAssets.coursesIcon,
                height: 30,
                color: HexColor('008DCB'),
              ),
              // backgroundColor: Colors.white,
            ), //!

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.profileIconGray,
                height: 30,
                // color: HexColor('#B7BFBD'),
              ),
              label: AppLocalizations.of(context)!.translate('saved'),
              activeIcon: SvgPicture.asset(
                AppAssets.profileIconGray,
                height: 30,
                color: HexColor('008DCB'),
              ),
              // backgroundColor: Colors.white,
            ), //!

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.profileIcon,
                height: 30,
                // color: HexColor('#B7BFBD'),
              ),
              label: AppLocalizations.of(context)!.translate('profile'),
              activeIcon: SvgPicture.asset(
                AppAssets.profileIcon,
                height: 30,
                color: HexColor('008DCB'),
              ),
              // backgroundColor: Colors.white,
            ), //!
          ],
          selectedItemColor: HexColor('008DCB'),
          unselectedItemColor: AppColors.hintColor,
          selectedLabelStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
          currentIndex: context.watch<BottomNavigationCubit>().bottomNavIndex,
          onTap: (index) {
            currentIndex = index;
            BlocProvider.of<BottomNavigationCubit>(context)
                .navigationQueue
                .addLast(BlocProvider.of<BottomNavigationCubit>(context)
                    .bottomNavIndex);
            BlocProvider.of<BottomNavigationCubit>(context)
                .upadateBottomNavIndex(index);
          },
          elevation: 30);

      // ),
    });
  }
}

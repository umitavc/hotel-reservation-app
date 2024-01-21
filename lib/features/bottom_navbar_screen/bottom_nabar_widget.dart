import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/features/bottom_navbar_screen/bloc/bottom_nav_bar_bloc.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CoreBottomNavigationBarWidget extends StatelessWidget {
  CoreBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(16),
              ),
              border: Border(
                top: BorderSide(
                  color: AppColors.bottomnavbarcolor.withOpacity(0.3),
                  width: 6,
                ),
                left: BorderSide(
                  color: AppColors.bottomnavbarcolor.withOpacity(0.3),
                  width: 6,
                ),
              )),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.bottomnavbarcolor),
              unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.secondaryColor),
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                BlocProvider.of<BottomNavBarBloc>(context).add(TabChange(tabIndex: index));
              },
            ),
          ),
        );
      },
    );
  }

  final List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svg/home.svg',
        colorFilter: const ColorFilter.mode(AppColors.bottomnavbarcolor, BlendMode.srcIn),
      ),
      label: 'Anasayfa',
      activeIcon: SvgPicture.asset('assets/svg/home.svg', colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn)),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/Room-pink.svg'),
      label: 'Odalar',
      activeIcon: SvgPicture.asset('assets/svg/Room-pink.svg', colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn)),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/ortakalan.svg'),
      label: 'Ortak Alan',
      activeIcon: SvgPicture.asset('assets/svg/ortakalan.svg', colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn)),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svg/etkinlik.svg'),
      label: 'Etkinlikler',
      activeIcon: SvgPicture.asset('assets/svg/etkinlik.svg', colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn)),
    ),
  ];
}

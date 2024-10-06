import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/feature/home/presentation/page/cart/cart_view.dart';
import 'package:bookia_app/feature/home/presentation/page/home/page/home_view.dart';
import 'package:bookia_app/feature/home/presentation/page/wishlist/wishlist_view.dart';
import 'package:bookia_app/feature/profile/presentation/page/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;

  List<Widget> pages = const [
    HomeView(),
    WishlistView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.homeSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.homeSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.wishlistSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.wishlistSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcons.cartSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcons.cartSvg,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Notification'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.profileSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.profileSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

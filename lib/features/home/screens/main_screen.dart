import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/features/home/bloc/screen_cubit/screen_cubit.dart';
import 'package:news_app/features/home/screens/discover_screen.dart';
import 'package:news_app/features/home/screens/home_screen.dart';
import 'package:news_app/features/home/screens/saves_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> screens = [
    const HomeScreenUI(),
    const DiscoverScreen(),
    const SaveNewsScren(),
    const DiscoverScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, int>(
      builder: (context, state) {
        return PersistentTabView(
          context,
          controller: _controller,
          screens: screens,
          items: _navBarsItems(),
          confineInSafeArea: true,
          navBarHeight: 55.h,

          backgroundColor: Colors.grey.shade100,
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
          padding: const NavBarPadding.all(0),
        );
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.discover_13),
        title: ("Discover"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.save_2),
        title: ("Saved"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.user4),
        title: ("Profile"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

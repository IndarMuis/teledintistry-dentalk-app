import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:teledintistry/app/modules/add_queue/views/add_queue_view.dart';
import 'package:teledintistry/app/modules/chat_room/views/chat_room_view.dart';
import 'package:teledintistry/app/modules/chats/views/chats_view.dart';
import 'package:teledintistry/app/modules/histories/views/histories_view.dart';
import 'package:teledintistry/app/modules/home/views/home_view.dart';
import 'package:teledintistry/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:teledintistry/app/modules/profile/views/profile_view.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        HomeView(),
        HistoriesView(),
        NotifikasiView(),
        ChatsView(),
        ProfileView()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home_outlined,
            size: 30,
          ),
          title: ("Home"),
          textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryTextColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.history_outlined,
            size: 30,
          ),
          title: ("History"),
          textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryTextColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.notifications_active,
            size: 30,
            color: backgroundColor,
          ),
          activeColorPrimary: primaryColor,
          textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          inactiveColorPrimary: secondaryTextColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.chat_outlined,
            size: 30,
          ),
          title: ("Chats"),
          textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryTextColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person_outline,
            size: 30,
          ),
          title: ("Person"),
          textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryTextColor,
        ),
      ];
    }

    return PersistentTabView(
      context,
      onItemSelected: (value) {
        print(value);
      },
      navBarHeight: 65,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
                color: primaryColor.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 3,
                blurStyle: BlurStyle.outer)
          ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

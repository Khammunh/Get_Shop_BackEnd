// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxshop/users/fragments/favorites_fragment_screen.dart';
import 'package:getxshop/users/fragments/home_fragment_screen.dart';
import 'package:getxshop/users/fragments/order_fragment_screen.dart';
import 'package:getxshop/users/fragments/profile_fragment_screen.dart';
import 'package:getxshop/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  DashboardOfFragments({super.key});
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  List<Widget> _fragmentScreen = [
    const HomeFragmentScreen(),
    const FavoritesFragmentScreen(),
    const OrderFragmentScreen(),
    const ProfileFragmentScreen(),
  ];

  List _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home"
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites"
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites"
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Favorites"
    },
    {
      "active_icon": Icons.add_box,
      "non_active_icon": Icons.gif_box_outlined,
      "label": "Favorites"
    },
  ];

  RxInt _indexNumber = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Obx(
              () => _fragmentScreen[_indexNumber.value],
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: List.generate(
                4,
                (index) {
                  var navBtnProperty = _navigationButtonsProperties[index];
                  return BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(navBtnProperty["non_active_icon"]),
                      activeIcon: Icon(navBtnProperty["active_icon"]),
                      label: navBtnProperty["label"]);
                },
              ),
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
            ),
          ),
        );
      },
    );
  }
}
